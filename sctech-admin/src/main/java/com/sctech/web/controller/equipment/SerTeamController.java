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
import com.sctech.equipment.domain.SerTeam;
import com.sctech.equipment.service.ISerTeamService;
import com.sctech.framework.util.ShiroUtils;
import com.sctech.common.core.controller.BaseController;
import com.sctech.common.core.domain.AjaxResult;
import com.sctech.common.utils.poi.ExcelUtil;
import com.sctech.common.utils.StringUtils;
import com.sctech.common.core.domain.Ztree;

/**
 * 维修班组Controller
 * 
 * @author SCTech
 * @date 2020-03-10
 */
@Controller
@RequestMapping("/equipment/serteam")
public class SerTeamController extends BaseController
{
    private String prefix = "equipment/serteam";

    @Autowired
    private ISerTeamService serTeamService;

    @RequiresPermissions("equipment:serteam:view")
    @GetMapping()
    public String serteam()
    {
        return prefix + "/serteam";
    }

    /**
     * 查询维修班组树列表
     */
    @RequiresPermissions("equipment:serteam:list")
    @PostMapping("/list")
    @ResponseBody
    public List<SerTeam> list(SerTeam serTeam)
    {
        List<SerTeam> list = serTeamService.selectSerTeamList(serTeam);
        return list;
    }

    /**
     * 导出维修班组列表
     */
    @RequiresPermissions("equipment:serteam:export")
    @Log(title = "维修班组", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(SerTeam serTeam)
    {
        List<SerTeam> list = serTeamService.selectSerTeamList(serTeam);
        ExcelUtil<SerTeam> util = new ExcelUtil<SerTeam>(SerTeam.class);
        return util.exportExcel(list, "serteam");
    }

    /**
     * 新增维修班组
     */
    @GetMapping("/add/{parentId}")
    public String add(@PathVariable("parentId") Long parentId, ModelMap mmap)
    {
    	if (StringUtils.isNotNull(parentId))
        {
            mmap.put("serTeam", serTeamService.selectSerTeamById(parentId));
        }
        return prefix + "/add";
    }

    /**
     * 新增保存维修班组
     */
    @RequiresPermissions("equipment:serteam:add")
    @Log(title = "维修班组", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(SerTeam serTeam)
    {  	
    	serTeam.setCreateBy(ShiroUtils.getLoginName());
    	SerTeam info = serTeamService.selectSerTeamById(serTeam.getParentId());
    	if (StringUtils.isNotNull(info))
    	{
    		serTeam.setAncestors(info.getAncestors() + "," + serTeam.getParentId());
    		serTeam.setFullname(info.getFullname() + "->" + serTeam.getTeamName());
    	}
        return toAjax(serTeamService.insertSerTeam(serTeam));
    }

    /**
     * 修改维修班组
     */
    @GetMapping("/edit/{teamId}")
    public String edit(@PathVariable("teamId") Long teamId, ModelMap mmap)
    {
    	SerTeam serTeam = serTeamService.selectSerTeamById(teamId);
        if (StringUtils.isNotNull(serTeam) && 1L == teamId)
        {
        	serTeam.setParentName("无");
        }
        mmap.put("serTeam", serTeam);
        return prefix + "/edit";
    }

    /**
     * 修改保存维修班组
     */
    @RequiresPermissions("equipment:serteam:edit")
    @Log(title = "维修班组", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(SerTeam serTeam)
    {
    	serTeam.setUpdateBy(ShiroUtils.getLoginName());
    	SerTeam info = serTeamService.selectSerTeamById(serTeam.getParentId());
    	if (StringUtils.isNotNull(info))
    	{
    		serTeam.setAncestors(info.getAncestors() + "," + serTeam.getParentId());
    		serTeam.setFullname(info.getFullname() + "->" + serTeam.getTeamName());
    	}
        return toAjax(serTeamService.updateSerTeam(serTeam));
    }

    /**
     * 删除
     */
    @RequiresPermissions("equipment:serteam:remove")
    @Log(title = "维修班组", businessType = BusinessType.DELETE)
    @GetMapping("/remove/{teamId}")
    @ResponseBody
    public AjaxResult remove(@PathVariable("teamId") Long teamId)
    {
        return toAjax(serTeamService.deleteSerTeamById(teamId));
    }

    /**
     * 选择维修班组树
     */
    @GetMapping(value = { "/selectSerteamTree/{teamId}", "/selectSerteamTree/" })
    public String selectSerteamTree(@PathVariable(value = "teamId", required = false) Long teamId, ModelMap mmap)
    {
        if (StringUtils.isNotNull(teamId))
        {
            mmap.put("serTeam", serTeamService.selectSerTeamById(teamId));
        }
        return prefix + "/tree";
    }

    /**
     * 加载维修班组树列表
     */
    @GetMapping("/treeData")
    @ResponseBody
    public List<Ztree> treeData()
    {
        List<Ztree> ztrees = serTeamService.selectSerTeamTree();
        return ztrees;
    }
    
    /**
     * 维修班组状态修改
     */
    @Log(title = "维修班组管理", businessType = BusinessType.UPDATE)
    @RequiresPermissions("equipment:serteam:edit")
    @PostMapping("/updateStatus")
    @ResponseBody
    public AjaxResult updateStatus(SerTeam serTeam)
    {
        return toAjax(serTeamService.updateStatus(serTeam));
    }
}
