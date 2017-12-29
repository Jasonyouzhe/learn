package com.learn.dao;

import org.springframework.stereotype.Repository;

import com.learn.model.UserRole;

@Repository
public interface RoleDao {
	public void saveRole(UserRole userRole);
}
