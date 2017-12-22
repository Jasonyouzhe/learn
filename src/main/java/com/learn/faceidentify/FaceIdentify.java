package com.learn.faceidentify;

import java.io.IOException;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;

import org.json.JSONException;
import org.json.JSONObject;
import com.youtu.*;

public class FaceIdentify {

	public static final String APP_ID = "10110574";
	public static final String SECRET_ID = "AKIDdQJ7rg9Ch1DFBwjwS0b4Y5gGf08AghJm";
	public static final String SECRET_KEY = "QtEPWm7Y3Vmt1FKG2f9SZVFtOp5A4mJg";
	public static final String USER_ID = "1103220107";
	
	public static void main(String[] args) throws KeyManagementException, NoSuchAlgorithmException, IOException, JSONException {
		//优图初始化方式
		Youtu faceYoutu = new Youtu(APP_ID, SECRET_ID, SECRET_KEY,Youtu.API_YOUTU_END_POINT, USER_ID);
		//腾讯云初始化方式;2种初始化方式选择一种即可，优图是免费提供给大家使用的
//		Youtu faceQcloud = new Youtu(APP_ID, SECRET_ID, SECRET_KEY,Youtu.API_TENCENTYUN_END_POINT, USER_ID);

		//人脸检测调用示例
//		JSONObject respose = faceYoutu.DetectFace("E:\\temp\\td.jpg",1);
		JSONObject respose = faceYoutu.NameCardOcr("E:\\temp\\5.jpg", false);
		
//		System.out.println(respose.get("itemstring"));
		System.out.println(respose.get("tags"));
		//get respose 
//		System.out.println(respose);
		//get detail info
//		if(respose.getInt("errorcode")==0){
//		    System.out.println(respose.get("image_height"));
//		    System.out.println(respose.get("face"));
//		    System.out.println(respose.getJSONArray("face").getJSONObject(0).get("yaw"));
//		    System.out.println(respose.getInt("errorcode"));
//		    System.out.println(respose.get("errormsg"));
//		}
	}

}
