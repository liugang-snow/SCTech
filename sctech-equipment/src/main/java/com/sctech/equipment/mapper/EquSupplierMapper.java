package com.sctech.equipment.mapper;

import java.util.List;

import com.sctech.equipment.domain.EquSupplier;

/**
 * 设备供应商Mapper接口
 * 
 * @author ruoyi
 * @date 2020-02-17
 */
public interface EquSupplierMapper 
{
    /**
     * 查询设备供应商
     * 
     * @param supId 设备供应商ID
     * @return 设备供应商
     */
    public EquSupplier selectEquSupplierById(Long supId);

    /**
     * 查询设备供应商列表
     * 
     * @param equSupplier 设备供应商
     * @return 设备供应商集合
     */
    public List<EquSupplier> selectEquSupplierList(EquSupplier equSupplier);

    /**
     * 新增设备供应商
     * 
     * @param equSupplier 设备供应商
     * @return 结果
     */
    public int insertEquSupplier(EquSupplier equSupplier);

    /**
     * 修改设备供应商
     * 
     * @param equSupplier 设备供应商
     * @return 结果
     */
    public int updateEquSupplier(EquSupplier equSupplier);

    /**
     * 删除设备供应商
     * 
     * @param supId 设备供应商ID
     * @return 结果
     */
    public int deleteEquSupplierById(Long supId);

    /**
     * 批量删除设备供应商
     * 
     * @param supIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteEquSupplierByIds(String[] supIds);
}
