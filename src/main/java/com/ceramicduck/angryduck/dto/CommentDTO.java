package com.ceramicduck.angryduck.dto;

import java.util.Date;

public class CommentDTO {
	private int id;
	private int writerId;
	private int communityId;
	private String content;
	private Date timestamp;
	private String name;
	
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
	
	public int getCommunityId() {
		return communityId;
	}
	
	public void setCommunityId(int communityId) {
		this.communityId = communityId;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
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
}
