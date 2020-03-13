package com.sctech.equipment.mapper;

import com.sctech.equipment.domain.SerClass;
import java.util.List;

/**
 * 维修分类Mapper接口
 * 
 * @author SCTech
 * @date 2020-03-12
 */
public interface SerClassMapper 
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
     * 删除维修分类
     * 
     * @param sclassId 维修分类ID
     * @return 结果
     */
    public int deleteSerClassById(Long sclassId);

    /**
     * 批量删除维修分类
     * 
     * @param sclassIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteSerClassByIds(String[] sclassIds);
}
