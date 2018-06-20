package com.crm.gb.goal.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crm.gb.goal.model.vo.Goal;
@Repository("goaldao")
public class GoalDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public ArrayList<Goal> selectAllGoalState(Goal goal) {//목표관리 리스트 출력
		
		return (ArrayList)sqlSession.selectList("Goal.selectAllGoalState",goal);
	}

	public ArrayList<Goal> selectAllGoalStateMonth(String gdata) {
		
		return (ArrayList)sqlSession.selectList("Goal.selectAllGoalStateMonth",gdata);
	}

	public Goal selectGoalContractMoneySum(int emp_no) {
		
		return sqlSession.selectOne("Goal.selectGoalContractMoneySum",emp_no);
	}

	public int insertGoal(Goal goal) {
		
		return sqlSession.insert("Goal.insertGoal", goal);
	}

	public int countGoal(Goal goal) {
		
		return sqlSession.selectOne("Goal.selectCountGoal",goal);
	}
	public ArrayList<Goal> selectEmpCondition(Goal goal) {
		
		return (ArrayList)sqlSession.selectList("Goal.selectEmp",goal);
	}

	public ArrayList<Goal> selectEmpGoal(Goal goal) {
	
		return (ArrayList)sqlSession.selectList("Goal.selectEmpGoal",goal);
	}

	public ArrayList<Goal> selectEmpAll() {
		
		return (ArrayList)sqlSession.selectList("Goal.selectEmpAll");

	}

	public Goal selectGoalCount() {
		
		return sqlSession.selectOne("Goal.selectListCount");
	}

}
