package com.sctech.equipment.mapper;

import com.sctech.equipment.domain.SerExpense;
import java.util.List;

/**
 * 维修花费Mapper接口
 * 
 * @author SCTech
 * @date 2020-03-19
 */
public interface SerExpenseMapper 
{
    /**
     * 查询维修花费
     * 
     * @param expenseId 维修花费ID
     * @return 维修花费
     */
    public SerExpense selectSerExpenseById(Long expenseId);

    /**
     * 查询维修花费列表
     * 
     * @param serExpense 维修花费
     * @return 维修花费集合
     */
    public List<SerExpense> selectSerExpenseList(SerExpense serExpense);

    /**
     * 新增维修花费
     * 
     * @param serExpense 维修花费
     * @return 结果
     */
    public int insertSerExpense(SerExpense serExpense);

    /**
     * 修改维修花费
     * 
     * @param serExpense 维修花费
     * @return 结果
     */
    public int updateSerExpense(SerExpense serExpense);

    /**
     * 删除维修花费
     * 
     * @param expenseId 维修花费ID
     * @return 结果
     */
    public int deleteSerExpenseById(Long expenseId);

    /**
     * 批量删除维修花费
     * 
     * @param expenseIds 需要删除的数据ID
     * @return 结果
     */
    public int deleteSerExpenseByIds(String[] expenseIds);
}
