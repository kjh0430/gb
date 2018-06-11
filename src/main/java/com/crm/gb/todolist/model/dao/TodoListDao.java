package com.crm.gb.todolist.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crm.gb.todolist.model.vo.TodoList;

@Repository("todolistDao")
public class TodoListDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertTodoList(TodoList todolist) {
		return sqlSession.insert("todolistInsert", todolist);
	}

	public TodoList selectTodoList(int emp_no) {
		return sqlSession.selectOne("todolistSelect", emp_no);
	}

}
