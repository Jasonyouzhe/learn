package com.learn.controller;


import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.learn.model.User;
import com.learn.service.UserService;

@Controller()
@RequestMapping(value = "/user")
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/updateUser", method = RequestMethod.POST)
	public String saveUser(@RequestParam(value = "userName") String userName, 
			@RequestParam(value = "password") String password,
			@RequestParam(value = "userId") Integer userId,
			@RequestParam(value = "id") Integer id,User user ,
//			@RequestParam(value = "filePic", required = false)MultipartFile filePic,
			Model model, HttpSession session) {
			if (userId !=null) {	
				user = userService.getUserById(id);
				if (user!=null) {
					user.setUserName(userName);
					user.setPassword(password);
				}
			}
			/*if (filePic!=null) {
					String path = session.getServletContext().getRealPath("/resources/image/");
					System.out.println(path);
					long time = System.currentTimeMillis();
					String originFileName =time + filePic.getOriginalFilename();
					try {
						File file = new File(path+originFileName);
						if (!file.exists()){
							file.mkdirs();
						}
						user.setPhoto("../resources/image/"+originFileName);
						filePic.transferTo(file);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
			}*/
			userService.updateUserById(user);
			model.addAttribute("user", user);
			return "userdetail";
	}
	
	@RequestMapping(value = "/toList", method = RequestMethod.GET)
	public String saveUser(@RequestParam(value="pageNumber",required=false)Integer pageNumber, Model model,HttpSession session) {
		if (pageNumber == null){			
			pageNumber=1;
		}
        PageHelper.startPage(pageNumber, 5);     
		System.out.println(session.getAttribute("user"));
		List<User>  userList = userService.getAllUser();
		PageInfo<User> pageInfo = new PageInfo<>(userList);
		if (userList !=null && userList.size()>0) {			
			model.addAttribute("userList", userList);
			model.addAttribute("page", pageInfo);
		}
		return "userList";
	}
	@RequestMapping(value = "/deluser", method = RequestMethod.GET)
	public String delUserById(@RequestParam(value = "userId") Integer userId,Model model) {
		userService.delUserById(userId);
		return "redirect:/user/toList";
	}
	@RequestMapping(value = "/toUpdateUser", method = RequestMethod.GET)
	public String updateUserById(@RequestParam(value = "userId") Integer userId,User user,Model model) {
		if (userId !=null) {	
			user = userService.getUserById(userId);
			if (user!=null) {
				model.addAttribute("user", user);
				return "updateUser";
			}
		}
		return "redirect:/user/toList";
	}
	@RequestMapping(value = "/toUploadPhoto", method = RequestMethod.GET)
	public String tpUploadPhoto(@RequestParam(value = "userId") Integer userId,Model model) {
			User user = userService.getUserById(userId);
			if (user!=null) {
				 model.addAttribute("user",user);
		}
		return "uploadImage";
	}
	@RequestMapping(value = "/UploadImage", method = RequestMethod.POST)
	public String uploadPhoto(@RequestParam(value = "filePic", required = false)MultipartFile filePic,
			@RequestParam(value = "userId") Integer userId,
			User user , Model model,HttpSession session,HttpServletRequest request) {
		String path = session.getServletContext().getRealPath("/resources/image/");
		System.out.println(path);
		long time = System.currentTimeMillis();
		String originFileName =time + filePic.getOriginalFilename();
		try {
			File file = new File(path+originFileName);
			if (!file.exists()){
				file.mkdirs();
			}
			filePic.transferTo(file);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		if (userId !=null) {	
			user = userService.getUserById(userId);
			if (user!=null) {
				user.setPhotoPath("../resources/image/"+originFileName);
				userService.uploadPhoto(user);
			}
		}
		model.addAttribute("user", user);
		return "redirect:/user/toList ";
	}
	
	@RequestMapping(value = "/fileupload", method = RequestMethod.POST)
	public String uploadFile(@RequestParam(value = "file", required = false)MultipartFile filePic,
			@RequestParam(value = "userId") Integer userId,
			User user , Model model,HttpSession session,HttpServletRequest request) {
		System.out.println("uploading");
		String path = session.getServletContext().getRealPath("/resources/image/");
		System.out.println(path);
		long time = System.currentTimeMillis();
		String originFileName =time + filePic.getOriginalFilename();
		try {
			File file = new File(path+originFileName);
			if (!file.exists()){
				file.mkdirs();
			}
			filePic.transferTo(file);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		if (userId !=null) {	
			user = userService.getUserById(userId);
			if (user!=null) {
				user.setPhotoPath("../resources/image/"+originFileName);
				userService.uploadPhoto(user);
			}
		}
		model.addAttribute("user", user);
		return "redirect:/user/toList ";
	}
	
	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public ResponseEntity<byte[]> downLoadImage(HttpServletRequest request,
			@RequestParam(value = "userId") Integer userId,Model model) {
			User user = userService.getUserById(userId);
	        //下载文件路径
			int length = user.getPhotoPath().split("/").length-1;
			String path0 = user.getPhotoPath().substring(2);
			String filename = user.getPhotoPath().split("/")[length];
	        String  path = request.getServletContext().getRealPath(path0);
	        File file = new File(path);
	        HttpHeaders headers = new HttpHeaders();  
	        //下载显示的文件名，解决中文名称乱码问题  
	        String downloadFielName = null;
			try {
				downloadFielName = new String(filename.getBytes("UTF-8"),"iso-8859-1");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
	        //通知浏览器以attachment（下载方式）打开图片
	        headers.setContentDispositionFormData("attachment", downloadFielName); 
	        //application/octet-stream ： 二进制流数据（最常见的文件下载）。
	        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	        try {
				return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),    
				        headers, HttpStatus.CREATED);
			} catch (IOException e) {
				e.printStackTrace();
			}
	        return null;
	     }
	@RequestMapping(value = "/{userId}/detail", method = RequestMethod.GET)
	public String userDetail(@PathVariable(value = "id") Integer id,Model model) {
			User user = userService.getUserById(id);
			if (user!=null) {
				 model.addAttribute("user",user);
		}
		return "userdetail";
	}
	@RequestMapping(value = "/formcommon", method = RequestMethod.GET)
	public String formcommon(Model model) {
		return "form-common";
	}
}
