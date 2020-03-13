package com.sctech.equipment.service.impl;

import java.util.List;
import com.sctech.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sctech.equipment.mapper.EquChannelMapper;
import com.sctech.equipment.domain.EquChannel;
import com.sctech.equipment.service.IEquChannelService;
import com.sctech.common.core.text.Convert;

/**
 * 设备位号Service业务层处理
 * 
 * @author SCTech
 * @date 2020-03-06
 */
@Service
public class EquChannelServiceImpl implements IEquChannelService 
{
    @Autowired
    private EquChannelMapper equChannelMapper;

    /**
     * 查询设备位号
     * 
     * @param channelId 设备位号ID
     * @return 设备位号
     */
    @Override
    public EquChannel selectEquChannelById(Long channelId)
    {
        return equChannelMapper.selectEquChannelById(channelId);
    }

    /**
     * 查询设备位号列表
     * 
     * @param equChannel 设备位号
     * @return 设备位号
     */
    @Override
    public List<EquChannel> selectEquChannelList(EquChannel equChannel)
    {
        return equChannelMapper.selectEquChannelList(equChannel);
    }

    /**
     * 新增设备位号
     * 
     * @param equChannel 设备位号
     * @return 结果
     */
    @Override
    public int insertEquChannel(EquChannel equChannel)
    {
        equChannel.setCreateTime(DateUtils.getNowDate());
        return equChannelMapper.insertEquChannel(equChannel);
    }

    /**
     * 修改设备位号
     * 
     * @param equChannel 设备位号
     * @return 结果
     */
    @Override
    public int updateEquChannel(EquChannel equChannel)
    {
        equChannel.setUpdateTime(DateUtils.getNowDate());
        return equChannelMapper.updateEquChannel(equChannel);
    }

    /**
     * 删除设备位号对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteEquChannelByIds(String ids)
    {
        return equChannelMapper.deleteEquChannelByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除设备位号信息
     * 
     * @param channelId 设备位号ID
     * @return 结果
     */
    @Override
    public int deleteEquChannelById(Long channelId)
    {
        return equChannelMapper.deleteEquChannelById(channelId);
    }
}
