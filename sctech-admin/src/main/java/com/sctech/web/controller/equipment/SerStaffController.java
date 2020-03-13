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
import com.sctech.equipment.domain.SerStaff;
import com.sctech.equipment.service.ISerStaffService;
import com.sctech.framework.util.ShiroUtils;
import com.sctech.common.core.controller.BaseController;
import com.sctech.common.core.domain.AjaxResult;
import com.sctech.common.utils.poi.ExcelUtil;
import com.sctech.common.core.page.TableDataInfo;

/**
 * 维修人员Controller
 * 
 * @author SCTech
 * @date 2020-03-11
 */
@Controller
@RequestMapping("/equipment/serstaff")
public class SerStaffController extends BaseController
{
    private String prefix = "equipment/serstaff";

    @Autowired
    private ISerStaffService serStaffService;

    @RequiresPermissions("equipment:serstaff:view")
    @GetMapping()
    public String serstaff()
    {
        return prefix + "/serstaff";
    }

    /**
     * 查询维修人员列表
     */
    @RequiresPermissions("equipment:serstaff:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SerStaff serStaff)
    {
        startPage();
        List<SerStaff> list = serStaffService.selectSerStaffList(serStaff);
        return getDataTable(list);
    }

    /**
     * 导出维修人员列表
     */
    @RequiresPermissions("equipment:serstaff:export")
    @Log(title = "维修人员", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SerStaff serStaff)
    {
        List<SerStaff> list = serStaffService.selectSerStaffList(serStaff);
        ExcelUtil<SerStaff> util = new ExcelUtil<SerStaff>(SerStaff.class);
        return util.exportExcel(list, "serstaff");
    }

    /**
     * 新增维修人员
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存维修人员
     */
    @RequiresPermissions("equipment:serstaff:add")
    @Log(title = "维修人员", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(SerStaff serStaff)
    {  	
		serStaff.setCreateBy(ShiroUtils.getLoginName());
        return toAjax(serStaffService.insertSerStaff(serStaff));
    }

    /**
     * 修改维修人员
     */
    @GetMapping("/edit/{staffId}")
    public String edit(@PathVariable("staffId") Long staffId, ModelMap mmap)
    {
        SerStaff serStaff = serStaffService.selectSerStaffById(staffId);
        mmap.put("serStaff", serStaff);
        return prefix + "/edit";
    }

    /**
     * 修改保存维修人员
     */
    @RequiresPermissions("equipment:serstaff:edit")
    @Log(title = "维修人员", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(SerStaff serStaff)
    {
		serStaff.setUpdateBy(ShiroUtils.getLoginName());
        return toAjax(serStaffService.updateSerStaff(serStaff));
    }

    /**
     * 删除维修人员
     */
    @RequiresPermissions("equipment:serstaff:remove")
    @Log(title = "维修人员", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(serStaffService.deleteSerStaffByIds(ids));
    }
}
