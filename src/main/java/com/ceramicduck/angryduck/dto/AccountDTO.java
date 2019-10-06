package com.ceramicduck.angryduck.dto;

import java.util.ArrayList;

public class AccountDTO {
	private int id;
	private String email;
	private String password;
	private String role;
	private String name;
	private int age;
	private String gender;
	private String description;
	private ArrayList<InstrumentDTO> instruments;
	private ArrayList<TagDTO> tags;
	
	public AccountDTO() {
		instruments = new ArrayList<>();
		tags = new ArrayList<>();
	}

	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getRole() {
		return role;
	}
	
	public void setRole(String role) {
		this.role = role;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public int getAge() {
		return age;
	}
	
	public void setAge(int age) {
		this.age = age;
	}
	
	public String getGender() {
		return gender;
	}
	
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}

	public ArrayList<InstrumentDTO> getInstruments() {
		return instruments;
	}

	public void setInstruments(ArrayList<InstrumentDTO> instruments) {
		this.instruments = instruments;
	}

	public ArrayList<TagDTO> getTags() {
		return tags;
	}

	public void setTags(ArrayList<TagDTO> tags) {
		this.tags = tags;
	}
	
}
