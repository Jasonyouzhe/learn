package com.learn.service;

import java.util.List;

import com.learn.model.Role;
import com.learn.model.User;

public interface UserService {
	public void saveUser(User user);
	public List<User> getAllUser();
	public int delUserById(Integer id);
	public int updateUserById(User user);
	public User getUserById(Integer id);
	public int uploadPhoto(User user);
//	public int getAllUserCount();
//	public List<User> findPages(int startPos, int pageSize);
	public User getUserByName(String userName);
	public String getUserId();
	public Role getUserRoleById(Integer id);
	public User getUserRolePerByUserName(String userName);
}
