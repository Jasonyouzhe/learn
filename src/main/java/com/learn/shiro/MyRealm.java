package com.learn.shiro;

import java.util.ArrayList;
import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.springframework.util.StringUtils;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

import com.learn.model.Permissions;
import com.learn.model.Role;
import com.learn.model.User;
import com.learn.service.UserService;
import com.learn.service.impl.RedisCache;

public class MyRealm extends AuthorizingRealm {

	@Autowired
	UserService userService;
	
	@Autowired
	private RedisCache redisCache;
	/**
	 * 授权信息
	 * http://www.sojson.com/blog/143.html
	 * http://blog.csdn.net/clj198606061111/article/details/24185023
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		// 获取当前登录的用户名,等价于(String)principals.fromRealm(this.getName()).iterator().next()
		String currentUsername = (String) super.getAvailablePrincipal(principals);
		List<String> roleList = new ArrayList<String>();
		List<String> permissionList = new ArrayList<String>();
		// 从数据库中获取当前登录用户的详细信息
//		User user = userService.getUserByName(currentUsername);
		User user = userService.getUserRolePerByUserName(currentUsername);
		if (null != user) {
			// 实体类User中包含有用户角色的实体类信息
			if (null != user.getRoles() && user.getRoles().size() > 0) {
				// 获取当前登录用户的角色
				for (Role role : user.getRoles()) {
					roleList.add(role.getRoleName());
					// 实体类Role中包含有角色权限的实体类信息
					if (null != role.getPermissions() && role.getPermissions().size() > 0) {
						// 获取权限
						for (Permissions pmss : role.getPermissions()) {
							if (!StringUtils.isEmpty(pmss.getPermissionsName())) {
								permissionList.add(pmss.getPermissionsName());
							}
						}
					}
				}
			}
		} else {
			throw new AuthorizationException();
		}
		// 为当前用户设置角色和权限
		SimpleAuthorizationInfo simpleAuthorInfo = new SimpleAuthorizationInfo();
		simpleAuthorInfo.addRoles(roleList);
		simpleAuthorInfo.addStringPermissions(permissionList);
		return simpleAuthorInfo;
	}

	/**
	 * 认证信息 http://blog.csdn.net/dawangxiong123/article/details/53020424
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authcToken)
			throws AuthenticationException {
		UsernamePasswordToken token = (UsernamePasswordToken) authcToken;
		User user = userService.getUserByName(token.getUsername());
		if (null != user) {
			AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(user.getUserName(), user.getPassword(),
					getName());
//			this.setSession("user", user);
			redisCache.put("user", user);
			return authcInfo;
		} else {
			return null;
		}
	}

	/**
	 * 将一些数据放到ShiroSession中,以便于其它地方使用
	 * 
	 * @see 比如Controller,使用时直接用HttpSession.getAttribute(key)就可以取到
	 */
	private void setSession(Object key, Object value) {
		Subject currentUser = SecurityUtils.getSubject();
		if (null != currentUser) {
			Session session = currentUser.getSession();
			System.out.println("Session默认超时时间为[" + session.getTimeout() + "]毫秒");
			if (null != session) {
				session.setAttribute(key, value);
			}
		}
	}
}
