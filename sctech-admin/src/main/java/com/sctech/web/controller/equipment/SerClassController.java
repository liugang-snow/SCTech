package com.sctech.web.controller.equipment;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.sctech.common.annotation.Log;
import com.sctech.common.enums.BusinessType;
import com.sctech.equipment.domain.SerClass;
import com.sctech.equipment.service.ISerClassService;
import com.sctech.framework.util.ShiroUtils;
import com.sctech.common.core.controller.BaseController;
import com.sctech.common.core.domain.AjaxResult;
import com.sctech.common.utils.poi.ExcelUtil;
import com.sctech.common.utils.StringUtils;
import com.sctech.common.core.domain.Ztree;

/**
 * 维修分类Controller
 * 
 * @author SCTech
 * @date 2020-03-12
 */
@Controller
@RequestMapping("/equipment/serclass")
public class SerClassController extends BaseController
{
    private String prefix = "equipment/serclass";

    @Autowired
    private ISerClassService serClassService;

    @RequiresPermissions("equipment:serclass:view")
    @GetMapping()
    public String serclass()
    {
        return prefix + "/serclass";
    }

    /**
     * 查询维修分类树列表
     */
    @RequiresPermissions("equipment:serclass:list")
    @PostMapping("/list")
    @ResponseBody
    public List<SerClass> list(SerClass serClass)
    {
        List<SerClass> list = serClassService.selectSerClassList(serClass);
        return list;
    }

    /**
     * 导出维修分类列表
     */
    @RequiresPermissions("equipment:serclass:export")
    @Log(title = "维修分类", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SerClass serClass)
    {
        List<SerClass> list = serClassService.selectSerClassList(serClass);
        ExcelUtil<SerClass> util = new ExcelUtil<SerClass>(SerClass.class);
        return util.exportExcel(list, "serclass");
    }

    /**
     * 新增维修分类
     */
    @GetMapping("/add/{parentId}")
    public String add(@PathVariable("parentId") Long parentId, ModelMap mmap)
    {
        if (StringUtils.isNotNull(parentId))
        {
            mmap.put("serClass", serClassService.selectSerClassById(parentId));
        }
        return prefix + "/add";
    }

    /**
     * 新增保存维修分类
     */
    @RequiresPermissions("equipment:serclass:add")
    @Log(title = "维修分类", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(SerClass serClass)
    {  	
		serClass.setCreateBy(ShiroUtils.getLoginName());
		SerClass info = serClassService.selectSerClassById(serClass.getParentId());
    	if (StringUtils.isNotNull(info))
    	{
    		serClass.setAncestors(info.getAncestors() + "," + serClass.getParentId());
    		serClass.setFullname(info.getFullname() + "->" + serClass.getSclassName());
    	}
        return toAjax(serClassService.insertSerClass(serClass));
    }

    /**
     * 修改维修分类
     */
    @GetMapping("/edit/{sclassId}")
    public String edit(@PathVariable("sclassId") Long sclassId, ModelMap mmap)
    {
        SerClass serClass = serClassService.selectSerClassById(sclassId);
        if (StringUtils.isNotNull(serClass) && 1L == sclassId)
        {
        	serClass.setParentName("无");
        }
        mmap.put("serClass", serClass);
        return prefix + "/edit";
    }

    /**
     * 修改保存维修分类
     */
    @RequiresPermissions("equipment:serclass:edit")
    @Log(title = "维修分类", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(SerClass serClass)
    {
		serClass.setUpdateBy(ShiroUtils.getLoginName());
		SerClass info = serClassService.selectSerClassById(serClass.getParentId());
    	if (StringUtils.isNotNull(info))
    	{
    		serClass.setAncestors(info.getAncestors() + "," + serClass.getParentId());
    		serClass.setFullname(info.getFullname() + "->" + serClass.getSclassName());
    	}
        return toAjax(serClassService.updateSerClass(serClass));
    }

    /**
     * 删除
     */
    @RequiresPermissions("equipment:serclass:remove")
    @Log(title = "维修分类", businessType = BusinessType.DELETE)
    @GetMapping("/remove/{sclassId}")
    @ResponseBody
    public AjaxResult remove(@PathVariable("sclassId") Long sclassId)
    {
        return toAjax(serClassService.deleteSerClassById(sclassId));
    }

    /**
     * 选择维修分类树
     */
    @GetMapping(value = { "/selectSerclassTree/{sclassId}", "/selectSerclassTree/" })
    public String selectSerclassTree(@PathVariable(value = "sclassId", required = false) Long sclassId, ModelMap mmap)
    {
        if (StringUtils.isNotNull(sclassId))
        {
            mmap.put("serClass", serClassService.selectSerClassById(sclassId));
        }
        return prefix + "/tree";
    }

    /**
     * 加载维修分类树列表
     */
    @GetMapping("/treeData")
    @ResponseBody
    public List<Ztree> treeData()
    {
        List<Ztree> ztrees = serClassService.selectSerClassTree();
        return ztrees;
    }
    
    /**
     * 维修分类状态修改
     */
    @Log(title = "维修分类管理", businessType = BusinessType.UPDATE)
    @RequiresPermissions("equipment:serclass:edit")
    @PostMapping("/changeStatus")
    @ResponseBody
    public AjaxResult changeStatus(SerClass serClass)
    {
        return toAjax(serClassService.changeStatus(serClass));
    }
}
