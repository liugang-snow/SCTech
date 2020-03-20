package com.sctech.equipment.service.impl;

import java.util.List;
import java.util.ArrayList;
import com.sctech.common.core.domain.Ztree;
import com.sctech.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sctech.equipment.mapper.EquAreaMapper;
import com.sctech.equipment.domain.EquArea;
import com.sctech.equipment.service.IEquAreaService;
import com.sctech.common.core.text.Convert;

/**
 * 设备所在区域Service业务层处理
 * 
 * @author SCTech
 * @date 2020-03-05
 */
@Service
public class EquAreaServiceImpl implements IEquAreaService 
{
    @Autowired
    private EquAreaMapper equAreaMapper;

    /**
     * 查询设备所在区域
     * 
     * @param areaId 设备所在区域ID
     * @return 设备所在区域
     */
    @Override
    public EquArea selectEquAreaById(Long areaId)
    {
        return equAreaMapper.selectEquAreaById(areaId);
    }

    /**
     * 查询设备所在区域列表
     * 
     * @param equArea 设备所在区域
     * @return 设备所在区域
     */
    @Override
    public List<EquArea> selectEquAreaList(EquArea equArea)
    {
        return equAreaMapper.selectEquAreaList(equArea);
    }

    /**
     * 新增设备所在区域
     * 
     * @param equArea 设备所在区域
     * @return 结果
     */
    @Override
    public int insertEquArea(EquArea equArea)
    {
        equArea.setCreateTime(DateUtils.getNowDate());
        return equAreaMapper.insertEquArea(equArea);
    }

    /**
     * 修改设备所在区域
     * 
     * @param equArea 设备所在区域
     * @return 结果
     */
    @Override
    public int updateEquArea(EquArea equArea)
    {
        equArea.setUpdateTime(DateUtils.getNowDate());
        return equAreaMapper.updateEquArea(equArea);
    }

    /**
     * 删除设备所在区域对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteEquAreaByIds(String ids)
    {
        return equAreaMapper.deleteEquAreaByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除设备所在区域信息
     * 
     * @param areaId 设备所在区域ID
     * @return 结果
     */
    @Override
    public int deleteEquAreaById(Long areaId)
    {
        return equAreaMapper.deleteEquAreaById(areaId);
    }

    /**
     * 更新设备所在区域状态
     * 
     * @param equArea 设备所在区域
     * @return 结果
     */
    @Override
    public int updateStatus(EquArea equArea)
    {
    	if (equArea.getStatus().equals("1"))
    		return equAreaMapper.updateStatusD(equArea);
    	else
    		return equAreaMapper.updateStatusE(equArea);
    }
    
    /**
     * 查询设备所在区域树列表
     * 
     * @return 所有设备所在区域信息
     */
    @Override
    public List<Ztree> selectEquAreaTree()
    {
        List<EquArea> equAreaList = equAreaMapper.selectEquAreaList(new EquArea());
        List<Ztree> ztrees = new ArrayList<Ztree>();
        for (EquArea equArea : equAreaList)
        {
        	if(equArea.getStatus().equals("0"))
        	{
	            Ztree ztree = new Ztree();
	            ztree.setId(equArea.getAreaId());
	            ztree.setpId(equArea.getParentId());
	            ztree.setName(equArea.getAreaName());
	            ztree.setNames(equArea.getFullname());
	            ztree.setTitle(equArea.getAreaName());
	            ztrees.add(ztree);
        	}
        }
        return ztrees;
    }
    
}
