package com.learn.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class BasePathInterceptor extends HandlerInterceptorAdapter {
	private static Logger logger = Logger.getLogger(BasePathInterceptor.class);
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String scheme = request.getScheme();
        String serverName = request.getServerName();
        int port = request.getServerPort();
        String path1 = request.getContextPath();
        String basePath = scheme + "://" + serverName + ":" + port + path1;
        logger.info(basePath);
        request.setAttribute("basePath", basePath);
        return true;
	}
}
