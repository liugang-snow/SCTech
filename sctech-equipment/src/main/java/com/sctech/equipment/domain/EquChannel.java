package com.sctech.equipment.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.sctech.common.annotation.Excel;
import com.sctech.common.core.domain.BaseEntity;

/**
 * 设备位号对象 equ_channel
 * 
 * @author SCTech
 * @date 2020-03-06
 */
public class EquChannel extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID 主键 */
    private Long channelId;

    /** Guid */
    private String channelGuid;

    /** 设备ID */
    private Long equId;

    /** 位号名称 */
    @Excel(name = "位号名称")
    private String channelName;

    /** 位号编号 */
    @Excel(name = "位号编号")
    private String channelCode;

    /** 位号描述 */
    @Excel(name = "位号描述")
    private String channelDecs;

    /** 位号类型 */
    @Excel(name = "位号类型")
    private String channelType;

    /** 位号性质 */
    @Excel(name = "位号性质")
    private String channelClass;

    /** 删除状态 （0代表存在 2代表删除） */
    private String delFlag;

    public void setChannelId(Long channelId) 
    {
        this.channelId = channelId;
    }

    public Long getChannelId() 
    {
        return channelId;
    }
    public void setChannelGuid(String channelGuid) 
    {
        this.channelGuid = channelGuid;
    }

    public String getChannelGuid() 
    {
        return channelGuid;
    }
    public void setEquId(Long equId) 
    {
        this.equId = equId;
    }

    public Long getEquId() 
    {
        return equId;
    }
    public void setChannelName(String channelName) 
    {
        this.channelName = channelName;
    }

    public String getChannelName() 
    {
        return channelName;
    }
    public void setChannelCode(String channelCode) 
    {
        this.channelCode = channelCode;
    }

    public String getChannelCode() 
    {
        return channelCode;
    }
    public void setChannelDecs(String channelDecs) 
    {
        this.channelDecs = channelDecs;
    }

    public String getChannelDecs() 
    {
        return channelDecs;
    }
    public void setChannelType(String channelType) 
    {
        this.channelType = channelType;
    }

    public String getChannelType() 
    {
        return channelType;
    }
    public void setChannelClass(String channelClass) 
    {
        this.channelClass = channelClass;
    }

    public String getChannelClass() 
    {
        return channelClass;
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
            .append("channelId", getChannelId())
            .append("channelGuid", getChannelGuid())
            .append("equId", getEquId())
            .append("channelName", getChannelName())
            .append("channelCode", getChannelCode())
            .append("channelDecs", getChannelDecs())
            .append("channelType", getChannelType())
            .append("channelClass", getChannelClass())
            .append("remark", getRemark())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
