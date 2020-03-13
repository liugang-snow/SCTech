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
import com.sctech.common.core.page.TableDataInfo;
import com.sctech.common.enums.BusinessType;
import com.sctech.common.utils.poi.ExcelUtil;
import com.sctech.equipment.domain.EquContract;
import com.sctech.equipment.service.IEquContractService;
import com.sctech.framework.util.ShiroUtils;

/**
 * 设备合同Controller
 * 
 * @author SCTech
 * @date 2020-02-18
 */
@Controller
@RequestMapping("/equipment/equcontract")
public class EquContractController extends BaseController
{
    private String prefix = "equipment/equcontract";

    @Autowired
    private IEquContractService equContractService;

    @RequiresPermissions("equipment:equcontract:view")
    @GetMapping()
    public String equcontract()
    {
        return prefix + "/equcontract";
    }
    
    /**
     * 设备合同查看
     */
    @GetMapping("/detail/{conId}")
    public String detail(@PathVariable("conId") Long conId, ModelMap mmap)
    {
        EquContract equContract = equContractService.selectEquContractById(conId);
        mmap.put("equContract", equContract);
        return prefix + "/detail";
    }

    /**
     * 查询设备合同列表
     */
    @RequiresPermissions("equipment:equcontract:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(EquContract equContract)
    {
        startPage();
        List<EquContract> list = equContractService.selectEquContractList(equContract);
        return getDataTable(list);
    }

    /**
     * 导出设备合同列表
     */
    @RequiresPermissions("equipment:equcontract:export")
    @Log(title = "设备合同", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(EquContract equContract)
    {
        List<EquContract> list = equContractService.selectEquContractList(equContract);
        ExcelUtil<EquContract> util = new ExcelUtil<EquContract>(EquContract.class);
        return util.exportExcel(list, "equcontract");
    }

    /**
     * 新增设备合同
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存设备合同
     */
    @RequiresPermissions("equipment:equcontract:add")
    @Log(title = "设备合同", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(EquContract equContract)
    {
    	equContract.setConGuid(UUID.randomUUID().toString().replace("-", ""));
    	equContract.setCreateBy(ShiroUtils.getLoginName());
        return toAjax(equContractService.insertEquContract(equContract));
    }

    /**
     * 修改设备合同
     */
    @GetMapping("/edit/{conId}")
    public String edit(@PathVariable("conId") Long conId, ModelMap mmap)
    {
        EquContract equContract = equContractService.selectEquContractById(conId);
        mmap.put("equContract", equContract);
        return prefix + "/edit";
    }

    /**
     * 修改保存设备合同
     */
    @RequiresPermissions("equipment:equcontract:edit")
    @Log(title = "设备合同", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(EquContract equContract)
    {
    	equContract.setUpdateBy(ShiroUtils.getLoginName());
        return toAjax(equContractService.updateEquContract(equContract));
    }

    /**
     * 删除设备合同
     */
    @RequiresPermissions("equipment:equcontract:remove")
    @Log(title = "设备合同", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(equContractService.deleteEquContractByIds(ids));
    }
    
    /**
     * 设备档案-选择合同
     */
    @GetMapping("/selectCons")
    public String selectCons()
    {
        return prefix + "/selectCons";
    }
}
