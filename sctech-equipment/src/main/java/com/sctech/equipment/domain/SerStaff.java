package com.sctech.equipment.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.sctech.common.annotation.Excel;
import com.sctech.common.core.domain.BaseEntity;

/**
 * 维修人员对象 ser_staff
 * 
 * @author SCTech
 * @date 2020-03-11
 */
public class SerStaff extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID 主键 */
    private Long staffId;

    /** Guid */
    private String staffGuid;

    /** 维修人员 用户表主键 */
    private Long userId;
    
    /** 维修人员 */
    @Excel(name = "维修人员")
    private String userName;

    /** 维修班组 维修班组表主键 */
    private Long teamId;

    /** 维修班组 */
    @Excel(name = "维修班组")
    private String teamName;
    
    /** 岗位 */
    private String staffPost;

    /** 删除状态 （0代表存在 2代表删除） */
    private String delFlag;

    public void setStaffId(Long staffId) 
    {
        this.staffId = staffId;
    }

    public Long getStaffId() 
    {
        return staffId;
    }
    public void setStaffGuid(String staffGuid) 
    {
        this.staffGuid = staffGuid;
    }

    public String getStaffGuid() 
    {
        return staffGuid;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setUserName(String userName) 
    {
        this.userName = userName;
    }

    public String getUserName() 
    {
        return userName;
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
    public void setStaffPost(String staffPost) 
    {
        this.staffPost = staffPost;
    }

    public String getStaffPost() 
    {
        return staffPost;
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
            .append("staffId", getStaffId())
            .append("staffGuid", getStaffGuid())
            .append("userId", getUserId())
            .append("teamId", getTeamId())
            .append("postId", getStaffPost())
            .append("remark", getRemark())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
