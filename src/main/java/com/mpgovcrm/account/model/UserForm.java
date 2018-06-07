package com.mpgovcrm.account.model;

import java.util.List;

public class UserForm {

	private User user;
	
	private List<District> districts;

	private List<User> users;
	
	
	public List<District> getDistricts() {
		return districts;
	}

	public void setDistricts(List<District> districts) {
		this.districts = districts;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	
}
