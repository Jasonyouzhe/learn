package com.learn.util;

import java.io.File;

import javax.naming.spi.DirStateFactory;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.weaver.ast.And;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.learn.model.User;

public class LoginHandlerIntercepter implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String requestURI = request.getRequestURI();
//		System.out.println(requestURI);
//        if(requestURI.indexOf("editClientIfo.action")>0){  
//            //说明处在编辑的页面  
        HttpSession session = request.getSession();  
        User user = (User) session.getAttribute("user"); 
        if(user!=null){
//        	System.out.println("name:"+user.getUserName());
            //登陆成功的用户  
            return true;  
        }else{  
           //没有登陆，转向登陆界面 
        	response.sendRedirect(request.getContextPath()+"/tologin");
//            request.getRequestDispatcher("/tologin").forward(request,response);  
          return false;  
        }  
//        }else{  
//            return true;  
//        } 
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
