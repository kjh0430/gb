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
	
	public ArrayList<Goal> selectAllGoalState() {//목표관리 리스트 출력
		
		return (ArrayList)sqlSession.selectList("Goal.selectAllGoalState");
	}

	public ArrayList<Goal> selectEmpCondition(Goal goal) {
		
		return (ArrayList)sqlSession.selectList("Goal.selectEmp",goal);
	}

	public ArrayList<Goal> selectEmpGoal(Goal goal) {
	
		return (ArrayList)sqlSession.selectList("Goal.selectEmpGoal",goal);
	}

}
