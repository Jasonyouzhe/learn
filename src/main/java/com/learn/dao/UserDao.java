package com.learn.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.learn.model.User;

@Repository
public interface UserDao {
	public void saveUser(User user);
	public List<User> getAllUser();
	public int delUserById(Integer id);
	public int updateUserById(User user);
	public User getUserById(Integer id);
	public int uploadPhoto(User user);
	public User getUserByName(@Param(value="userName")String userName);
	
	@Select("SELECT user_id as userId FROM t_user ORDER BY id desc limit 1")
	public String getUserId();
	public User getUserRolePerByUserName(String userName);
	
}
