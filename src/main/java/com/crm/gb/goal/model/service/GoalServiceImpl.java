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


	@Override
	public ArrayList<Goal> selectGoalList(Goal goal) {
		return goalDao.selectGoalList(goal);
	}

	@Override
	public Goal selectcheckGoal(Goal goal) {
		return goalDao.selectcheckGoal(goal);
	}

	@Override
	public int insertGoal(Goal goal) {
		
		return goalDao.insertGoal(goal);
	}



}
