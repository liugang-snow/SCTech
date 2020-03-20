package com.sctech.web.controller.equipment;

import java.util.List;
import java.util.UUID;

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
import com.sctech.common.core.controller.BaseController;
import com.sctech.common.core.domain.AjaxResult;
import com.sctech.common.core.domain.Ztree;
import com.sctech.common.enums.BusinessType;
import com.sctech.common.utils.StringUtils;
import com.sctech.common.utils.poi.ExcelUtil;
import com.sctech.equipment.domain.EquClass;
import com.sctech.equipment.service.IEquClassService;
import com.sctech.framework.util.ShiroUtils;

/**
 * 设备分类Controller
 * 
 * @author SCTech
 * @date 2020-02-11
 */
@Controller
@RequestMapping("/equipment/equclass")
public class EquClassController extends BaseController
{
    private String prefix = "equipment/equclass";

    @Autowired
    private IEquClassService equClassService;

    @RequiresPermissions("equipment:equclass:view")
    @GetMapping()
    public String equclass()
    {
        return prefix + "/equclass";
    }
    
    /**
     * 设备分类查看
     */
    @GetMapping("/detail/{classId}")
    public String detail(@PathVariable("classId") Long classId, ModelMap mmap)
    {
        EquClass equClass = equClassService.selectEquClassById(classId);
        mmap.put("equClass", equClass);
        return prefix + "/detail";
    }

    /**
     * 查询设备分类树列表
     */
    @RequiresPermissions("equipment:equclass:list")
    @PostMapping("/list")
    @ResponseBody
    public List<EquClass> list(EquClass equClass)
    {
        List<EquClass> list = equClassService.selectEquClassList(equClass);
        return list;
    }

    /**
     * 导出设备分类列表
     */
    @RequiresPermissions("equipment:equclass:export")
    @Log(title = "设备分类", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(EquClass equClass)
    {
        List<EquClass> list = equClassService.selectEquClassList(equClass);
        ExcelUtil<EquClass> util = new ExcelUtil<EquClass>(EquClass.class);
        return util.exportExcel(list, "equclass");
    }
  
    /**
     * 新增设备分类
     */
    @GetMapping("/add/{parentId}")
    public String add(@PathVariable("parentId") Long parentId, ModelMap mmap)
    {
    	if (StringUtils.isNotNull(parentId))
        {
    		mmap.put("equClass", equClassService.selectEquClassById(parentId));
        }
        return prefix + "/add";
    }
    
    /**
     * 新增保存设备分类
     */
    @RequiresPermissions("equipment:equclass:add")
    @Log(title = "设备分类", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(EquClass equClass)
    {
    	if(!equClassService.checkClassNameUnique(equClass))
    	{
    		return error("新增设备分类'" + equClass.getClassName() + "'失败，名称已存在");
    	}
    	equClass.setClassGuid(UUID.randomUUID().toString().replace("-",""));
    	equClass.setCreateBy(ShiroUtils.getLoginName());
    	
    	EquClass info = equClassService.selectEquClassById(equClass.getParentId());
    	if (StringUtils.isNotNull(info))
    	{
    		equClass.setAncestors(info.getAncestors() + "," + equClass.getParentId());
    		equClass.setFullname(info.getFullname() + "->" + equClass.getClassName());
    	}   	
        return toAjax(equClassService.insertEquClass(equClass));
    }

    /**
     * 修改设备分类
     */
    @GetMapping("/edit/{classId}")
    public String edit(@PathVariable("classId") Long classId, ModelMap mmap)
    {
        EquClass equClass = equClassService.selectEquClassById(classId);
        if (StringUtils.isNotNull(equClass) && 1L == classId)
        {
        	equClass.setParentName("无");
        }
        mmap.put("equClass", equClass);
        return prefix + "/edit";
    }

    /**
     * 修改保存设备分类
     */
    @RequiresPermissions("equipment:equclass:edit")
    @Log(title = "设备分类", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(EquClass equClass)
    {
        if (!equClassService.checkClassNameUnique(equClass))
        {
            return error("修改设备分类'" + equClass.getClassName() + "'失败，名称已存在");
        }
        else if (equClass.getParentId().equals(equClass.getClassId()))
        {
            return error("修改部门'" + equClass.getClassName() + "'失败，上级分类不能是自己");
        }      
    	equClass.setUpdateBy(ShiroUtils.getLoginName());
    	EquClass info = equClassService.selectEquClassById(equClass.getParentId());
    	if (StringUtils.isNotNull(info))
    	{
    		equClass.setAncestors(info.getAncestors() + "," + equClass.getParentId());
    		equClass.setFullname(info.getFullname() + "->" + equClass.getClassName());
    	}
        return toAjax(equClassService.updateEquClass(equClass));
    }

    /**
     * 删除
     */
    @RequiresPermissions("equipment:equclass:remove")
    @Log(title = "设备分类", businessType = BusinessType.DELETE)
    @GetMapping("/remove/{classId}")
    @ResponseBody
    public AjaxResult remove(@PathVariable("classId") Long classId)
    {
        return toAjax(equClassService.deleteEquClassById(classId));
    }

    /**
     * 选择设备分类树
     */
    @GetMapping(value = { "/selectEquclassTree/{classId}", "/selectEquclassTree/" })
    public String selectEquclassTree(@PathVariable(value = "classId", required = false) Long classId, ModelMap mmap)
    {
        if (StringUtils.isNotNull(classId))
        {
            mmap.put("equClass", equClassService.selectEquClassById(classId));
        }
        return prefix + "/tree";
    }

    /**
     * 加载设备分类树列表
     */
    @GetMapping("/treeData")
    @ResponseBody
    public List<Ztree> treeData()
    {
        List<Ztree> ztrees = equClassService.selectEquClassTree();
        return ztrees;
    }
    
    /**
     * 设备分类状态修改
     */
    @Log(title = "设备分类管理", businessType = BusinessType.UPDATE)
    @RequiresPermissions("equipment:equclass:edit")
    @PostMapping("/updateStatus")
    @ResponseBody
    public AjaxResult updateStatus(EquClass equClass)
    {
        return toAjax(equClassService.updateStatus(equClass));
    }
}
