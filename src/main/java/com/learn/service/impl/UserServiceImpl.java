package com.learn.service.impl;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.learn.dao.UserDao;
import com.learn.model.Role;
import com.learn.model.User;
import com.learn.service.UserService;

@Service
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Transactional
	@Override
	public void saveUser(User user) {
		userDao.saveUser(user);
	}

	@Override
	public List<User> getAllUser() {
		return userDao.getAllUser();
	}

	@Override
	public int delUserById(Integer id) {
		return userDao.delUserById(id);
	}


	@Override
	public User getUserById(Integer id) {
		User user= null;
		user= userDao.getUserById(id);
		return user;
	}

	@Override
	public int updateUserById(User user) {
		return userDao.updateUserById(user);
	}

	@Override
	public int uploadPhoto(User user) {
		return userDao.uploadPhoto(user);
	}

	@Override
	public User getUserByName(String userName) {
		return userDao.getUserByName(userName);
	}

	@Override
	public String getUserId() {
		String userId = "";
		int userNo = 0;
		userId = userDao.getUserId();
		if (userId.split("\\.").length > 1){
			userNo = Integer.parseInt(userId.split("\\.")[1])+1;
			return "No." + userNo;
		}
		return userNo+"";
	}

	@Override
	public Role getUserRoleById(Integer id) {
		
		return userDao.getUserRoleById(id);
	}

//	@Override
//	public int getAllUserCount() {
//		return userDao.getAllUserCount();
//	}
//
//	@Override
//	public List<User> findPages(int startPos, int pageSize) {
//		// TODO Auto-generated method stub
//		return null;
//	}


}
