package com.learn.model;

import java.util.Date;

public class Files {
	private Integer id;
	private String userId;
	private String userName;
	private String fileDescription;
	private String fileType;
	private String filePath;
	private String fileDzone;
	private Date createTime;
	private Date updateTime;
	private String shrinkagePath="";
	
	
	public String getShrinkagePath() {
		return shrinkagePath;
	}

	public void setShrinkagePath(String shrinkagePath) {
		this.shrinkagePath = shrinkagePath;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getFileDescription() {
		return fileDescription;
	}

	public void setFileDescription(String fileDescription) {
		this.fileDescription = fileDescription;
	}

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileDzone() {
		return fileDzone;
	}

	public void setFileDzone(String fileDzone) {
		this.fileDzone = fileDzone;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

}
