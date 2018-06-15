package com.crm.gb.goal.model.service;

import java.util.ArrayList;



import com.crm.gb.goal.model.vo.Goal;


public interface GoalService {

	public abstract ArrayList<Goal> selectGoalStateList();

	public abstract ArrayList<Goal> selectEmpCondition(Goal goal);

}
