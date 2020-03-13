package com.sctech.equipment.mapper;

import com.sctech.equipment.domain.EquArea;
import java.util.List;

/**
 * 设备所在区域Mapper接口
 * 
 * @author SCTech
 * @date 2020-03-05
 */
public interface EquAreaMapper 
{
    /**
     * 查询设备所在区域
     * 
     * @param areaId 设备所在区域ID
     * @return 设备所在区域
     */
    public EquArea selectEquAreaById(Long areaId);

    /**
     * 查询设备所在区域列表
     * 
     * @param equArea 设备所在区域
     * @return 设备所在区域集合
     */
    public List<EquArea> selectEquAreaList(EquArea equArea);

    /**
     * 新增设备所在区域
     * 
     * @param equArea 设备所在区域
     * @return 结果
     */
    public int insertEquArea(EquArea equArea);

    /**
     * 修改设备所在区域
     * 
     * @param equArea 设备所在区域
     * @return 结果
     */
    public int updateEquArea(EquArea equArea);

    /**
     * 删除设备所在区域
     * 
     * @param areaId 设备所在区域ID
     * @return 结果
     */
    public int deleteEquAreaById(Long areaId);

    /**
     * 批量删除设备所在区域
     * 
     * @param areaIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteEquAreaByIds(String[] areaIds);
}
