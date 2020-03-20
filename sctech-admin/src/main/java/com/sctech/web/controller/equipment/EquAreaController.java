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
import com.sctech.common.enums.BusinessType;
import com.sctech.equipment.domain.EquArea;
import com.sctech.equipment.service.IEquAreaService;
import com.sctech.framework.util.ShiroUtils;
import com.sctech.common.core.controller.BaseController;
import com.sctech.common.core.domain.AjaxResult;
import com.sctech.common.utils.poi.ExcelUtil;
import com.sctech.common.utils.StringUtils;
import com.sctech.common.core.domain.Ztree;

/**
 * 设备所在区域Controller
 * 
 * @author SCTech
 * @date 2020-03-05
 */
@Controller
@RequestMapping("/equipment/equarea")
public class EquAreaController extends BaseController
{
    private String prefix = "equipment/equarea";

    @Autowired
    private IEquAreaService equAreaService;

    @RequiresPermissions("equipment:equarea:view")
    @GetMapping()
    public String equarea()
    {
        return prefix + "/equarea";
    }

    /**
     * 查询设备所在区域树列表
     */
    @RequiresPermissions("equipment:equarea:list")
    @PostMapping("/list")
    @ResponseBody
    public List<EquArea> list(EquArea equArea)
    {
        List<EquArea> list = equAreaService.selectEquAreaList(equArea);
        return list;
    }

    /**
     * 导出设备所在区域列表
     */
    @RequiresPermissions("equipment:equarea:export")
    @Log(title = "设备所在区域", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(EquArea equArea)
    {
        List<EquArea> list = equAreaService.selectEquAreaList(equArea);
        ExcelUtil<EquArea> util = new ExcelUtil<EquArea>(EquArea.class);
        return util.exportExcel(list, "equarea");
    }

    /**
     * 新增设备所在区域
     */
    @GetMapping("/add/{parentId}")
    public String add(@PathVariable("parentId") Long parentId, ModelMap mmap)
    {
        if (StringUtils.isNotNull(parentId))
        {
            mmap.put("equArea", equAreaService.selectEquAreaById(parentId));
        }
        return prefix + "/add";
    }

    /**
     * 新增保存设备所在区域
     */
    @RequiresPermissions("equipment:equarea:add")
    @Log(title = "设备所在区域", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(EquArea equArea)
    {
    	equArea.setAreaGuid(UUID.randomUUID().toString().replace("-",""));
    	equArea.setCreateBy(ShiroUtils.getLoginName());
    	
    	EquArea info = equAreaService.selectEquAreaById(equArea.getParentId());
    	if (StringUtils.isNotNull(info))
    	{
    		equArea.setAncestors(info.getAncestors() + "," + equArea.getParentId());
    		equArea.setFullname(info.getFullname() + "->" + equArea.getAreaName());
    	}
        return toAjax(equAreaService.insertEquArea(equArea));
    }

    /**
     * 修改设备所在区域
     */
    @GetMapping("/edit/{areaId}")
    public String edit(@PathVariable("areaId") Long areaId, ModelMap mmap)
    {
        EquArea equArea = equAreaService.selectEquAreaById(areaId);
        if (StringUtils.isNotNull(equArea) && 1L == areaId)
        {
        	equArea.setParentName("无");
        }
        mmap.put("equArea", equArea);
        return prefix + "/edit";
    }

    /**
     * 修改保存设备所在区域
     */
    @RequiresPermissions("equipment:equarea:edit")
    @Log(title = "设备所在区域", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(EquArea equArea)
    {
    	equArea.setUpdateBy(ShiroUtils.getLoginName());
    	EquArea info = equAreaService.selectEquAreaById(equArea.getParentId());
    	if (StringUtils.isNotNull(info))
    	{
    		equArea.setAncestors(info.getAncestors() + "," + equArea.getParentId());
    		equArea.setFullname(info.getFullname() + "->" + equArea.getAreaName());
    	}
        return toAjax(equAreaService.updateEquArea(equArea));
    }

    /**
     * 删除
     */
    @RequiresPermissions("equipment:equarea:remove")
    @Log(title = "设备所在区域", businessType = BusinessType.DELETE)
    @GetMapping("/remove/{areaId}")
    @ResponseBody
    public AjaxResult remove(@PathVariable("areaId") Long areaId)
    {
        return toAjax(equAreaService.deleteEquAreaById(areaId));
    }

    /**
     * 选择设备所在区域树
     */
    @GetMapping(value = { "/selectEquareaTree/{areaId}", "/selectEquareaTree/" })
    public String selectEquareaTree(@PathVariable(value = "areaId", required = false) Long areaId, ModelMap mmap)
    {
        if (StringUtils.isNotNull(areaId))
        {
            mmap.put("equArea", equAreaService.selectEquAreaById(areaId));
        }
        return prefix + "/tree";
    }

    /**
     * 加载设备所在区域树列表
     */
    @GetMapping("/treeData")
    @ResponseBody
    public List<Ztree> treeData()
    {
        List<Ztree> ztrees = equAreaService.selectEquAreaTree();
        return ztrees;
    }
    
    /**
     * 设备所在区域状态修改
     */
    @Log(title = "设备所在区域管理", businessType = BusinessType.UPDATE)
    @RequiresPermissions("equipment:equarea:edit")
    @PostMapping("/updateStatus")
    @ResponseBody
    public AjaxResult updateStatus(EquArea equArea)
    {
        return toAjax(equAreaService.updateStatus(equArea));
    }
}
