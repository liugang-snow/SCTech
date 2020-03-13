package com.sctech.equipment.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.sctech.common.annotation.Excel;
import com.sctech.common.core.domain.TreeEntity;

/**
 * 设备所在区域对象 equ_area
 * 
 * @author SCTech
 * @date 2020-03-05
 */
public class EquArea extends TreeEntity
{
    private static final long serialVersionUID = 1L;

    /** ID 主键 */
    private Long areaId;

    /** Guid */
    private String areaGuid;

    /** 区域编码 */
    @Excel(name = "区域编码")
    private String areaCode;

    /** 区域名称 */
    @Excel(name = "区域名称")
    private String areaName;

    /** 区域类别 */
    @Excel(name = "区域类别")
    private String areaType;

    /** 状态 （0正常 1停用） */
    @Excel(name = "状态 ", readConverterExp = "0=正常,1=停用")
    private String status;

    /** 删除状态 （0代表存在 2代表删除） */
    private String delFlag;
    
    public void setAreaId(Long areaId) 
    {
        this.areaId = areaId;
    }

    public Long getAreaId() 
    {
        return areaId;
    }
    public void setAreaGuid(String areaGuid) 
    {
        this.areaGuid = areaGuid;
    }

    public String getAreaGuid() 
    {
        return areaGuid;
    }
    public void setAreaCode(String areaCode) 
    {
        this.areaCode = areaCode;
    }

    public String getAreaCode() 
    {
        return areaCode;
    }
    public void setAreaName(String areaName) 
    {
        this.areaName = areaName;
    }

    public String getAreaName() 
    {
        return areaName;
    }
    public void setAreaType(String areaType) 
    {
        this.areaType = areaType;
    }

    public String getAreaType() 
    {
        return areaType;
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
            .append("areaId", getAreaId())
            .append("areaGuid", getAreaGuid())
            .append("areaCode", getAreaCode())
            .append("areaName", getAreaName())
            .append("areaType", getAreaType())
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
