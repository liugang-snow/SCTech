package com.sctech.equipment.mapper;

import com.sctech.equipment.domain.SerStaff;
import java.util.List;

/**
 * 维修人员Mapper接口
 * 
 * @author SCTech
 * @date 2020-03-11
 */
public interface SerStaffMapper 
{
    /**
     * 查询维修人员
     * 
     * @param staffId 维修人员ID
     * @return 维修人员
     */
    public SerStaff selectSerStaffById(Long staffId);

    /**
     * 查询维修人员列表
     * 
     * @param serStaff 维修人员
     * @return 维修人员集合
     */
    public List<SerStaff> selectSerStaffList(SerStaff serStaff);

    /**
     * 新增维修人员
     * 
     * @param serStaff 维修人员
     * @return 结果
     */
    public int insertSerStaff(SerStaff serStaff);

    /**
     * 修改维修人员
     * 
     * @param serStaff 维修人员
     * @return 结果
     */
    public int updateSerStaff(SerStaff serStaff);

    /**
     * 删除维修人员
     * 
     * @param staffId 维修人员ID
     * @return 结果
     */
    public int deleteSerStaffById(Long staffId);

    /**
     * 批量删除维修人员
     * 
     * @param staffIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteSerStaffByIds(String[] staffIds);
}
