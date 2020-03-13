package com.sctech.equipment.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sctech.common.core.text.Convert;
import com.sctech.common.utils.DateUtils;
import com.sctech.equipment.domain.EquContract;
import com.sctech.equipment.mapper.EquContractMapper;
import com.sctech.equipment.service.IEquContractService;

/**
 * 设备合同Service业务层处理
 * 
 * @author ruoyi
 * @date 2020-02-18
 */
@Service
public class EquContractServiceImpl implements IEquContractService 
{
    @Autowired
    private EquContractMapper equContractMapper;

    /**
     * 查询设备合同
     * 
     * @param conId 设备合同ID
     * @return 设备合同
     */
    @Override
    public EquContract selectEquContractById(Long conId)
    {
        return equContractMapper.selectEquContractById(conId);
    }

    /**
     * 查询设备合同列表
     * 
     * @param equContract 设备合同
     * @return 设备合同
     */
    @Override
    public List<EquContract> selectEquContractList(EquContract equContract)
    {
        return equContractMapper.selectEquContractList(equContract);
    }

    /**
     * 新增设备合同
     * 
     * @param equContract 设备合同
     * @return 结果
     */
    @Override
    public int insertEquContract(EquContract equContract)
    {
        equContract.setCreateTime(DateUtils.getNowDate());
        return equContractMapper.insertEquContract(equContract);
    }

    /**
     * 修改设备合同
     * 
     * @param equContract 设备合同
     * @return 结果
     */
    @Override
    public int updateEquContract(EquContract equContract)
    {
        equContract.setUpdateTime(DateUtils.getNowDate());
        return equContractMapper.updateEquContract(equContract);
    }

    /**
     * 删除设备合同对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteEquContractByIds(String ids)
    {
        return equContractMapper.deleteEquContractByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除设备合同信息
     * 
     * @param conId 设备合同ID
     * @return 结果
     */
    @Override
    public int deleteEquContractById(Long conId)
    {
        return equContractMapper.deleteEquContractById(conId);
    }
}
