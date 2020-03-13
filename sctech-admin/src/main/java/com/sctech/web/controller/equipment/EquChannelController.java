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
import com.sctech.equipment.domain.EquChannel;
import com.sctech.equipment.service.IEquChannelService;
import com.sctech.framework.util.ShiroUtils;
import com.sctech.common.core.controller.BaseController;
import com.sctech.common.core.domain.AjaxResult;
import com.sctech.common.utils.poi.ExcelUtil;
import com.sctech.common.core.page.TableDataInfo;

/**
 * 设备位号Controller
 * 
 * @author SCTech
 * @date 2020-03-06
 */
@Controller
@RequestMapping("/equipment/equchannel")
public class EquChannelController extends BaseController
{
    private String prefix = "equipment/equchannel";

    @Autowired
    private IEquChannelService equChannelService;

    @RequiresPermissions("equipment:equchannel:view")
    @GetMapping()
    public String equchannel()
    {
        return prefix + "/equchannel";
    }
    
    @GetMapping("/channels/{equId}")
    public String channels(@PathVariable("equId") Long equId, ModelMap mmap)
    {
    	mmap.put("equId", equId);
        return prefix + "/equchannel";
    }

    /**
     * 查询设备位号列表
     */
    @RequiresPermissions("equipment:equchannel:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(EquChannel equChannel)
    {
        startPage();
        List<EquChannel> list = equChannelService.selectEquChannelList(equChannel);
        return getDataTable(list);
    }

    /**
     * 导出设备位号列表
     */
    @RequiresPermissions("equipment:equchannel:export")
    @Log(title = "设备位号", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(EquChannel equChannel)
    {
        List<EquChannel> list = equChannelService.selectEquChannelList(equChannel);
        ExcelUtil<EquChannel> util = new ExcelUtil<EquChannel>(EquChannel.class);
        return util.exportExcel(list, "equchannel");
    }

    /**
     * 新增设备位号
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增设备位号
     */
    @GetMapping("/adde/{equId}")
    public String adde(@PathVariable("equId") Long equId, ModelMap mmap)
    {
    	mmap.put("equId", equId);
        return prefix + "/add";
    }
    
    /**
     * 新增保存设备位号
     */
    @RequiresPermissions("equipment:equchannel:add")
    @Log(title = "设备位号", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(EquChannel equChannel)
    {
    	equChannel.setChannelGuid(UUID.randomUUID().toString().replace("-", ""));
    	equChannel.setCreateBy(ShiroUtils.getLoginName());
        return toAjax(equChannelService.insertEquChannel(equChannel));
    }

    /**
     * 修改设备位号
     */
    @GetMapping("/edit/{channelId}")
    public String edit(@PathVariable("channelId") Long channelId, ModelMap mmap)
    {
        EquChannel equChannel = equChannelService.selectEquChannelById(channelId);
        mmap.put("equChannel", equChannel);
        return prefix + "/edit";
    }

    /**
     * 修改保存设备位号
     */
    @RequiresPermissions("equipment:equchannel:edit")
    @Log(title = "设备位号", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(EquChannel equChannel)
    {
    	equChannel.setUpdateBy(ShiroUtils.getLoginName()); 	
        return toAjax(equChannelService.updateEquChannel(equChannel));
    }

    /**
     * 删除设备位号
     */
    @RequiresPermissions("equipment:equchannel:remove")
    @Log(title = "设备位号", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(equChannelService.deleteEquChannelByIds(ids));
    }
}
