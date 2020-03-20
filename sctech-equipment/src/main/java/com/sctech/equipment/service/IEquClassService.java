package com.sctech.equipment.service;

import com.sctech.common.core.domain.Ztree;
import com.sctech.equipment.domain.EquClass;

import java.util.List;

/**
 * 设备分类Service接口
 * 
 * @author ruoyi
 * @date 2020-02-11
 */
public interface IEquClassService 
{
    /**
     * 查询设备分类
     * 
     * @param classId 设备分类ID
     * @return 设备分类
     */
    public EquClass selectEquClassById(Long classId);

    /**
     * 查询设备分类列表
     * 
     * @param equClass 设备分类
     * @return 设备分类集合
     */
    public List<EquClass> selectEquClassList(EquClass equClass);

    /**
     * 新增设备分类
     * 
     * @param equClass 设备分类
     * @return 结果
     */
    public int insertEquClass(EquClass equClass);

    /**
     * 修改设备分类
     * 
     * @param equClass 设备分类
     * @return 结果
     */
    public int updateEquClass(EquClass equClass);

    /**
     * 批量删除设备分类
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteEquClassByIds(String ids);

    /**
     * 删除设备分类信息
     * 
     * @param classId 设备分类ID
     * @return 结果
     */
    public int deleteEquClassById(Long classId);

    /**
     * 更新设备分类状态
     * 
     * @param equClass 设备分类
     * @return 结果
     */
    public int updateStatus(EquClass equClass);
    
    /**
     * 查询设备分类树列表
     * 
     * @return 所有设备分类信息
     */
    public List<Ztree> selectEquClassTree();
    
    /**
     * 校验设备分类名称是否唯一
     * 
     * @param equClass
     * @return
     */
    public boolean checkClassNameUnique(EquClass equClass);
    
}
