package com.sctech.equipment.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.sctech.common.annotation.Excel;
import com.sctech.common.core.domain.BaseEntity;

/**
 * 维修花费对象 ser_expense
 * 
 * @author SCTech
 * @date 2020-03-19
 */
public class SerExpense extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID 主键 */
    private Long expenseId;

    /** Guid */
    @Excel(name = "Guid")
    private String expenseGuid;

    /** 维修单ID 维修工单表主键 */
    @Excel(name = "维修单ID 维修工单表主键")
    private Long scardId;

    /** 项目描述 */
    @Excel(name = "项目描述")
    private String expenseDesc;

    /** 计价单位 */
    @Excel(name = "计价单位")
    private String expenseUnits;

    /** 数量 */
    @Excel(name = "数量")
    private Double expenseQuan;

    /** 单价 */
    @Excel(name = "单价")
    private Double expensePrice;

    /** 金额 */
    @Excel(name = "金额")
    private Double expenseSum;

    /** 删除状态 （0代表存在 2代表删除） */
    private String delFlag;

    public void setExpenseId(Long expenseId) 
    {
        this.expenseId = expenseId;
    }

    public Long getExpenseId() 
    {
        return expenseId;
    }
    public void setExpenseGuid(String expenseGuid) 
    {
        this.expenseGuid = expenseGuid;
    }

    public String getExpenseGuid() 
    {
        return expenseGuid;
    }
    public void setScardId(Long scardId) 
    {
        this.scardId = scardId;
    }

    public Long getScardId() 
    {
        return scardId;
    }
    public void setExpenseDesc(String expenseDesc) 
    {
        this.expenseDesc = expenseDesc;
    }

    public String getExpenseDesc() 
    {
        return expenseDesc;
    }
    public void setExpenseUnits(String expenseUnits) 
    {
        this.expenseUnits = expenseUnits;
    }

    public String getExpenseUnits() 
    {
        return expenseUnits;
    }
    public void setExpenseQuan(Double expenseQuan) 
    {
        this.expenseQuan = expenseQuan;
    }

    public Double getExpenseQuan() 
    {
        return expenseQuan;
    }
    public void setExpensePrice(Double expensePrice) 
    {
        this.expensePrice = expensePrice;
    }

    public Double getExpensePrice() 
    {
        return expensePrice;
    }
    public void setExpenseSum(Double expenseSum) 
    {
        this.expenseSum = expenseSum;
    }

    public Double getExpenseSum() 
    {
        return expenseSum;
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
            .append("expenseId", getExpenseId())
            .append("expenseGuid", getExpenseGuid())
            .append("scardId", getScardId())
            .append("expenseDesc", getExpenseDesc())
            .append("expenseUnits", getExpenseUnits())
            .append("expenseQuan", getExpenseQuan())
            .append("expensePrice", getExpensePrice())
            .append("expenseSum", getExpenseSum())
            .append("remark", getRemark())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
