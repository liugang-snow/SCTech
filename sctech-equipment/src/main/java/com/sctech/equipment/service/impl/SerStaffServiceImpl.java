package com.sctech.equipment.service.impl;

import java.util.List;
import java.util.UUID;

import com.sctech.common.utils.DateUtils;
import com.sctech.common.utils.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sctech.equipment.mapper.SerCardMapper;
import com.sctech.equipment.mapper.SerStaffMapper;
import com.sctech.equipment.domain.SerCard;
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

    @Autowired
    private SerCardMapper serCardMapper;
    
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
    
    /**
     * 获取全部维修人员
     * 
     * @param teamId 维修班组ID
     * @return 结果
     */
    @Override
    public List<SerStaff> selectSerStaffAll(Long teamId)
    {
    	return serStaffMapper.selectSerStaffAll(teamId);
    }
    
    /**
     * 获取全部维修人员
     * 
     * @param scardId 维修工单ID
     * @return 结果
     */
    @Override
    public List<SerStaff> selectSerStaffs(Long scardId)
    {
    	return serStaffMapper.selectSerStaffs(scardId);
    }
    
    /**
     * 获取维修人员--工单编辑
     * 
     * @param scardId 维修工单ID
     * @return 维修人员集合
     */
    @Override
    public List<SerStaff> getSelectStaffs(Long scardId)
    {
    	SerCard serCard = serCardMapper.selectSerCardById(scardId);   	
    	List<SerStaff> serStaffs = serStaffMapper.selectSerStaffAll(serCard.getTeamId());
    	List<SerStaff> staffs = serStaffMapper.selectSerStaffs(scardId);
    	for (SerStaff serStaff : serStaffs)
        {
            for (SerStaff staff : staffs)
            {
                if (serStaff.getStaffId().longValue() == staff.getStaffId().longValue())
                {
                	serStaff.setFlag(true);
                    break;
                }
            }
        } 	
    	return serStaffs;
    }
    
    /**
     * 检查维修人员是否在该班组下重复添加
     * 
     * @param serStaff 
     * @return 
     */
    @Override
    public Boolean checkSerstaffUnique(SerStaff serStaff) { 	
    	Long staffID = StringUtils.isNull(serStaff.getStaffId())? -1L : serStaff.getStaffId();
    	SerStaff info = serStaffMapper.checkSerstaffUnique(serStaff.getUserId(), serStaff.getTeamId());
    	if (StringUtils.isNotNull(info) && info.getStaffId().longValue() != staffID.longValue())
    		return false;
    	return true;
    }
    
    /**
     * 检查组长
     * 
     * @param serStaff 
     * @return 
     */
    @Override
    public Boolean checkSerstaffLeader(SerStaff serStaff) {
    	if (serStaff.getStaffPost().equals("0"))
    		return true;
    	
    	SerStaff leader = serStaffMapper.checkSerstaffLeader(serStaff.getTeamId());
    	if (StringUtils.isNotNull(leader))
    	{
    		if (StringUtils.isNotNull(serStaff.getStaffId()))//修改维修人员
    		{
    			if (serStaff.getStaffId() == leader.getStaffId())
    				return true;
    			else
    				return false;
    		}
    		else
    			return false;
    	}
    	return true;
    }
}
