package com.kh.seulcam.camp.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CampController {
	
	@RequestMapping(value = "/campList.kh", method = RequestMethod.GET)
	public String campList() {
		BufferedReader br = null;
		try {
			String urlStr="http://apis.data.go.kr/B551011/GoCamping/basedList?serviceKey=qbHoplMaKq5PUqUFEhfVjBpLiBxBcVPOw%2Fio3GvQ91q8xQjh%2BLZMz4caQ5Nqyt%2BU%2BeCGuAPRaJHRIhTzUqKmHw%3D%3D&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json";
			URL url = new URL(urlStr);
			HttpURLConnection urlConn = (HttpURLConnection) url.openConnection();
			urlConn.setRequestMethod("GET");
			urlConn.setRequestProperty("Content-type", "application/json");
			System.out.println("responsecode : " + urlConn.getResponseCode());
			
			br= new BufferedReader(new InputStreamReader(urlConn.getInputStream(),"UTF-8"));
			
//			String rst = "";
//			String line;
//			while((line=br.readLine()) != null) {
//				rst += line + "\n";
//			}
//			System.out.println(rst);
			
			StringBuilder sb =new StringBuilder();
			String line;
			while((line=br.readLine()) != null) {
				sb.append(line);
			}
			System.out.println(sb);
			
			
		} catch (Exception e) {
			e.getStackTrace();
			System.out.println(e.getMessage());
		}
		
		
		return "camp/campList";
	}
}
