package com.learn.controller;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;

import javax.security.auth.Refreshable;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.learn.model.Files;
import com.learn.model.User;
import com.learn.service.FilesService;
import com.learn.util.FileUtil;
import com.learn.util.VideoCV;

@Controller
@RequestMapping(value = "/user/file")
public class FilesController {
	
	@Autowired 
	private FilesService filesService;
	
	@ResponseBody
	@RequestMapping(value = "/fileupload", method = RequestMethod.POST)
	public String uploadFile(@RequestParam(value = "file", required = false)MultipartFile filePic,
			@RequestParam(value = "userId") String userId,
			@RequestParam(value = "userName") String userName,
			@RequestParam(value = "fileDescription") String fileDescription,
			@RequestParam(value = "fileType") String fileType,
			Model model,HttpSession session,HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		String path = session.getServletContext().getRealPath("/resources/files/");
    	String dir1 = path.split(request.getContextPath().replace("/", ""))[0];
    	dir1 = dir1+File.separator+"temp"+"/";
		long time = System.currentTimeMillis();
		String originFileName =time + filePic.getOriginalFilename();
		URLEncoder.encode(originFileName,"utf-8");
		try {
			File file = new File(dir1+originFileName);
			if (!file.exists()){
				file.mkdirs();
			}
			filePic.transferTo(file);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// 截取视频缩率图
		String shrinkageName=originFileName.split("\\.")[0]+".jpg";
		try {
			String shrinkagePath=dir1+shrinkageName;
			VideoCV.fetchFrame(dir1+originFileName, shrinkagePath);
		} catch (Exception e) {
			System.out.println("截取视频缩率图异常 ");
			e.printStackTrace();
		}
		Files files=null;
		if (userId !=null) {
			files = new Files();
			files.setUserId(userId);
			files.setUserName(userName);
			files.setFileDescription(fileDescription);
			files.setFileType(fileType);
			files.setCreateTime(new Date());
			files.setFilePath(originFileName);
			files.setShrinkagePath(shrinkageName);
			filesService.insertFile(files);
		}
		if (files == null) {
			return "faliure";
		}
		return "success";
	}
	
	/**
	 * down files
	 * @param request
	 * @param userId
	 * @param model
	 * @return
	 */
	/*@RequestMapping(value = "/download", method = RequestMethod.GET)
	public ResponseEntity<byte[]> downLoadImage(HttpServletRequest request,
			@RequestParam(value = "userId") Integer userId, Model model) {
		User user = userService.getUserById(userId);
		// 下载文件路径
		int length = user.getPhotoPath().split("/").length - 1;
		String path0 = user.getPhotoPath().substring(2);
		String filename = user.getPhotoPath().split("/")[length];
		String path = request.getServletContext().getRealPath(path0);
		File file = new File(path);
		HttpHeaders headers = new HttpHeaders();
		// 下载显示的文件名，解决中文名称乱码问题
		String downloadFielName = null;
		try {
			downloadFielName = new String(filename.getBytes("UTF-8"), "iso-8859-1");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		// 通知浏览器以attachment（下载方式）打开图片
		headers.setContentDispositionFormData("attachment", downloadFielName);
		// application/octet-stream ： 二进制流数据（最常见的文件下载）。
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		try {
			return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}*/
}
