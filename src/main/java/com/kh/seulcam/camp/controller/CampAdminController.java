package com.kh.seulcam.camp.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.seulcam.camp.domain.Camp;
import com.kh.seulcam.camp.domain.SearchList;
import com.kh.seulcam.camp.service.CampServie;

@Controller
public class CampAdminController {
	
	@Autowired
	private CampServie cService;
	
	@RequestMapping(value = "/campAdmin/campAdminMain.kh", method = RequestMethod.GET)
	public ModelAndView campAdmin(
			@RequestParam(value = "page", required = false) Integer page,
			@ModelAttribute SearchList sList,
			ModelAndView mv) {
		try {
			List<Camp> cList = cService.printCampList(sList);
			mv.addObject("cList",cList);
			mv.setViewName("admin/campMain");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("msg", "리스트 조회 실패").setViewName("common/errorPage");
		}
		return mv;
		
		
		
	}

	// 캠핑장 리스트 검색
	@RequestMapping(value = "/campAdmin/campAdminSearch.kh", method = RequestMethod.GET)
	public String campAdminSearch(
			@ModelAttribute SearchList sList) {
		System.out.println(sList);
		
		return "admin/campMain";
	}

	
	// 캠핑장 데이터 db 등록
	@RequestMapping(value = "/campAdmin/campInsert.kh", method = RequestMethod.GET)
	public String campInsert() {
		try {
			StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B551011/GoCamping/basedList");
			
			urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8")+"=qbHoplMaKq5PUqUFEhfVjBpLiBxBcVPOw%2Fio3GvQ91q8xQjh%2BLZMz4caQ5Nqyt%2BU%2BeCGuAPRaJHRIhTzUqKmHw%3D%3D");
			urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("3243", "UTF-8")); /*한 페이지 결과 수*/
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
	        
	        List<Camp> cList = new ArrayList<Camp>();
	        System.out.println("생성시작");
	        for(int i = 0; i< itemArr.size(); i++ ) {
	        	JSONObject item = (JSONObject) parser.parse(itemArr.get(i).toString());
	        	Camp camp = new Camp();
	        		camp.setContentId(Integer.valueOf(item.get("contentId").toString()));;
	        		camp.setFacltNm(item.get("facltNm").toString());
	        		camp.setLineIntro(item.get("lineIntro").toString());
	        		camp.setIntro(item.get("intro").toString());
	        		camp.setBizrno(item.get("bizrno").toString());
	        		camp.setFeatureNm(item.get("featureNm").toString());
	        		camp.setInduty(item.get("induty").toString());
	        		camp.setLctCl(item.get("lctCl").toString());
	        		camp.setDoNm(item.get("doNm").toString());
	        		camp.setSigunguNm(item.get("sigunguNm").toString());
	        		camp.setZipcode(item.get("zipcode").toString());
	        		camp.setAddr1(item.get("addr1").toString());
	        		camp.setTel(item.get("tel").toString());
	        		camp.setMapX(item.get("mapX").toString());
	        		camp.setMapY(item.get("mapY").toString());
	        		camp.setHomepage(item.get("homepage").toString());
	        		camp.setResveUrl(item.get("resveUrl").toString());
	        		camp.setTooltip(item.get("tooltip").toString());
	        		camp.setGlampInnerFclty(item.get("glampInnerFclty").toString());
	        		camp.setCaravInnerFclty(item.get("caravInnerFclty").toString());
	        		camp.setOperPdCl(item.get("operPdCl").toString());
	        		camp.setOperDeCl(item.get("operDeCl").toString());
	        		camp.setSbrsCl(item.get("sbrsCl").toString());
	        		camp.setSbrsEtc(item.get("sbrsEtc").toString());
	        		camp.setAnimalCmgCl(item.get("animalCmgCl").toString());
	        		camp.setTourEraCl(item.get("tourEraCl").toString());
	        		camp.setFirstImageUrl(item.get("firstImageUrl").toString());
	        		cList.add(camp);
	        }
	        System.out.println("저장시작");
	        int c=0;
	        for(int i = 0; i < cList.size(); i++) {
	        	int result = cService.insertCampList(cList.get(i));
	        	c++;
	        }
	        System.out.println("저장완료 : " + c);
	        
	        
		} catch (Exception e) {
			e.getStackTrace();
			System.out.println(e.getMessage());
			return null;
		}
		return "admin/campMain";
	}
}
