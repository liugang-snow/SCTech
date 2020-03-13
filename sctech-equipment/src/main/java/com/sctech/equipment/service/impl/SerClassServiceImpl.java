package com.sctech.equipment.service.impl;

import java.util.List;
import java.util.UUID;

import java.util.ArrayList;
import com.sctech.common.core.domain.Ztree;
import com.sctech.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sctech.equipment.mapper.SerClassMapper;
import com.sctech.equipment.domain.SerClass;
import com.sctech.equipment.service.ISerClassService;
import com.sctech.common.core.text.Convert;

/**
 * 维修分类Service业务层处理
 * 
 * @author SCTech
 * @date 2020-03-12
 */
@Service
public class SerClassServiceImpl implements ISerClassService 
{
    @Autowired
    private SerClassMapper serClassMapper;

    /**
     * 查询维修分类
     * 
     * @param sclassId 维修分类ID
     * @return 维修分类
     */
    @Override
    public SerClass selectSerClassById(Long sclassId)
    {
        return serClassMapper.selectSerClassById(sclassId);
    }

    /**
     * 查询维修分类列表
     * 
     * @param serClass 维修分类
     * @return 维修分类
     */
    @Override
    public List<SerClass> selectSerClassList(SerClass serClass)
    {
        return serClassMapper.selectSerClassList(serClass);
    }

    /**
     * 新增维修分类
     * 
     * @param serClass 维修分类
     * @return 结果
     */
    @Override
    public int insertSerClass(SerClass serClass)
    {
		serClass.setSclassGuid(UUID.randomUUID().toString().replace("-",""));
        serClass.setCreateTime(DateUtils.getNowDate());
        return serClassMapper.insertSerClass(serClass);
    }

    /**
     * 修改维修分类
     * 
     * @param serClass 维修分类
     * @return 结果
     */
    @Override
    public int updateSerClass(SerClass serClass)
    {
        serClass.setUpdateTime(DateUtils.getNowDate());
        return serClassMapper.updateSerClass(serClass);
    }

    /**
     * 删除维修分类对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteSerClassByIds(String ids)
    {
        return serClassMapper.deleteSerClassByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除维修分类信息
     * 
     * @param sclassId 维修分类ID
     * @return 结果
     */
    @Override
    public int deleteSerClassById(Long sclassId)
    {
        return serClassMapper.deleteSerClassById(sclassId);
    }

    /**
     * 查询维修分类树列表
     * 
     * @return 所有维修分类信息
     */
    @Override
    public List<Ztree> selectSerClassTree()
    {
        List<SerClass> serClassList = serClassMapper.selectSerClassList(new SerClass());
        List<Ztree> ztrees = new ArrayList<Ztree>();
        for (SerClass serClass : serClassList)
        {
            Ztree ztree = new Ztree();
            ztree.setId(serClass.getSclassId());
            ztree.setpId(serClass.getParentId());
            ztree.setName(serClass.getSclassName());
            ztree.setNames(serClass.getFullname());
            ztree.setTitle(serClass.getSclassName());
            ztrees.add(ztree);
        }
        return ztrees;
    }
    
    /**
     * 维修分类状态修改
     * 
     * @param serClass 维修分类信息
     * @return 结果
     */
    @Override
    public int changeStatus(SerClass serClass)
    {
        return serClassMapper.updateSerClass(serClass);
    }
}
