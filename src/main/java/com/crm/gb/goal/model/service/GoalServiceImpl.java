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
	public ArrayList<Goal> selectGoalStateList() {
		
		return goalDao.selectAllGoalState();
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

}
