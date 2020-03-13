package com.sctech.equipment.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.sctech.common.annotation.Excel;
import com.sctech.common.core.domain.BaseEntity;

import java.util.Date;

/**
 * 设备档案对象 equ_card
 * 
 * @author ruoyi
 * @date 2020-02-14
 */
public class EquCard extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** ID 主键 */
    private Long equId;

    /** Guid */
    private String equGuid;

    /** 设备流水号 */
    @Excel(name = "设备流水号")
    private String equSerial;
    
    /** 设备编号 */
    @Excel(name = "设备编号")
    private String equCode;

    /** 设备名称 */
    @Excel(name = "设备名称")
    private String equName;

    /** 设备类别 设备分类表主键 */
    private Long classId;

    /** 设备类别名称 */
    @Excel(name = "设备分类")
    private String className;
    
    /** 数量 */
    @Excel(name = "数量")
    private Double equCount;

    /** 单价 元 */
    @Excel(name = "单价(元)")
    private Double equSprice;

    /** 总价 元 */
    @Excel(name = "总价(元)")
    private Double equPrice;

    /** 合同 设备合同表主键 */
    private Long contractId;
    
    /** 合同名称 */
    @Excel(name = "合同名称")
    private String contractName;
    
    /** 供应商 设备供应商表主键 */
    private Long supplierId;
    
    /** 供应商名称 */
    @Excel(name = "供应商名称")
    private String supplierName;

    /** 品牌 */
    @Excel(name = "品牌")
    private String equBrand;

    /** 规格型号 */
    @Excel(name = "规格型号")
    private String equParam;

    /** 所属部门 部门表主键 */
    private Long deptId;

    /** 所属部门名称  */
    @Excel(name = "所属部门")
    private String deptName;
    
    /** 设备管理员 用户表主键 */
    private String equAdmin;

    /** 设备采购时间 */
    @Excel(name = "采购时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date equTime;

    /** 设备使用年限 */
    @Excel(name = "使用年限")
    private Long equYear;

    /** 设备使用状态 （0-闲置 1-正常使用 2-故障 3-报废报损） */
    @Excel(name = "设备使用状态 ", readConverterExp = "0=-闲置,1=-正常使用,2=-故障,3=-报废报损")
    private String equStatus;

    /** 所在区域 */
    private Long areaId;

    /** 所在区域名称 */
    @Excel(name = "所在区域")
    private String areaName;
    
    /** 特种属性 字典选取 */
    private String equAttribute;

    /** 删除状态 （0代表存在 2代表删除） */
    private String delFlag;

    /** 报废报损id */
    private Long scrId;
    
    public void setEquId(Long equId) 
    {
        this.equId = equId;
    }

    public Long getEquId() 
    {
        return equId;
    }
    public void setEquGuid(String equGuid) 
    {
        this.equGuid = equGuid;
    }

    public String getEquSerial() 
    {
        return equSerial;
    }
    public void setEquSerial(String equSerial) 
    {
        this.equSerial = equSerial;
    }
    
    public String getEquGuid() 
    {
        return equGuid;
    }
    public void setEquCode(String equCode) 
    {
        this.equCode = equCode;
    }

    public String getEquCode() 
    {
        return equCode;
    }
    public void setEquName(String equName) 
    {
        this.equName = equName;
    }

    public String getEquName() 
    {
        return equName;
    }
    public void setClassId(Long classId) 
    {
        this.classId = classId;
    }

    public Long getClassId() 
    {
        return classId;
    }
    public void setEquCount(Double equCount) 
    {
        this.equCount = equCount;
    }

    public String getClassName() 
    {
        return className;
    }
    public void setClassName(String className) 
    {
        this.className = className;
    }
    
    public Double getEquCount() 
    {
        return equCount;
    }
    public void setEquSprice(Double equSprice) 
    {
        this.equSprice = equSprice;
    }

    public Double getEquSprice() 
    {
        return equSprice;
    }
    public void setEquPrice(Double equPrice) 
    {
        this.equPrice = equPrice;
    }

    public Double getEquPrice() 
    {
        return equPrice;
    }
    public void setContractId(Long contractId) 
    {
        this.contractId = contractId;
    }

    public Long getContractId() 
    {
        return contractId;
    }
    
    public void setSupplierId(Long supplierId) 
    {
        this.supplierId = supplierId;
    }

    public Long getSupplierId() 
    {
        return supplierId;
    }
    public void setEquBrand(String equBrand) 
    {
        this.equBrand = equBrand;
    }

    public String getEquBrand() 
    {
        return equBrand;
    }
    public void setEquParam(String equParam) 
    {
        this.equParam = equParam;
    }

    public String getEquParam() 
    {
        return equParam;
    }
    public void setDeptId(Long deptId) 
    {
        this.deptId = deptId;
    }

    public Long getDeptId() 
    {
        return deptId;
    }
    public void setEquAdmin(String equAdmin) 
    {
        this.equAdmin = equAdmin;
    }

    public String getEquAdmin() 
    {
        return equAdmin;
    }
    public void setEquTime(Date equTime) 
    {
        this.equTime = equTime;
    }

    public Date getEquTime() 
    {
        return equTime;
    }
    public void setEquYear(Long equYear) 
    {
        this.equYear = equYear;
    }

    public Long getEquYear() 
    {
        return equYear;
    }
    public void setEquStatus(String equStatus) 
    {
        this.equStatus = equStatus;
    }

    public String getEquStatus() 
    {
        return equStatus;
    }
    public void setAreaId(Long areaId) 
    {
        this.areaId = areaId;
    }

    public String getAreaName() 
    {
        return areaName;
    }
    public void setAreaName(String areaName) 
    {
        this.areaName = areaName;
    }

    public Long getAreaId() 
    {
        return areaId;
    }
    public void setEquAttribute(String equAttribute) 
    {
        this.equAttribute = equAttribute;
    }

    public String getEquAttribute() 
    {
        return equAttribute;
    }
    public void setDelFlag(String delFlag) 
    {
        this.delFlag = delFlag;
    }

    public String getDelFlag() 
    {
        return delFlag;
    }

    public String getDeptName() 
    {
        return deptName;
    }
    public void setDeptName(String deptName) 
    {
        this.deptName = deptName;
    }
    
    public String getContractName() 
    {
        return contractName;
    }
    public void setContractName(String contractName) 
    {
        this.contractName = contractName;
    }
    
    public String getSupplierName() 
    {
        return supplierName;
    }
    public void setSupplierName(String supplierName) 
    {
        this.supplierName = supplierName;
    }
    
    public void setScrId(Long scrId) 
    {
        this.scrId = scrId;
    }

    public Long getScrId() 
    {
        return scrId;
    }
    
    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("equId", getEquId())
            .append("equGuid", getEquGuid())
            .append("equSerial", getEquSerial())
            .append("equCode", getEquCode())
            .append("equName", getEquName())
            .append("classId", getClassId())
            .append("equCount", getEquCount())
            .append("equSprice", getEquSprice())
            .append("equPrice", getEquPrice())
            .append("contractId", getContractId())
            .append("supplierId", getSupplierId())
            .append("equBrand", getEquBrand())
            .append("equParam", getEquParam())
            .append("deptId", getDeptId())
            .append("equAdmin", getEquAdmin())
            .append("equTime", getEquTime())
            .append("equYear", getEquYear())
            .append("equStatus", getEquStatus())
            .append("areaId", getAreaId())
            .append("equAttribute", getEquAttribute())
            .append("remark", getRemark())
            .append("delFlag", getDelFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
