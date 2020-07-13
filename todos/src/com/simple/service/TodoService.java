package com.simple.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.simple.dao.TodoDao;
import com.simple.dto.TodoDto;

import kr.co.jhta.util.pagination.Pagination;

public class TodoService {
	
	private TodoDao todoDao = TodoDao.getInstance(); // TodoDao에서 생성한 싱글턴 todoDao를 불러온다
	
	
	public List<TodoDto> getRecentTodos() throws Exception {
		List<TodoDto> todoDtos = todoDao.getRecentTodos();
		
		return todoDtos;
	}
	
	public TodoDto getTodoDetail(int todoNo) throws Exception {
		TodoDto todoDto = new TodoDto();
		todoDto = todoDao.getTodoByNo(todoNo);
		
		return todoDto;
	}
	
	public TodoDto updateTodoStatus(int todoNo, String status) throws Exception {
		// 일정번호에 해당하는 일정 정보 조회
		TodoDto todoDto = todoDao.getTodoByNo(todoNo);
		
		// 조회된 일정 정보 상태를 전달받은 상태로 변경
		todoDto.setStatus(status);

		// 변경할 상태가 처리완료 인 경우 일정 정보의 completedData에 현재 날짜 입력
		if (("처리완료").equals(status)) {
			todoDto.setCompletedDay(new Date());
		}
		
		// 그 외에는 completedDatae에 null을 담음
		else {
			todoDto.setCompletedDay(null);
		}
		
		// updateTodo(tdoDto)을 실행해서 db 값 반환
		todoDao.updateTodo(todoDto);
		return todoDto;
	}

	public Map<String, Object> getTodoList(String userId, int pageNo, int rows, String status, String keyword) throws Exception {
		
		// 일정 개수 조회
		int totalRows = todoDao.getTotalRows(userId, status, keyword);
		
		// 페이지 네비게이션에 필요한 정보 생성
		// 현재 페이지번호, 화면에 표시할 행의 개수,  전체 데이터의 개수가 필요
		Pagination pagination = new Pagination(pageNo, rows, totalRows);
		// 현재 ㅔ이지번호에 해당하는 데이터 조회에 필요한 구간 계산
		int beginIndex = (pageNo - 1) * rows + 1;
		int endIndex = pageNo * rows;
		
		// 조회조건을 만족하는 일정 조회
		List<TodoDto> todos = todoDao.getTodos(userId, status, keyword, beginIndex, endIndex);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("todos", todos);
		map.put("pagination", pagination);
		return map;
	}
	
	
}
