package com.simple.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.simple.dto.BoardDto;
import com.simple.util.ConnectionUtil;
import com.simple.util.QueryUtil;
import com.simple.vo.Board;

public class BoardDao {
	
	public void insertBoard(Board board) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.insertBoard"));
		pstmt.setString(1, board.getTitle());
		pstmt.setString(2, board.getWriter());
		pstmt.setString(3, board.getContent());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public void updateBoard(Board board) throws SQLException {
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.updateBoard"));
		
		pstmt.setString(1, board.getTitle());
		pstmt.setString(2, board.getContent());
		pstmt.setInt(3, board.getHit());
		pstmt.setInt(4, board.getReply_cnt());
		pstmt.setString(5, board.getDelYN());
		pstmt.setInt(6, board.getNo());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		connection.close();
	}
	
	public List<BoardDto> getBoards(int beginIndex, int endIndex) throws SQLException {
		List<BoardDto> boards = new ArrayList<BoardDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.getBoards"));
		pstmt.setInt(1, beginIndex);
		pstmt.setInt(2, endIndex);
		
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			BoardDto boardDto = new BoardDto();
			boardDto.setNo(rs.getInt("board_no"));
			boardDto.setTitle(rs.getString("board_title"));
			boardDto.setWriter(rs.getString("board_writer"));
			boardDto.setWriterName(rs.getString("board_writer_name"));
			boardDto.setContent(rs.getString("board_content"));
			boardDto.setHit(rs.getInt("board_hit"));
			boardDto.setReplyCnt(rs.getInt("board_reply_cnt"));
			boardDto.setDelYn(rs.getString("board_del_yn"));
			boardDto.setCreateDate(rs.getDate("board_create_date"));
			
			boards.add(boardDto);
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return boards;
	}
	
	public BoardDto getBoard(int boardNo) throws SQLException {
		BoardDto boardDto = null;
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.getBoard"));
		pstmt.setInt(1, boardNo);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			boardDto = new BoardDto();
			boardDto.setNo(rs.getInt("board_no"));
			boardDto.setTitle(rs.getString("board_title"));
			boardDto.setWriter(rs.getString("board_writer"));
			boardDto.setWriterName(rs.getString("board_writer_name"));
			boardDto.setContent(rs.getString("board_content"));
			boardDto.setHit(rs.getInt("board_hit"));
			boardDto.setReplyCnt(rs.getInt("board_reply_cnt"));
			boardDto.setDelYn(rs.getString("board_del_yn"));
			boardDto.setCreateDate(rs.getDate("board_create_date"));
			
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		return boardDto;
	}
	
	public int getTotalRows() throws SQLException {
		int totalRows = 0;
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.getTotalRows"));
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		totalRows = rs.getInt("cnt");
		
		rs.close();
		pstmt.close();
		connection.close();
		
		return totalRows;
	}
	
	
	
	public List<BoardDto> getBoardByUserId(String userId) throws SQLException {
		List<BoardDto> boards = new ArrayList<BoardDto>();
		
		Connection connection = ConnectionUtil.getConnection();
		PreparedStatement pstmt = connection.prepareStatement(QueryUtil.getSQL("board.getBoardByUserId"));
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			BoardDto boardDto = new BoardDto();
			boardDto.setNo(rs.getInt("board_no"));
			boardDto.setTitle(rs.getString("board_title"));
			boardDto.setHit(rs.getInt("board_hit"));
			boardDto.setReplyCnt(rs.getInt("board_reply_cnt"));
			boardDto.setDelYn(rs.getString("board_del_yn"));
			boardDto.setCreateDate(rs.getDate("board_create_date"));
			
			boards.add(boardDto);
		}
		rs.close();
		pstmt.close();
		connection.close();
				
		return boards;
	}
}
