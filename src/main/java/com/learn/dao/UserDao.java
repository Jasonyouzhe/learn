package com.learn.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.learn.model.User;

public interface UserDao {
	public void saveUser(User user);
	public List<User> getAllUser();
	public int delUserById(Integer id);
	public int updateUserById(User user);
	public User getUserById(Integer id);
	public int uploadPhoto(User user);
//	public int getAllUserCount();
//	public List<User> findPages(@Param(value="startPos")Integer startPos, @Param(value="pageSize")Integer pageSize);
	public User getUserByName(@Param(value="userName")String userName,
			@Param(value="password")String password);
	
	@Select("SELECT user_id as userId FROM t_user ORDER BY user_id desc limit 1")
	public String getUserId();
	
}
