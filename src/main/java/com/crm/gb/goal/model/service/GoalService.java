package com.crm.gb.goal.model.service;

import java.util.ArrayList;



import com.crm.gb.goal.model.vo.Goal;


public interface GoalService {

	public abstract ArrayList<Goal> selectGoalStateList();

	public abstract ArrayList<Goal> selectGoalStateListMonth(String gdata);

	public abstract Goal selectGoalContractMoneySum(int emp_no);

	public abstract int insertGoal(Goal goal);

	public abstract int countGoal(Goal goal);

}
