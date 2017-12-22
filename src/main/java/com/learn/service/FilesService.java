package com.learn.service;

import java.util.List;

import com.learn.model.Files;

public interface FilesService {
	public void insertFile(Files files);
	public List<Files> getAllFiles();
}
