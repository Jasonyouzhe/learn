package com.learn.model.vo;

import java.util.List;

import com.learn.model.Role;

public class UserRolePerVo {
	private Integer id;
	private String userId;
	private String userName;
	private String photoPath;
	private String password;
	private int userDzone;
	private List<Role> roles;
	
public List<Role> getRoles() {
		return roles;
	}
	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	//	private String roleName;
//	private String roleDescription;
//	private String permissionsName;
//	private String permissionsDescription;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPhotoPath() {
		return photoPath;
	}
	public void setPhotoPath(String photoPath) {
		this.photoPath = photoPath;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getUserDzone() {
		return userDzone;
	}
	public void setUserDzone(int userDzone) {
		this.userDzone = userDzone;
	}
	
}
