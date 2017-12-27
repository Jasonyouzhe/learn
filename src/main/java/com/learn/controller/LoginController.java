package com.learn.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.expr.NewArray;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.Permission;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.learn.model.Files;
import com.learn.model.Role;
import com.learn.model.User;
import com.learn.service.FilesService;
import com.learn.service.UserService;
import com.learn.service.impl.UserServiceImpl;

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
	@RequiresRoles("admin")
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
		UsernamePasswordToken token = new UsernamePasswordToken(userName, password);
        //获取当前的Subject  
        Subject subject = SecurityUtils.getSubject();
        System.out.println(subject.hasRole("admin"));
        //token.setRememberMe(true);  
        System.out.println("对用户[" + userName + "]进行登录验证..验证开始"); 
        //这一步在调用login(token)方法时,它会走到MyRealm.doGetAuthenticationInfo()方法中,具体验证方式详见此方法  
        subject.login(token);  
        System.out.println("对用户[" + userName + "]进行登录验证..验证通过"); 
        
        //验证是否登录成功  
        if(subject.isAuthenticated()){  
            //System.out.println("用户[" + username + "]登录认证通过(这里可以进行一些认证通过后的一些系统参数初始化操作)");  
        	user = (User) subject.getSession().getAttribute("user");
        	//user = userService.getUserByName(userName);
        }else{  
            token.clear(); 
            return "redirect:/tologin";
        }  
		
		model.addAttribute("user", user);
		request.getSession().setAttribute("user", user);
//		if (user != null && !userName.equals("admin")) {
//			return "index";
//		}
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
	
	public static void main(String[] args) {
		UserService userService1 = new UserServiceImpl();
		User user = userService1.getUserById(1);
		if (user != null) {
			System.out.println(user.getUserName());
			System.out.println(user.getRoles().get(0).getRoleName());
		}
	}

}
