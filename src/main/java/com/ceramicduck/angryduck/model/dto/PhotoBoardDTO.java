package com.ceramicduck.angryduck.model.dto;

public class PhotoBoardDTO {
	private int id; //게시물 번호
	private int writer_id; //작성자 아이디
	private String title; //제목
	private String content; //내용
	private String image; //이미지
	private String region; //지역
	private String datetime; //??
	private int timestamp; //?
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getWriter_id() {
		return writer_id;
	}
	public void setWriter_id(int writer_id) {
		this.writer_id = writer_id;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getDatetime() {
		return datetime;
	}
	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}
	public int getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(int timestamp) {
		this.timestamp = timestamp;
	}
	@Override
	public String toString() {
		return "Photo_boardDTO [id=" + id + ", writer_id=" + writer_id + ", title=" + title + ", content=" + content
				+ ", image=" + image + ", region=" + region + ", datetime=" + datetime + ", timestamp=" + timestamp
				+ "]";
	}
}
