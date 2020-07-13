package com.simple.dto;

import java.util.Date;

public class ReplyDto {

	// 조인 전용
	// 번호	내용	삭제여부	등록일
	private int no;
	private String content;
	private String del_yn;
	private Date create_date;
	
	private String writer;
	private String writerName;
	private int boardNo;
	
	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getWriterName() {
		return writerName;
	}

	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	
	public ReplyDto() {
		
	}
	
	public int getNo() {
		return no;
	}
	
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getDel_yn() {
		return del_yn;
	}
	
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
	
	public Date getCreate_date() {
		return create_date;
	}
	
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	
}
