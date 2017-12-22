package com.learn.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.learn.model.Files;
import com.learn.model.User;
import com.learn.service.FilesService;
import com.learn.service.UserService;

@Controller
public class LoginController {

	@Autowired
	UserService userService;

	@Autowired
	private FilesService filesService;

	/**
	 * 
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/login")
	public String login(HttpServletRequest request, Model model) throws Exception {
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		String flag = request.getParameter("f");
		User user = null;
		if (flag.equals("register")){
			try {
				if (!userService.getUserId().isEmpty()) {
					user = new User();
					user.setUserId(userService.getUserId());
					user.setUserName(userName);
					user.setPassword(password);
					userService.saveUser(user);
				}
			} catch (Exception e) {
				System.out.println("exception:"+e.getStackTrace());
			}
		}
		user = userService.getUserByName(userName, password);
		if (user==null) {
			return "redirect:/tologin";
		}
		model.addAttribute("user", user);
		request.getSession().setAttribute("user", user);
		if (user != null && userName.equals("admin")) {
			return "index";
		}
		return "redirect:/index3";
	}

	@RequestMapping("/index3")
	public String index3(HttpServletRequest request, Model model) throws Exception {
		System.out.println("loading index3");
		List<Files> fileList = filesService.getAllFiles();
		if (fileList != null && fileList.size() > 0) {
			model.addAttribute("fileList", fileList);
		} else {
			model.addAttribute("fileList", null);

		}
		return "index3";
	}

	/**
	 * 
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = { "/tologin", "/" })
	public String loginPage(HttpServletRequest request, Model model) throws Exception {
		return "login";
	}

	/**
	 * 
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/toregister")
	public String registerPage(HttpServletRequest request, Model model) throws Exception {
		return "register";
	}

	@RequestMapping("/logout")
	public String loguot(HttpServletRequest request, Model model) throws Exception {
		request.getSession().removeAttribute("user");

		return "login";
	}

}
