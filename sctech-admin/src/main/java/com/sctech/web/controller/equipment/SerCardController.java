package com.sctech.web.controller.equipment;

import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.sctech.equipment.domain.SerCard;
import com.sctech.equipment.domain.SerStaff;
import com.sctech.equipment.service.ISerCardService;
import com.sctech.equipment.service.ISerStaffService;
import com.sctech.framework.util.ShiroUtils;
import com.sctech.common.core.controller.BaseController;
import com.sctech.common.core.domain.AjaxResult;
import com.sctech.common.utils.DateUtils;
import com.sctech.common.utils.poi.ExcelUtil;
import com.sctech.common.core.page.TableDataInfo;

/**
 * 维修工单Controller
 * 
 * @author SCTech
 * @date 2020-03-16
 */
@Controller
@RequestMapping("/equipment/sercard")
public class SerCardController extends BaseController
{
    private String prefix = "equipment/sercard";

    @Autowired
    private ISerCardService serCardService;
    
    @Autowired
    private ISerStaffService serStaffService;
    
    @RequiresPermissions("equipment:sercard:view")
    @GetMapping()
    public String sercard()
    {
        return prefix + "/sercard";
    }

    /**
     * 查询维修工单列表
     */
    @RequiresPermissions("equipment:sercard:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(SerCard serCard)
    {
        startPage();
        List<SerCard> list = serCardService.selectSerCardList(serCard);
        return getDataTable(list);
    }

    /**
     * 导出维修工单列表
     */
    @RequiresPermissions("equipment:sercard:export")
    @Log(title = "维修工单", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SerCard serCard)
    {
        List<SerCard> list = serCardService.selectSerCardList(serCard);
        ExcelUtil<SerCard> util = new ExcelUtil<SerCard>(SerCard.class);
        return util.exportExcel(list, "sercard");
    }

    /**
     * 新增维修工单
     */
    @GetMapping("/add")
    public String add(ModelMap mmap)
    {
    	SerCard serCard = new SerCard();
    	
    	//获取当前时间
     	Date now = DateUtils.getNowDate();
     	String code = "WXD" + new SimpleDateFormat("yyyyMMddHHmmssSSS").format(now);
     	   	
    	serCard.setScardCode(code);
    	
    	mmap.put("serCard", serCard);
        return prefix + "/add";
    }

    /**
     * 新增保存维修工单
     */
    @RequiresPermissions("equipment:sercard:add")
    @Log(title = "维修工单", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(SerCard serCard)
    {  	
		serCard.setCreateBy(ShiroUtils.getLoginName());
        return toAjax(serCardService.insertSerCard(serCard));
    }

    /**
     * 修改维修工单
     */
    @GetMapping("/edit/{scardId}")
    public String edit(@PathVariable("scardId") Long scardId, ModelMap mmap)
    {
        SerCard serCard = serCardService.selectSerCardById(scardId);
        mmap.put("serCard", serCard);
        mmap.put("staffs", serStaffService.selectSerStaffAll(serCard.getTeamId()));
        return prefix + "/edit";
    }

    /**
     * 修改保存维修工单
     */
    @RequiresPermissions("equipment:sercard:edit")
    @Log(title = "维修工单", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(SerCard serCard)
    {
		serCard.setUpdateBy(ShiroUtils.getLoginName());
        return toAjax(serCardService.updateSerCard(serCard));
    }

    /**
     * 删除维修工单
     */
    @RequiresPermissions("equipment:sercard:remove")
    @Log(title = "维修工单", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(serCardService.deleteSerCardByIds(ids));
    }
    
    /**
     * 维修评价
     */
    @GetMapping("/evaluation/{scardId}")
    public String evaluation(@PathVariable("scardId") Long scardId, ModelMap mmap)
    {
        SerCard serCard = serCardService.selectSerCardById(scardId);
        List<SerStaff> serStaffs = serStaffService.selectSerStaffs(scardId);
        String serStaffsName = "";
        for (SerStaff serStaff : serStaffs)
        {
        	serStaffsName += serStaff.getUserName() + "、";
        }
        
        mmap.put("serCard", serCard);
        mmap.put("serStaffsName", serStaffsName.substring(0, serStaffsName.length() - 1 ));
        return prefix + "/evaluation";
    }
    
}
