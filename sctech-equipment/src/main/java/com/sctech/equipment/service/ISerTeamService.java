package com.sctech.equipment.service;

import com.sctech.equipment.domain.SerTeam;
import java.util.List;
import com.sctech.common.core.domain.Ztree;

/**
 * 维修班组Service接口
 * 
 * @author SCTech
 * @date 2020-03-10
 */
public interface ISerTeamService 
{
    /**
     * 查询维修班组
     * 
     * @param teamId 维修班组ID
     * @return 维修班组
     */
    public SerTeam selectSerTeamById(Long teamId);

    /**
     * 查询维修班组列表
     * 
     * @param serTeam 维修班组
     * @return 维修班组集合
     */
    public List<SerTeam> selectSerTeamList(SerTeam serTeam);

    /**
     * 新增维修班组
     * 
     * @param serTeam 维修班组
     * @return 结果
     */
    public int insertSerTeam(SerTeam serTeam);

    /**
     * 修改维修班组
     * 
     * @param serTeam 维修班组
     * @return 结果
     */
    public int updateSerTeam(SerTeam serTeam);

    /**
     * 批量删除维修班组
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteSerTeamByIds(String ids);

    /**
     * 删除维修班组信息
     * 
     * @param teamId 维修班组ID
     * @return 结果
     */
    public int deleteSerTeamById(Long teamId);

    /**
     * 查询维修班组树列表
     * 
     * @return 所有维修班组信息
     */
    public List<Ztree> selectSerTeamTree();
    
    /**
     * 维修班组状态修改
     * 
     * @param serTeam 维修班组信息
     * @return 结果
     */
    public int changeStatus(SerTeam serTeam);
}
