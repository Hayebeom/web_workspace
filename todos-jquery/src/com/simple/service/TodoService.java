package com.simple.service;

import java.util.ArrayList;
import java.util.List;

import com.simple.dao.TodoDao;
import com.simple.vo.Todo;

public class TodoService {

	public TodoDao todoDao = new TodoDao();
	
	/**
	 * 새로운 일정 정보를 추가
	 * (일정번호는 시퀀스번호를 획득해서 저장한 후 DAO에 전달)
	 * @param todo 새 일정정보 
	 * @return 시퀀스번호와 등록일이 포함된 일정정보
	 * @throws Exception
	 */
	public Todo addNewTodo(Todo todo) throws Exception {
		int todoSeq = todoDao.getTodoSequence();
		
		todo.setNo(todoSeq);
		todo.setStatus("처리예정");
		
		todoDao.insertTodo(todo);
		
		return todo;
	}
	
	/**
	 * 지정된 사용자가 등록한 일정정보들을 반환
	 * @param userId 로그인된 사용자의 아이디
	 * @return 지정된 사용자가 저장한 모든 일정
	 * @throws Exception
	 */
	public List<Todo> getMyTodos(String userId) throws Exception {
		List<Todo> todos = new ArrayList<Todo>();
		todos = todoDao.getTodosByUserId(userId);
		
		return todos;
	}
	
	/**
	 * 지정된 일정번호에 해당하는 일정 상세정보를 반환
	 * @param todoNo 조회할 일정번호
	 * @return 일정 상세정보
	 * @throws Exception
	 */
	public Todo getTodoDetail(int todoNo) throws Exception {
		Todo detailTodo = todoDao.getTodoByNo(todoNo);
		return detailTodo;
	}
	
	/**
	 * 변경된 일정정보를 저장시킨다
	 * @param todo 변경된 일정 정보
	 * @return 변경된 일정 정보
	 * @throws Exception
	 */
	public Todo updateTodo(Todo todo) throws Exception {
		todoDao.updateTodo(todo);
		return todo;
	}
	
}
