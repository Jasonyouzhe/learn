package com.learn.controller;

import java.awt.image.RenderedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.learn.model.Files;
import com.learn.model.User;
import com.learn.model.UserRole;
import com.learn.service.FilesService;
import com.learn.service.RoleService;
import com.learn.service.UserService;
import com.learn.service.impl.RedisCache;
import com.learn.util.CodeUtil;
import com.learn.util.FileUtil;

@Controller
public class LoginController {

	@Autowired
	UserService userService;

	@Autowired
	private FilesService filesService;
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private RedisCache redisCache;

	/**
	 * 
	 * @param request
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/login")
	public String login(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		String flag = request.getParameter("f");
		User user = null;
		UserRole userRole = null;
		if (flag.equals("register")){
			try {
				if (!userService.getUserId().isEmpty()) {
					user = new User();
					user.setUserId(userService.getUserId());
					user.setUserName(userName);
					user.setPassword(password);
					userService.saveUser(user);
					userRole = new UserRole(String.valueOf(user.getId()),"3");
					roleService.saveRole(userRole);
				}
			} catch (Exception e) {
				System.out.println("exception:"+e.getStackTrace());
			}
		}
		UsernamePasswordToken token = new UsernamePasswordToken(userName, password);
        //获取当前的Subject  
        Subject subject = SecurityUtils.getSubject();
        //token.setRememberMe(true);  
        System.out.println("对用户[" + userName + "]进行登录验证..验证开始"); 
        //这一步在调用login(token)方法时,它会走到MyRealm.doGetAuthenticationInfo()方法中,具体验证方式详见此方法  
        subject.login(token);  
        System.out.println("对用户[" + userName + "]进行登录验证..验证通过"); 
        
        redisCache.put("redisKey", "登录时用保存rediskey");
        
        //验证是否登录成功  
        if(subject.isAuthenticated()){  
        	user = (User) subject.getSession().getAttribute("user");
        }else{  
            token.clear(); 
            return "redirect:/tologin";
        }  
		request.getSession().setAttribute("user", user);
		return "redirect:/index3";
	}

	@RequestMapping("/index3")
	public String index3(HttpServletRequest request, Model model) throws Exception {
		System.out.println("loading index3");
		redisCache.get("redisKey");
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
	public String loginPage(HttpServletRequest request,Model model) throws Exception {
		String path = request.getSession().getServletContext().getRealPath("/resources/");
    	String codePath = path.split(request.getContextPath().replace("/", ""))[0];
    	codePath = codePath+File.separator+"temp/img/";
		FileUtil.deleteAll(new File(codePath));
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
	
	@RequestMapping("/getCode")
	@ResponseBody
    public String  getCode(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        // 调用工具类生成的验证码和验证码图片
        resp.setContentType("text/xml;charset=UTF-8"); 
        
        Map<String, Object> codeMap = CodeUtil.generateCodeAndPic();
        // 将四位数字的验证码保存到Session中。
        HttpSession session = req.getSession();
		String path = session.getServletContext().getRealPath("/resources/");
    	String codePath = path.split(req.getContextPath().replace("/", ""))[0];
    	codePath = codePath+File.separator+"temp/img/";
		long time = System.currentTimeMillis();
		String originFileName =time + "code.jpg";
        session.setAttribute("code", codeMap.get("code").toString());
        if (session.getAttribute("picName")!=null && !"".equals(session.getAttribute("picName"))){
        	File f1 = new File(codePath+session.getAttribute("picName"));  
            if(f1.exists() && f1.isFile()){  
                f1.delete();  
            }  
        }
        // 禁止图像缓存。
        resp.setHeader("Pragma", "no-cache");
        resp.setHeader("Cache-Control", "no-cache");
        resp.setDateHeader("Expires", -1);
        req.setCharacterEncoding("utf-8");
        OutputStream out = new FileOutputStream(new File(codePath+originFileName));
        ImageIO.write((RenderedImage) codeMap.get("codePic"), "jpg", out);
        session.setAttribute("picName", originFileName);
        return "/files/img/"+originFileName;
    }
	
	@RequestMapping("/checkCode")
	@ResponseBody
    public String checkCode(HttpServletRequest request, HttpServletResponse resp) throws Exception {
        // 验证验证码
        String code = request.getParameter("code");
        String sessionCode = request.getSession().getAttribute("code").toString();
        if (!(code != null && !"".equals(code) 
        		&& sessionCode != null && !"".equals(sessionCode) 
        		&& code.equalsIgnoreCase(sessionCode))) {
        	return "false";
        } 
        return "true";
    }
}
