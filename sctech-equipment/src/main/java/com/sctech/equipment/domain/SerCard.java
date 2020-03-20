package com.sctech.equipment.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.sctech.common.annotation.Excel;
import com.sctech.common.core.domain.BaseEntity;
import java.util.Date;

/**
 * 维修工单对象 ser_card
 * 
 * @author SCTech
 * @date 2020-03-16
 */
public class SerCard extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID 主键 */
    private Long scardId;

    /** Guid */
    private String scardGuid;

    /** 维修单号 */
    @Excel(name = "维修单号")
    private String scardCode;

    /** 维修分类 */
    @Excel(name = "维修分类")
    private Long sclassId;
    
    /** 维修分类 */
    @Excel(name = "维修分类")
    private String sclassName;

    /** 紧急程度 */
    @Excel(name = "紧急程度")
    private String sclassEmergency;

    /** 维修来源 */
    private String scardOrigin;

    /** 报修时间 */
    @Excel(name = "报修时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date repairDate;

    /** 联系人 */
    @Excel(name = "联系人")
    private String repairContacts;

    /** 联系电话 */
    @Excel(name = "联系电话")
    private String repairPhone;

    /** 报修部门 */
    private Long deptId;
    
    /** 报修部门 */
    @Excel(name = "报修部门")
    private String deptName;
    
    /** 报修地址 */
    private Long areaId;
    
    /** 报修地址 */
    @Excel(name = "报修地址")
    private String areaName;

    /** 维修详情 */
    private String repairDescription;

    /** 指派班组 */
    private Long teamId;
    
    /** 指派班组 */
    @Excel(name = "指派班组")
    private String teamName;

    /** 维修人员 */
    private String staffIds;

    /** 维修完成时间 */
    private Date finishDate;

    /** 维修结果 */
    private String finishDescription;

    /** 服务态度评价 */
    private String serEvaluation;

    /** 维修质量评价 */
    private String repEvaluation;

    /** 意见建议 */
    private String serOpinion;
    
    /** 删除状态 （0代表存在 2代表删除） */
    private String delFlag;

    public void setScardId(Long scardId) 
    {
        this.scardId = scardId;
    }

    public Long getScardId() 
    {
        return scardId;
    }
    public void setScardGuid(String scardGuid) 
    {
        this.scardGuid = scardGuid;
    }

    public String getScardGuid() 
    {
        return scardGuid;
    }
    public void setScardCode(String scardCode) 
    {
        this.scardCode = scardCode;
    }

    public String getScardCode() 
    {
        return scardCode;
    }
    public void setSclassId(Long sclassId) 
    {
        this.sclassId = sclassId;
    }

    public Long getSclassId() 
    {
        return sclassId;
    }
    public void setSclassName(String sclassName) 
    {
        this.sclassName = sclassName;
    }

    public String getSclassName() 
    {
        return sclassName;
    }
    public void setSclassEmergency(String sclassEmergency) 
    {
        this.sclassEmergency = sclassEmergency;
    }

    public String getSclassEmergency() 
    {
        return sclassEmergency;
    }
    public void setScardOrigin(String scardOrigin) 
    {
        this.scardOrigin = scardOrigin;
    }

    public String getScardOrigin() 
    {
        return scardOrigin;
    }
    public void setRepairDate(Date repairDate) 
    {
        this.repairDate = repairDate;
    }

    public Date getRepairDate() 
    {
        return repairDate;
    }
    public void setRepairContacts(String repairContacts) 
    {
        this.repairContacts = repairContacts;
    }

    public String getRepairContacts() 
    {
        return repairContacts;
    }
    public void setRepairPhone(String repairPhone) 
    {
        this.repairPhone = repairPhone;
    }

    public String getRepairPhone() 
    {
        return repairPhone;
    }
    public void setDeptId(Long deptId) 
    {
        this.deptId = deptId;
    }

    public Long getDeptId() 
    {
        return deptId;
    }
    public void setDeptName(String deptName) 
    {
        this.deptName = deptName;
    }

    public String getDeptName() 
    {
        return deptName;
    }
    public void setAreaId(Long areaId) 
    {
        this.areaId = areaId;
    }

    public Long getAreaId() 
    {
        return areaId;
    }
    public void setAreaName(String areaName) 
    {
        this.areaName = areaName;
    }

    public String getAreaName() 
    {
        return areaName;
    }
    public void setRepairDescription(String repairDescription) 
    {
        this.repairDescription = repairDescription;
    }

    public String getRepairDescription() 
    {
        return repairDescription;
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
    public void setStaffIds(String staffIds) 
    {
        this.staffIds = staffIds;
    }

    public String getStaffIds() 
    {
        return staffIds;
    }
    public void setFinishDate(Date finishDate) 
    {
        this.finishDate = finishDate;
    }

    public Date getFinishDate() 
    {
        return finishDate;
    }
    public void setFinishDescription(String finishDescription) 
    {
        this.finishDescription = finishDescription;
    }

    public String getFinishDescription() 
    {
        return finishDescription;
    }
    public void setSerEvaluation(String serEvaluation) 
    {
        this.serEvaluation = serEvaluation;
    }

    public String getSerEvaluation() 
    {
        return serEvaluation;
    }
    public void setRepEvaluation(String repEvaluation) 
    {
        this.repEvaluation = repEvaluation;
    }

    public String getRepEvaluation() 
    {
        return repEvaluation;
    }
    public void setSerOpinion(String serOpinion) 
    {
        this.serOpinion = serOpinion;
    }

    public String getSerOpinion() 
    {
        return serOpinion;
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
            .append("scardId", getScardId())
            .append("scardGuid", getScardGuid())
            .append("scardCode", getScardCode())
            .append("sclassId", getSclassId())
            .append("sclassEmergency", getSclassEmergency())
            .append("scardOrigin", getScardOrigin())
            .append("repairDate", getRepairDate())
            .append("repairContacts", getRepairContacts())
            .append("repairPhone", getRepairPhone())
            .append("deptId", getDeptId())
            .append("areaId", getAreaId())
            .append("repairDescription", getRepairDescription())
            .append("teamId", getTeamId())
            .append("staffId", getStaffIds())
            .append("finishDate", getFinishDate())
            .append("finishDescription", getFinishDescription())
            .append("serEvaluation", getSerEvaluation())
            .append("repEvaluation", getRepEvaluation())
            .append("serOpinion", getSerOpinion())
            .append("remark", getRemark())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
