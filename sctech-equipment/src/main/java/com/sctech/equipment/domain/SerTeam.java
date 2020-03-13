package com.sctech.equipment.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.sctech.common.annotation.Excel;
import com.sctech.common.core.domain.TreeEntity;

/**
 * 维修班组对象 ser_team
 * 
 * @author SCTech
 * @date 2020-03-10
 */
public class SerTeam extends TreeEntity
{
    private static final long serialVersionUID = 1L;

    /** ID 主键 */
    private Long teamId;

    /** Guid */
    private String teamGuid;

    /** 班组编码 */
    @Excel(name = "班组编码")
    private String teamCode;

    /** 班组名称 */
    @Excel(name = "班组名称")
    private String teamName;

    /** 所属部门 部门表主键 */
    private Long deptId;

    /** 所属部门 */
    @Excel(name = "所属部门")
    private String deptName;
    
    /** 状态 （0正常 1停用） */
    @Excel(name = "状态 ", readConverterExp = "0=正常,1=停用")
    private String status;

    /** 删除状态 （0代表存在 2代表删除） */
    private String delFlag;
    
    public void setTeamId(Long teamId) 
    {
        this.teamId = teamId;
    }

    public Long getTeamId() 
    {
        return teamId;
    }
    public void setTeamGuid(String teamGuid) 
    {
        this.teamGuid = teamGuid;
    }

    public String getTeamGuid() 
    {
        return teamGuid;
    }
    public void setTeamCode(String teamCode) 
    {
        this.teamCode = teamCode;
    }

    public String getTeamCode() 
    {
        return teamCode;
    }
    public void setTeamName(String teamName) 
    {
        this.teamName = teamName;
    }

    public String getTeamName() 
    {
        return teamName;
    }
    public void setDeptId(Long deptId) 
    {
        this.deptId = deptId;
    }

    public String getDeptName() 
    {
        return deptName;
    }
    public void setDeptName(String deptName) 
    {
        this.deptName = deptName;
    }

    public Long getDeptId() 
    {
        return deptId;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setDelFlag(String delFlag) 
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag() 
    {
        return delFlag;
    }
    
    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("teamId", getTeamId())
            .append("teamGuid", getTeamGuid())
            .append("teamCode", getTeamCode())
            .append("teamName", getTeamName())
            .append("deptId", getDeptId())
            .append("parentId", getParentId())
            .append("ancestors", getAncestors())
            .append("orderNum", getOrderNum())
            .append("status", getStatus())
            .append("remark", getRemark())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
