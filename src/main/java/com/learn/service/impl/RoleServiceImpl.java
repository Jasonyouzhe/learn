package com.learn.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.learn.dao.RoleDao;
import com.learn.model.UserRole;
import com.learn.service.RoleService;

@Service
@Transactional
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleDao roleDao;

	public void saveRole(UserRole userRole) {
		roleDao.saveRole(userRole);
	}
}
