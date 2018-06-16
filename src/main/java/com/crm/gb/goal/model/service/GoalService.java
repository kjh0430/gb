package com.crm.gb.goal.model.service;

import java.util.ArrayList;



import com.crm.gb.goal.model.vo.Goal;


public interface GoalService {

	public abstract ArrayList<Goal> selectGoalStateList();

	public abstract ArrayList<Goal> selectEmpCondition(Goal goal);

	public abstract ArrayList<Goal> selectEmpGoal(Goal goal); //사원별 목표 상세 가져오기

}
