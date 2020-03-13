package com.sctech.equipment.service.impl;

import java.util.List;
import java.util.UUID;

import com.sctech.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sctech.equipment.mapper.SerStaffMapper;
import com.sctech.equipment.domain.SerStaff;
import com.sctech.equipment.service.ISerStaffService;
import com.sctech.common.core.text.Convert;

/**
 * 维修人员Service业务层处理
 * 
 * @author SCTech
 * @date 2020-03-11
 */
@Service
public class SerStaffServiceImpl implements ISerStaffService 
{
    @Autowired
    private SerStaffMapper serStaffMapper;

    /**
     * 查询维修人员
     * 
     * @param staffId 维修人员ID
     * @return 维修人员
     */
    @Override
    public SerStaff selectSerStaffById(Long staffId)
    {
        return serStaffMapper.selectSerStaffById(staffId);
    }

    /**
     * 查询维修人员列表
     * 
     * @param serStaff 维修人员
     * @return 维修人员
     */
    @Override
    public List<SerStaff> selectSerStaffList(SerStaff serStaff)
    {
        return serStaffMapper.selectSerStaffList(serStaff);
    }

    /**
     * 新增维修人员
     * 
     * @param serStaff 维修人员
     * @return 结果
     */
    @Override
    public int insertSerStaff(SerStaff serStaff)
    {
		serStaff.setStaffGuid(UUID.randomUUID().toString().replace("-",""));
        serStaff.setCreateTime(DateUtils.getNowDate());
        return serStaffMapper.insertSerStaff(serStaff);
    }

    /**
     * 修改维修人员
     * 
     * @param serStaff 维修人员
     * @return 结果
     */
    @Override
    public int updateSerStaff(SerStaff serStaff)
    {
        serStaff.setUpdateTime(DateUtils.getNowDate());
        return serStaffMapper.updateSerStaff(serStaff);
    }

    /**
     * 删除维修人员对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteSerStaffByIds(String ids)
    {
        return serStaffMapper.deleteSerStaffByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除维修人员信息
     * 
     * @param staffId 维修人员ID
     * @return 结果
     */
    @Override
    public int deleteSerStaffById(Long staffId)
    {
        return serStaffMapper.deleteSerStaffById(staffId);
    }
}
