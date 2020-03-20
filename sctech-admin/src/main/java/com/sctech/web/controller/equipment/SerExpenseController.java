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
import com.sctech.equipment.domain.SerExpense;
import com.sctech.equipment.service.ISerExpenseService;
import com.sctech.framework.util.ShiroUtils;
import com.sctech.common.core.controller.BaseController;
import com.sctech.common.core.domain.AjaxResult;
import com.sctech.common.utils.poi.ExcelUtil;
import com.sctech.common.core.page.TableDataInfo;

/**
 * 维修花费Controller
 * 
 * @author SCTech
 * @date 2020-03-19
 */
@Controller
@RequestMapping("/equipment/serexpense")
public class SerExpenseController extends BaseController
{
    private String prefix = "equipment/serexpense";

    @Autowired
    private ISerExpenseService serExpenseService;

    @RequiresPermissions("equipment:serexpense:view")
    @GetMapping()
    public String serexpense()
    {
        return prefix + "/serexpense";
    }

    @GetMapping("/expenses/{scardId}")
    public String expenses(@PathVariable("scardId") Long scardId, ModelMap mmap)
    {
    	mmap.put("scardId", scardId);
        return prefix + "/serexpense";
    }
    
    /**
     * 查询维修花费列表
     */
    @RequiresPermissions("equipment:serexpense:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SerExpense serExpense)
    {
        startPage();
        List<SerExpense> list = serExpenseService.selectSerExpenseList(serExpense);
        return getDataTable(list);
    }

    /**
     * 导出维修花费列表
     */
    @RequiresPermissions("equipment:serexpense:export")
    @Log(title = "维修花费", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SerExpense serExpense)
    {
        List<SerExpense> list = serExpenseService.selectSerExpenseList(serExpense);
        ExcelUtil<SerExpense> util = new ExcelUtil<SerExpense>(SerExpense.class);
        return util.exportExcel(list, "serexpense");
    }

    /**
     * 新增维修花费
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }
    
    /**
     * 新增维修花费
     */
    @GetMapping("/adde/{scardId}")
    public String adde(@PathVariable("scardId") Long scardId, ModelMap mmap)
    {
    	mmap.put("scardId", scardId);
        return prefix + "/add";
    }

    /**
     * 新增保存维修花费
     */
    @RequiresPermissions("equipment:serexpense:add")
    @Log(title = "维修花费", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(SerExpense serExpense)
    {  	
    	serExpense.setExpenseSum(serExpense.getExpenseQuan() * serExpense.getExpensePrice());
		serExpense.setCreateBy(ShiroUtils.getLoginName());
        return toAjax(serExpenseService.insertSerExpense(serExpense));
    }

    /**
     * 修改维修花费
     */
    @GetMapping("/edit/{expenseId}")
    public String edit(@PathVariable("expenseId") Long expenseId, ModelMap mmap)
    {
        SerExpense serExpense = serExpenseService.selectSerExpenseById(expenseId);
        mmap.put("serExpense", serExpense);
        return prefix + "/edit";
    }

    /**
     * 修改保存维修花费
     */
    @RequiresPermissions("equipment:serexpense:edit")
    @Log(title = "维修花费", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(SerExpense serExpense)
    {
    	serExpense.setExpenseSum(serExpense.getExpenseQuan() * serExpense.getExpensePrice());
		serExpense.setUpdateBy(ShiroUtils.getLoginName());
        return toAjax(serExpenseService.updateSerExpense(serExpense));
    }

    /**
     * 删除维修花费
     */
    @RequiresPermissions("equipment:serexpense:remove")
    @Log(title = "维修花费", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(serExpenseService.deleteSerExpenseByIds(ids));
    }
}
