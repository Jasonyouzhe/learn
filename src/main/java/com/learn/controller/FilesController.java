package com.learn.controller;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;

import javax.security.auth.Refreshable;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.learn.model.Files;
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
//		model.addAttribute("files", files);
		
		if (files == null) {
			return "faliure";
		}
		return "success";
	}
}
