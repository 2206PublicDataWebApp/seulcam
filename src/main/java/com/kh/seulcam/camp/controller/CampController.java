package com.kh.seulcam.camp.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

@Controller
public class CampController {
	
	@RequestMapping(value = "/campList.kh", method = RequestMethod.GET)
	public String campList() {

		
		
		
		
		return "camp/campList";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/campListShow.kh", produces = "application/json;charset=utf-8", method = RequestMethod.GET )
	public String campListShow() {
		try {
			StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B551011/GoCamping/basedList");
			
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8")+"=qbHoplMaKq5PUqUFEhfVjBpLiBxBcVPOw%2Fio3GvQ91q8xQjh%2BLZMz4caQ5Nqyt%2BU%2BeCGuAPRaJHRIhTzUqKmHw%3D%3D");
			urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("20", "UTF-8")); /*한 페이지 결과 수*/
	        urlBuilder.append("&" + URLEncoder.encode("MobileOS","UTF-8") + "=" + URLEncoder.encode("WIN", "UTF-8")); /*OS*/
	        urlBuilder.append("&" + URLEncoder.encode("MobileApp","UTF-8") + "=" + URLEncoder.encode("seulcam", "UTF-8")); /*서비스명*/
	        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*응답데이터 형식(xml/json) default : xml*/
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        System.out.println("Response code: " + conn.getResponseCode());
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        rd.close();
	        conn.disconnect();
	        JSONParser parser = new JSONParser();
	        // json data 최상단
	        JSONObject objmain = (JSONObject) parser.parse(sb.toString());
	        // json.response
	        JSONObject objResponse = (JSONObject) parser.parse(objmain.get("response").toString());
	        // json.response.body 여기에 "numOfRows""pageNo""totalCount" 있음
	        JSONObject objBody = (JSONObject) parser.parse(objResponse.get("body").toString());
	        // json.response.body.items
	        JSONObject objItems = (JSONObject) parser.parse(objBody.get("items").toString());
	        // json.response.body.items.item item을 json배열에 담음
	        JSONArray itemArr = (JSONArray) parser.parse(objItems.get("item").toString());
	        
	        for(int i = 0; i< itemArr.size(); i++ ) {
	        	 JSONObject item = (JSONObject) parser.parse(itemArr.get(i).toString());
	        	 if(item.get("addr1").toString().contains("강원") ) {
	        		 System.out.println(0);
	        		 return new Gson().toJson(itemArr.get(i));
	        	 }
	        	 System.out.println(item.get("addr1").toString());
	        }
	        
	        System.out.println(objBody.get("pageNo").toString());
	        System.out.println(Integer.valueOf(objBody.get("totalCount").toString())/10);
	        return new Gson().toJson(itemArr.get(1));
		} catch (Exception e) {
			e.getStackTrace();
			System.out.println(e.getMessage());
			return null;
		}
		
	}
	@ResponseBody
	@RequestMapping(value = "/campLike.kh", produces = "application/json;charset=utf-8", method = RequestMethod.GET )
	public String campLike() {
		return null;
	}
}
