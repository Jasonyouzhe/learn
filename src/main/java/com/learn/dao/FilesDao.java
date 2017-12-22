package com.learn.dao;

import java.util.List;

import com.learn.model.Files;

public interface FilesDao {
	public void insertFile(Files files);
	public List<Files> getAllFiles();
}
