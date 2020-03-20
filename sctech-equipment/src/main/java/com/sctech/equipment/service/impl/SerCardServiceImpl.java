package com.sctech.equipment.service.impl;

import java.util.List;
import java.util.UUID;

import com.sctech.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sctech.equipment.mapper.SerCardMapper;
import com.sctech.equipment.domain.SerCard;
import com.sctech.equipment.service.ISerCardService;
import com.sctech.common.core.text.Convert;

/**
 * 维修工单Service业务层处理
 * 
 * @author SCTech
 * @date 2020-03-16
 */
@Service
public class SerCardServiceImpl implements ISerCardService 
{
    @Autowired
    private SerCardMapper serCardMapper;
    
    /**
     * 查询维修工单
     * 
     * @param scardId 维修工单ID
     * @return 维修工单
     */
    @Override
    public SerCard selectSerCardById(Long scardId)
    {
        return serCardMapper.selectSerCardById(scardId);
    }

    /**
     * 查询维修工单列表
     * 
     * @param serCard 维修工单
     * @return 维修工单
     */
    @Override
    public List<SerCard> selectSerCardList(SerCard serCard)
    {
        return serCardMapper.selectSerCardList(serCard);
    }

    /**
     * 新增维修工单
     * 
     * @param serCard 维修工单
     * @return 结果
     */
    @Override
    public int insertSerCard(SerCard serCard)
    {
		serCard.setScardGuid(UUID.randomUUID().toString().replace("-",""));
        serCard.setCreateTime(DateUtils.getNowDate());
        return serCardMapper.insertSerCard(serCard);
    }

    /**
     * 修改维修工单
     * 
     * @param serCard 维修工单
     * @return 结果
     */
    @Override
    public int updateSerCard(SerCard serCard)
    {
        serCard.setUpdateTime(DateUtils.getNowDate());
        return serCardMapper.updateSerCard(serCard);
    }

    /**
     * 删除维修工单对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteSerCardByIds(String ids)
    {
        return serCardMapper.deleteSerCardByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除维修工单信息
     * 
     * @param scardId 维修工单ID
     * @return 结果
     */
    @Override
    public int deleteSerCardById(Long scardId)
    {
        return serCardMapper.deleteSerCardById(scardId);
    }
}
