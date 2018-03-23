package com.learn.faceidentify;

import java.util.HashMap;

import org.json.JSONException;
import org.json.JSONObject;

import com.baidu.aip.ocr.AipOcr;

public class ImageOCR {
	//设置APPID/AK/SK
    public static final String APP_ID = "10483726";
    public static final String API_KEY = "RDIF5sOGkoOStf34uS7Yf2Mp";
    public static final String SECRET_KEY = "2ZGVtPswZvrPrCN0c5NgI2KpNGOnin0h";

    public static void main(String[] args) throws JSONException {
        // 初始化一个AipOcr
        AipOcr client = new AipOcr(APP_ID, API_KEY, SECRET_KEY);

        // 可选：设置网络连接参数
        client.setConnectionTimeoutInMillis(2000);
        client.setSocketTimeoutInMillis(60000);

        // 可选：设置代理服务器地址, http和socket二选一，或者均不设置
        //client.setHttpProxy("proxy_host", proxy_port);  // 设置http代理
        //client.setSocketProxy("proxy_host", proxy_port);  // 设置socket代理

        // 调用接口
        String path = "C:\\Users\\Jason_Zhang\\Desktop\\linefiles\\p2.png";
        JSONObject res = client.basicGeneral(path, new HashMap<String, String>());
        System.out.println(res.toString());

    }
}
