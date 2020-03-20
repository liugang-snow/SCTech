package com.sctech.equipment.service.impl;

import java.util.List;
import java.util.UUID;

import com.sctech.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.sctech.equipment.mapper.SerExpenseMapper;
import com.sctech.equipment.domain.SerExpense;
import com.sctech.equipment.service.ISerExpenseService;
import com.sctech.common.core.text.Convert;

/**
 * 维修花费Service业务层处理
 * 
 * @author SCTech
 * @date 2020-03-19
 */
@Service
public class SerExpenseServiceImpl implements ISerExpenseService 
{
    @Autowired
    private SerExpenseMapper serExpenseMapper;

    /**
     * 查询维修花费
     * 
     * @param expenseId 维修花费ID
     * @return 维修花费
     */
    @Override
    public SerExpense selectSerExpenseById(Long expenseId)
    {
        return serExpenseMapper.selectSerExpenseById(expenseId);
    }

    /**
     * 查询维修花费列表
     * 
     * @param serExpense 维修花费
     * @return 维修花费
     */
    @Override
    public List<SerExpense> selectSerExpenseList(SerExpense serExpense)
    {
        return serExpenseMapper.selectSerExpenseList(serExpense);
    }

    /**
     * 新增维修花费
     * 
     * @param serExpense 维修花费
     * @return 结果
     */
    @Override
    public int insertSerExpense(SerExpense serExpense)
    {
		serExpense.setExpenseGuid(UUID.randomUUID().toString().replace("-",""));
        serExpense.setCreateTime(DateUtils.getNowDate());
        return serExpenseMapper.insertSerExpense(serExpense);
    }

    /**
     * 修改维修花费
     * 
     * @param serExpense 维修花费
     * @return 结果
     */
    @Override
    public int updateSerExpense(SerExpense serExpense)
    {
        serExpense.setUpdateTime(DateUtils.getNowDate());
        return serExpenseMapper.updateSerExpense(serExpense);
    }

    /**
     * 删除维修花费对象
     * 
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public int deleteSerExpenseByIds(String ids)
    {
        return serExpenseMapper.deleteSerExpenseByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除维修花费信息
     * 
     * @param expenseId 维修花费ID
     * @return 结果
     */
    @Override
    public int deleteSerExpenseById(Long expenseId)
    {
        return serExpenseMapper.deleteSerExpenseById(expenseId);
    }
}
