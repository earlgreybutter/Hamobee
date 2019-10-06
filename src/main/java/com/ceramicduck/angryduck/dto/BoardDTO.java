package com.ceramicduck.angryduck.dto;

import java.util.Date;

public class BoardDTO {
	private int id; //게시물 번호
	private int writerId; //작성자 아이디
	private String title; //제목
	private String content; //내용
	private int viewcnt; //조회수
	private int cnt; // 댓글 갯수
	private Date timestamp; //시간
	private String name;
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public Date getTimestamp() {
		return timestamp;
	}
	
	public void setTimestamp(Date timestamp) {
		this.timestamp = timestamp;
	}
	
	public int getCnt() {
		return cnt;
	}
	
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public int getWriterId() {
		return writerId;
	}
	
	public void setWriterId(int writerId) {
		this.writerId = writerId;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}

	public int getViewcnt() {
		return viewcnt;
	}
	
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	
}
