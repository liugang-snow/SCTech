package com.sctech.equipment.service.impl;

import java.util.List;
import java.util.UUID;

import java.util.ArrayList;
import com.sctech.common.core.domain.Ztree;
import com.sctech.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sctech.equipment.mapper.SerTeamMapper;
import com.sctech.equipment.domain.SerTeam;
import com.sctech.equipment.service.ISerTeamService;
import com.sctech.common.core.text.Convert;

/**
 * 维修班组Service业务层处理
 * 
 * @author SCTech
 * @date 2020-03-10
 */
@Service
public class SerTeamServiceImpl implements ISerTeamService 
{
    @Autowired
    private SerTeamMapper serTeamMapper;

    /**
     * 查询维修班组
     * 
     * @param teamId 维修班组ID
     * @return 维修班组
     */
    @Override
    public SerTeam selectSerTeamById(Long teamId)
    {
        return serTeamMapper.selectSerTeamById(teamId);
    }

    /**
     * 查询维修班组列表
     * 
     * @param serTeam 维修班组
     * @return 维修班组
     */
    @Override
    public List<SerTeam> selectSerTeamList(SerTeam serTeam)
    {
        return serTeamMapper.selectSerTeamList(serTeam);
    }

    /**
     * 新增维修班组
     * 
     * @param serTeam 维修班组
     * @return 结果
     */
    @Override
    public int insertSerTeam(SerTeam serTeam)
    {
    	serTeam.setTeamGuid(UUID.randomUUID().toString().replace("-",""));
        serTeam.setCreateTime(DateUtils.getNowDate());
        return serTeamMapper.insertSerTeam(serTeam);
    }

    /**
     * 修改维修班组
     * 
     * @param serTeam 维修班组
     * @return 结果
     */
    @Override
    public int updateSerTeam(SerTeam serTeam)
    {
        serTeam.setUpdateTime(DateUtils.getNowDate());
        return serTeamMapper.updateSerTeam(serTeam);
    }

    /**
     * 删除维修班组对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteSerTeamByIds(String ids)
    {
        return serTeamMapper.deleteSerTeamByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除维修班组信息
     * 
     * @param teamId 维修班组ID
     * @return 结果
     */
    @Override
    public int deleteSerTeamById(Long teamId)
    {
        return serTeamMapper.deleteSerTeamById(teamId);
    }

    /**
     * 更新维修班组状态
     * 
     * @param serTeam 维修班组
     * @return 结果
     */
    @Override
    public int updateStatus(SerTeam serTeam)
    {
    	if (serTeam.getStatus().equals("1"))
    		return serTeamMapper.updateStatusD(serTeam);
    	else
    		return serTeamMapper.updateStatusE(serTeam);
    }
    
    /**
     * 查询维修班组树列表
     * 
     * @return 所有维修班组信息
     */
    @Override
    public List<Ztree> selectSerTeamTree()
    {
        List<SerTeam> serTeamList = serTeamMapper.selectSerTeamList(new SerTeam());
        List<Ztree> ztrees = new ArrayList<Ztree>();
        for (SerTeam serTeam : serTeamList)
        {
        	if(serTeam.getStatus().equals("0"))
        	{
	            Ztree ztree = new Ztree();
	            ztree.setId(serTeam.getTeamId());
	            ztree.setpId(serTeam.getParentId());
	            ztree.setName(serTeam.getTeamName());
	            ztree.setTitle(serTeam.getTeamName());
	            ztrees.add(ztree);
        	}
        }
        return ztrees;
    }
    
}
