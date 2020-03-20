package com.sctech.equipment.service;

import com.sctech.equipment.domain.SerCard;
import java.util.List;

/**
 * 维修工单Service接口
 * 
 * @author SCTech
 * @date 2020-03-16
 */
public interface ISerCardService 
{
    /**
     * 查询维修工单
     * 
     * @param scardId 维修工单ID
     * @return 维修工单
     */
    public SerCard selectSerCardById(Long scardId);

    /**
     * 查询维修工单列表
     * 
     * @param serCard 维修工单
     * @return 维修工单集合
     */
    public List<SerCard> selectSerCardList(SerCard serCard);

    /**
     * 新增维修工单
     * 
     * @param serCard 维修工单
     * @return 结果
     */
    public int insertSerCard(SerCard serCard);

    /**
     * 修改维修工单
     * 
     * @param serCard 维修工单
     * @return 结果
     */
    public int updateSerCard(SerCard serCard);

    /**
     * 批量删除维修工单
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    public int deleteSerCardByIds(String ids);

    /**
     * 删除维修工单信息
     * 
     * @param scardId 维修工单ID
     * @return 结果
     */
    public int deleteSerCardById(Long scardId);
    
}
