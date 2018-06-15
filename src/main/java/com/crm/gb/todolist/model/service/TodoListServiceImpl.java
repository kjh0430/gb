package com.crm.gb.todolist.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.gb.todolist.model.dao.TodoListDao;
import com.crm.gb.todolist.model.vo.TodoList;

@Service("todolistService")
public class TodoListServiceImpl implements TodoListService{
	
	@Autowired
	private TodoListDao todolistDao;

	@Override
	public int insertTodoList(TodoList todolist) {
		return todolistDao.insertTodoList(todolist);
	}

	@Override
	public TodoList selectTodoList(int emp_no) {
		return todolistDao.selectTodoList(emp_no);
	}

	@Override
	public int updateTodoList(TodoList todolist) {
		return todolistDao.updateTodoList(todolist);
	}

}
