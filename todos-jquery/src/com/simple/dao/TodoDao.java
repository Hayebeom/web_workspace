package com.simple.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.simple.util.ConnectionUtil;
import com.simple.util.QueryUtil;
import com.simple.vo.Todo;

public class TodoDao {

	/**
	 * 새로 추가할 Todo의 시퀀스 번호 조회
	 * @return	시퀀스 번호
	 * @throws SQLException
	 */
	public int getTodoSequence() throws SQLException {
		return 0;
	}
	
	/**
	 * 지정된 Todo객체의 정보를 DB에 저장
	 * @param todo 새 일정 정보
	 * @throws SQLException
	 */
	public void insertTodo(Todo todo) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("todo.insertTodo"));
		
		pstmt.setInt(1, todo.getNo());
		pstmt.setString(2, todo.getTitle());
		pstmt.setString(3, todo.getContent());
		pstmt.setDate(4, (Date) todo.getDay());
		pstmt.setString(5, todo.getStatus());
		pstmt.setString(6, todo.getUserId());
		
		pstmt.close();
		connection.close();
	}
	
	/**
	 * 지정된 사용자가 등록한 모든 일정을 일정번호의 역순으로 정렬해서 반환
	 * @param userId 사용자 아이디
	 * @return 해당 사용자가 등록한 모든 일정
	 * @throws SQLException
	 */
	public List<Todo> getTodosByUserId(String userId) throws SQLException {
		List<Todo> todos = new ArrayList<Todo>();
		Todo todo = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("todo.getTodosByUserId"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			todo = new Todo();
			todo.setNo(rs.getInt("todo_no"));
			todo.setTitle(rs.getString("todo_title"));
			todo.setContent(rs.getString("todo_content"));
			todo.setDay( rs.getDate("todo_day"));
			todo.setStatus(rs.getString("todo_status"));
			todo.setUserId(rs.getString("user_id"));
			
			todos.add(todo);
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return todos;
	}
	
	/**
	 * 지정된 일정번호에 해당하는 일정정보를 반환
	 * @param todoNo 일정번호
	 * @return 일정 정보
	 * @throws SQLException
	 */
	public Todo getTodoByNo(int todoNo)throws SQLException {
		Todo todo = null;
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("todo.getTodoByNo"));
		pstmt.setInt(1, todoNo);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			todo = new Todo();
			todo.setNo(rs.getInt("todo_no"));
			todo.setTitle(rs.getString("todo_title"));
			todo.setContent(rs.getString("todo_conetent"));
			todo.setDay(rs.getDate("todo_day"));
			todo.setStatus(rs.getString("todo_status"));
			todo.setUserId(rs.getString("user_id"));
		}
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return todo;
	}
	
	/**
	 * 지정된 일정정보의 변경 내용을 DB에 반영
	 * @param todo 변경된 정보를 포함하고 있는 일정정보
	 * @throws SQLException
	 */
	public void updateTodo(Todo todo) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("todo.updateTodo"));
		
		pstmt.setInt(1, todo.getNo());
		pstmt.setString(2, todo.getTitle());
		pstmt.setString(3, todo.getContent());
		pstmt.setDate(4, (Date) todo.getDay());
		pstmt.setString(5, todo.getStatus());
		pstmt.setString(6, todo.getUserId());
		
		pstmt.close();
		connection.close();
	}
	
	
}
