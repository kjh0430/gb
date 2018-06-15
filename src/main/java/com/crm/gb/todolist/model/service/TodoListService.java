package com.crm.gb.todolist.model.service;

import com.crm.gb.todolist.model.vo.TodoList;

public interface TodoListService {
	
	public static final int MID = 1;
	
	int insertTodoList(TodoList todolist);

	TodoList selectTodoList(int emp_no);

	int updateTodoList(TodoList todolist);

}
