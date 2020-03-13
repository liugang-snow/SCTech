package com.sctech.equipment.service;

import com.sctech.equipment.domain.SerClass;
import java.util.List;
import com.sctech.common.core.domain.Ztree;

/**
 * 维修分类Service接口
 * 
 * @author SCTech
 * @date 2020-03-12
 */
public interface ISerClassService 
{
    /**
     * 查询维修分类
     * 
     * @param sclassId 维修分类ID
     * @return 维修分类
     */
    public SerClass selectSerClassById(Long sclassId);

    /**
     * 查询维修分类列表
     * 
     * @param serClass 维修分类
     * @return 维修分类集合
     */
    public List<SerClass> selectSerClassList(SerClass serClass);

    /**
     * 新增维修分类
     * 
     * @param serClass 维修分类
     * @return 结果
     */
    public int insertSerClass(SerClass serClass);

    /**
     * 修改维修分类
     * 
     * @param serClass 维修分类
     * @return 结果
     */
    public int updateSerClass(SerClass serClass);

    /**
     * 批量删除维修分类
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteSerClassByIds(String ids);

    /**
     * 删除维修分类信息
     * 
     * @param sclassId 维修分类ID
     * @return 结果
     */
    public int deleteSerClassById(Long sclassId);

    /**
     * 查询维修分类树列表
     * 
     * @return 所有维修分类信息
     */
    public List<Ztree> selectSerClassTree();
    
    /**
     * 维修分类状态修改
     * 
     * @param serClass 维修分类信息
     * @return 结果
     */
    public int changeStatus(SerClass serClass);
}
