package com.crm.gb.goal.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.gb.goal.model.dao.GoalDao;
import com.crm.gb.goal.model.vo.Goal;

@Service("goalService")
public class GoalServiceImpl implements GoalService{

	
	@Autowired
	private GoalDao goalDao;
	
	@Override
	public ArrayList<Goal> selectGoalStateList(Goal goal) {
		
		return goalDao.selectAllGoalState(goal);
	}

	@Override
	public ArrayList<Goal> selectGoalStateListMonth(String gdata) {
		
		return goalDao.selectAllGoalStateMonth(gdata);
	}

	@Override
	public Goal selectGoalContractMoneySum(int emp_no) {
		
		return goalDao.selectGoalContractMoneySum(emp_no);
	}

	@Override
	public int insertGoal(Goal goal) {
		
		return goalDao.insertGoal(goal);
	}

	@Override
	public int countGoal(Goal goal) {
		
		return goalDao.countGoal(goal);
	}
	public ArrayList<Goal> selectEmpCondition(Goal goal) {
	
		return goalDao.selectEmpCondition(goal);
	}

	@Override
	public ArrayList<Goal> selectEmpGoal(Goal goal) {
	
		return goalDao.selectEmpGoal(goal);
	}

	@Override
	public ArrayList<Goal> selectEmpAll() {
		
		return goalDao.selectEmpAll();

	}
	//목표관리 리스트 카운트 조회
	@Override
	public Goal goalListCount() {
		
		return goalDao.selectGoalCount();
	}

	@Override
	public ArrayList<Goal> selectGoalList(Goal goal) {
		return goalDao.selectGoalList(goal);
	}

}
