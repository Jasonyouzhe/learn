package com.learn.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.learn.dao.FilesDao;
import com.learn.model.Files;
import com.learn.service.FilesService;

@Service
@Transactional
public class FilesServiceImpl implements FilesService {
	
	@Autowired
	private FilesDao filesDao;

	@Override
	public void insertFile(Files files) {
		filesDao.insertFile(files);
		
	}

	@Override
	public List<Files> getAllFiles() {
		return filesDao.getAllFiles();
	}
}
