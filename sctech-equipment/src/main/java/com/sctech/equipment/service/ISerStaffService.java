package com.sctech.equipment.service;

import com.sctech.equipment.domain.SerStaff;
import java.util.List;

/**
 * 维修人员Service接口
 * 
 * @author SCTech
 * @date 2020-03-11
 */
public interface ISerStaffService 
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
     * 批量删除维修人员
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteSerStaffByIds(String ids);

    /**
     * 删除维修人员信息
     * 
     * @param staffId 维修人员ID
     * @return 结果
     */
    public int deleteSerStaffById(Long staffId);
}
