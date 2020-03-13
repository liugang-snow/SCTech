package com.sctech.equipment.mapper;

import com.sctech.equipment.domain.EquChannel;
import java.util.List;

/**
 * 设备位号Mapper接口
 * 
 * @author SCTech
 * @date 2020-03-06
 */
public interface EquChannelMapper 
{
    /**
     * 查询设备位号
     * 
     * @param channelId 设备位号ID
     * @return 设备位号
     */
    public EquChannel selectEquChannelById(Long channelId);

    /**
     * 查询设备位号列表
     * 
     * @param equChannel 设备位号
     * @return 设备位号集合
     */
    public List<EquChannel> selectEquChannelList(EquChannel equChannel);

    /**
     * 新增设备位号
     * 
     * @param equChannel 设备位号
     * @return 结果
     */
    public int insertEquChannel(EquChannel equChannel);

    /**
     * 修改设备位号
     * 
     * @param equChannel 设备位号
     * @return 结果
     */
    public int updateEquChannel(EquChannel equChannel);

    /**
     * 删除设备位号
     * 
     * @param channelId 设备位号ID
     * @return 结果
     */
    public int deleteEquChannelById(Long channelId);

    /**
     * 批量删除设备位号
     * 
     * @param channelIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteEquChannelByIds(String[] channelIds);
}
