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

   public ArrayList<Goal> selectGoalList(Goal goal) {
      return (ArrayList)sqlSession.selectList("Goal.selectGoalList",goal);
   }

   public Goal selectcheckGoal(Goal goal) {
      System.out.println("goalDao"+goal.getEmp_no());
      return sqlSession.selectOne("Goal.selectcheckGoal",goal);
   }

   public int insertGoal(Goal goal) {
      
      return sqlSession.insert("Goal.insertGoal",goal);
   }

}