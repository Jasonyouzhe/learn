package com.learn.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.learn.model.User;
import com.learn.service.UserService;

@Controller()
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/updateUser", method = RequestMethod.POST)
	public String saveUser(@RequestParam(value = "userName") String userName,
			@RequestParam(value = "password") String password, @RequestParam(value = "userId") Integer userId,
			@RequestParam(value = "id") Integer id, User user, Model model, HttpSession session) {
		if (userId != null) {
			user = userService.getUserById(id);
			if (user != null) {
				user.setUserName(userName);
				user.setPassword(password);
			}
		}
		userService.updateUserById(user);
		model.addAttribute("user", user);
		return "userdetail";
	}

	/**
	 * 用pageHelper分页
	 * 
	 * @param userId
	 * @param model
	 * @return
	 */
	/*
	 * @RequestMapping(value = "/toList", method = RequestMethod.GET) public
	 * String saveUser(@RequestParam(value="pageNumber",required=false)Integer
	 * pageNumber, Model model,HttpSession session){ if (pageNumber == null){
	 * pageNumber=1; } PageHelper.startPage(pageNumber, 5);
	 * System.out.println(session.getAttribute("user")); List<User> userList =
	 * userService.getAllUser(); PageInfo<User> pageInfo = new
	 * PageInfo<>(userList); if (userList !=null && userList.size()>0) {
	 * model.addAttribute("userList", userList);
	 * model.addAttribute("page",pageInfo); } return "userList"; }
	 */
	@RequestMapping(value = "/deluser", method = RequestMethod.GET)
	public String delUserById(@RequestParam(value = "userId") Integer userId, Model model) {
		userService.delUserById(userId);
		return "redirect:/user/toList";
	}

	@RequestMapping(value = "/toUpdateUser", method = RequestMethod.GET)
	public String updateUserById(@RequestParam(value = "userId") Integer userId, User user, Model model) {
		if (userId != null) {
			user = userService.getUserById(userId);
			if (user != null) {
				model.addAttribute("user", user);
				return "updateUser";
			}
		}
		return "redirect:/user/toList";
	}

	@RequestMapping(value = "/{userId}/detail", method = RequestMethod.GET)
	public String userDetail(@PathVariable(value = "userId") String id, Model model) {
		User user = userService.getUserById(Integer.parseInt(id));
		if (user != null) {
			model.addAttribute("user", user);
		}
		return "userdetail";
	}

	/**
	 * 用pageHelper分页
	 * @param pageNumber
	 * @param model
	 * @return
	 * 注释点部分为pageHelper分页，由于数据较少采用前端js分页
	 */
	@RequestMapping(value = "/userlist", method = RequestMethod.GET)
	public String userList(Model model
			//@RequestParam(value = "pageNumber", required = false) Integer pageNumber, 
			) {
//		if (pageNumber == null) {
//			pageNumber = 1;
//		}
//		PageHelper.startPage(pageNumber, 5);
		List<User> userList = userService.getAllUser();
//		PageInfo<User> pageInfo = new PageInfo<>(userList);
		if (userList != null && userList.size() > 0) {
			model.addAttribute("userList", userList);
//			model.addAttribute("page", pageInfo);
		}
		return "userlist";
	}
}
