package com.crm.gb.goal.model.service;

import java.util.ArrayList;



import com.crm.gb.goal.model.vo.Goal;


public interface GoalService {

   
   public abstract ArrayList<Goal> selectEmpCondition(Goal goal);

   public abstract ArrayList<Goal> selectEmpGoal(Goal goal); //사원별 목표 상세 가져오기

   public abstract ArrayList<Goal> selectEmpAll(); //모든 사원들의 목표 등등..

   public abstract ArrayList<Goal> selectGoalList(Goal goal);

   public abstract Goal selectcheckGoal(Goal goal);

   public abstract int insertGoal(Goal goal);
   
   public abstract int updateGoal(Goal goal);


}