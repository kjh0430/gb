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

}
