package com.learn.model;

public class Permissions {
	private Integer id;
	private String permissionsName;
	private String permissionsDescription;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPermissionsName() {
		return permissionsName;
	}

	public void setPermissionsName(String permissionsName) {
		this.permissionsName = permissionsName;
	}

	public String getPermissionsDescription() {
		return permissionsDescription;
	}

	public void setPermissionsDescription(String permissionsDescription) {
		this.permissionsDescription = permissionsDescription;
	}
}
