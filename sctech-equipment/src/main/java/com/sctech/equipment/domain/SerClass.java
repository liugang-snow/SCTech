package com.sctech.equipment.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.sctech.common.annotation.Excel;
import com.sctech.common.core.domain.TreeEntity;

/**
 * 维修分类对象 ser_class
 * 
 * @author SCTech
 * @date 2020-03-12
 */
public class SerClass extends TreeEntity
{
    private static final long serialVersionUID = 1L;

    /** ID 主键 */
    private Long sclassId;

    /** Guid */
    private String sclassGuid;

    /** 分类编码 */
    @Excel(name = "分类编码")
    private String sclassCode;

    /** 分类名称 */
    @Excel(name = "分类名称")
    private String sclassName;

    /** 完成时间 */
    @Excel(name = "完成时间")
    private Long sclassTime;

    /** 紧急程度 */
    @Excel(name = "紧急程度")
    private String sclassEmergency;

    /** 负责班组 维修班组主键 */
    private Long teamId;

    /** 班组名称 */
    @Excel(name = "班组名称")
    private String teamName;
    
    /** 状态 （0正常 1停用） */
    @Excel(name = "状态 ", readConverterExp = "0=正常,1=停用")
    private String status;

    /** 删除状态 （0代表存在 2代表删除） */
    private String delFlag;

    public void setSclassId(Long sclassId) 
    {
        this.sclassId = sclassId;
    }

    public Long getSclassId() 
    {
        return sclassId;
    }
    public void setSclassGuid(String sclassGuid) 
    {
        this.sclassGuid = sclassGuid;
    }

    public String getSclassGuid() 
    {
        return sclassGuid;
    }
    public void setSclassCode(String sclassCode) 
    {
        this.sclassCode = sclassCode;
    }

    public String getSclassCode() 
    {
        return sclassCode;
    }
    public void setSclassName(String sclassName) 
    {
        this.sclassName = sclassName;
    }

    public String getSclassName() 
    {
        return sclassName;
    }
    public void setSclassTime(Long sclassTime) 
    {
        this.sclassTime = sclassTime;
    }

    public Long getSclassTime() 
    {
        return sclassTime;
    }
    public void setSclassEmergency(String sclassEmergency) 
    {
        this.sclassEmergency = sclassEmergency;
    }

    public String getSclassEmergency() 
    {
        return sclassEmergency;
    }
    public void setTeamId(Long teamId) 
    {
        this.teamId = teamId;
    }

    public Long getTeamId() 
    {
        return teamId;
    }
    public void setTeamName(String teamName) 
    {
        this.teamName = teamName;
    }

    public String getTeamName() 
    {
        return teamName;
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
            .append("sclassId", getSclassId())
            .append("sclassGuid", getSclassGuid())
            .append("sclassCode", getSclassCode())
            .append("sclassName", getSclassName())
            .append("sclassTime", getSclassTime())
            .append("sclassEmergency", getSclassEmergency())
            .append("teamId", getTeamId())
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
