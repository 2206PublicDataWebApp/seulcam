package com.kh.seulcam.camp.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class ApiExplorer {
	public static void main(String[] args)throws IOException {
		BufferedReader br = null;
		String urlStr="http://apis.data.go.kr/B551011/GoCamping/basedList?serviceKey=qbHoplMaKq5PUqUFEhfVjBpLiBxBcVPOw%2Fio3GvQ91q8xQjh%2BLZMz4caQ5Nqyt%2BU%2BeCGuAPRaJHRIhTzUqKmHw%3D%3D&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&_type=json";
		URL url = new URL(urlStr);
		HttpURLConnection urlConn = (HttpURLConnection) url.openConnection();
		urlConn.setRequestMethod("GET");
		urlConn.setRequestProperty("Content-type", "application/json");
		System.out.println("responsecode : " + urlConn.getResponseCode());
		
		br= new BufferedReader(new InputStreamReader(urlConn.getInputStream(),"UTF-8"));
		
//		String rst = "";
//		String line;
//		while((line=br.readLine()) != null) {
//			rst += line + "\n";
//		}
//		System.out.println(rst);
		
		StringBuilder sb =new StringBuilder();
		String line;
		while((line=br.readLine()) != null) {
			sb.append(line);
		}
		System.out.println(sb);
		
		br.close();
		urlConn.disconnect();
		
//		StringBuilder urlBuilder = new StringBuilder("https://dapi.kakao.com/v2/search/blog");
//        urlBuilder.append("?" + URLEncoder.encode("sort","UTF-8") + "=" + URLEncoder.encode("accuracy", "UTF-8")); /*페이지 번호*/
//        urlBuilder.append("&" + URLEncoder.encode("page","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*한 페이지 결과 수*/
//        urlBuilder.append("&" + URLEncoder.encode("size","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*OS*/
//        urlBuilder.append("&" + URLEncoder.encode("query","UTF-8") + "=" + URLEncoder.encode(camp.getFacltNm(), "UTF-8")); /*OS*/
//        URL url = new URL(urlBuilder.toString());
//        HttpURLConnection con = (HttpURLConnection) url.openConnection();
//        con.setRequestMethod("GET");
//        con.setRequestProperty("Authorization", "KakaoAK 7072f1c5ec76f11a0937d2337e6cad4e");
//        con.setRequestProperty("Content-type", "application/json");
//        System.out.println("Printing Response Header...\n" + "responseCode : " +con.getResponseCode());
//        
//        int responseCode = con.getResponseCode(); //
//        BufferedReader br;
//        if(responseCode==200) 
//        { // 정상 호출
//            br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8")); 
//        } 
//        else 
//        {  // 에러 발생
//            br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
//        }
//        String inputLine;
//        StringBuffer sb = new StringBuffer();
//        while ((inputLine = br.readLine()) != null) 
//        {
//            sb.append(inputLine);
//        }
//        br.close();
//         JSONParser parser = new JSONParser();
//            // json data 최상단
//            JSONObject objmain = (JSONObject) parser.parse(sb.toString());
//         // json.response
//            JSONObject objResponse = (JSONObject) parser.parse(objmain.get("meta").toString());
////      System.out.println("sd>>  "+sb.toString());
////      System.out.println(objResponse.get("total_count"));
		
	}
}
