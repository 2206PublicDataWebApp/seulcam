package com.kh.seulcam.order.service.logic;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kh.seulcam.order.service.PaymentService;
import com.sun.mail.iap.Response;

import lombok.Data;

@Service
public class PaymentServiceImp implements PaymentService {
	
	
	 private final String impKey="0412120214522617";
	    private final String impSecret="tFL8k4PaO9xwvI0fCKE08eWl5vUF3AFRunGvDybNsqBWQZRI68z8Qq00lNz82vLgxPOym1kfv8t35xfU";
	    private RestTemplate restTemplate=new RestTemplate();
	    private HttpHeaders headers=new HttpHeaders();
	    private JSONObject body=new JSONObject();
		
		  @Data
		  private class Response{
			  private PaymentInfo response; 
			  }
		  
		  @Data 
		  private class PaymentInfo{ 
			  private int amount;
			  }
		 
	  
	  
	  public String getToken() throws IOException {
	  
	  HttpsURLConnection conn = null;
	  
	  URL url = new URL("https://api.iamport.kr/users/getToken");
	  
	  conn = (HttpsURLConnection) url.openConnection();
	  
	  conn.setRequestMethod("POST"); conn.setRequestProperty("Content-type",
	  "application/json"); conn.setRequestProperty("Accept", "application/json");
	  conn.setDoOutput(true); JsonObject json = new JsonObject();
	  
	  json.addProperty("imp_key", impKey); json.addProperty("imp_secret",
	  impSecret);
	  
	  BufferedWriter bw = new BufferedWriter(new
	  OutputStreamWriter(conn.getOutputStream()));
	  
	  bw.write(json.toString()); bw.flush(); bw.close();
	  
	  BufferedReader br = new BufferedReader(new
	  InputStreamReader(conn.getInputStream(), "utf-8"));
	  
	  Gson gson = new Gson();
	  
	  String response = gson.fromJson(br.readLine(),
	  Map.class).get("response").toString();
	  
	  System.out.println(response);
	  
	  String token = gson.fromJson(response,
	  Map.class).get("access_token").toString();
	  
	  br.close(); conn.disconnect();
	  
	  return token; 
	  }
	  
	  
	  public void payMentCancle(String access_token, String imp_uid, int amount, String reason) throws IOException  {
			System.out.println("결제 취소");
			
			HttpsURLConnection conn = null;
			URL url = new URL("https://api.iamport.kr/payments/cancel");
	 
			conn = (HttpsURLConnection) url.openConnection();
	 
			conn.setRequestMethod("POST");
	 
			conn.setRequestProperty("Content-type", "application/json");
			conn.setRequestProperty("Accept", "application/json");
			conn.setRequestProperty("Authorization", access_token);
	 
			conn.setDoOutput(true);
			
			JsonObject json = new JsonObject();
	 
			json.addProperty("reason", reason);
			json.addProperty("imp_uid", imp_uid);
			json.addProperty("amount", amount);
			json.addProperty("checksum", amount);
	 
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	 
			bw.write(json.toString());
			bw.flush();
			bw.close();
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
	 
			br.close();
			conn.disconnect();
			
			
		}

	@Override
	public int paymentInfo(String getimpUid, String token) throws IOException {
		// TODO Auto-generated method stub
		return 0;
	}
		
		
		
		
	  
	  
	  
	  
	 
	/*
	 * public int paymentInfo(String imp_uid, String access_token) {
	 * HttpsURLConnection conn = null;
	 * 
	 * URL url = new URL("https://api.iamport.kr/payments/" + imp_uid);
	 * 
	 * conn = (HttpsURLConnection) url.openConnection();
	 * 
	 * conn.setRequestMethod("GET"); conn.setRequestProperty("Authorization",
	 * access_token); conn.setDoOutput(true);
	 * 
	 * BufferedReader br = new BufferedReader(new
	 * InputStreamReader(conn.getInputStream(), "utf-8"));
	 * 
	 * Gson gson = new Gson();
	 * 
	 * Response response = gson.fromJson(br.readLine(), Response.class);
	 * 
	 * br.close(); conn.disconnect();
	 * 
	 * return response.getResponse().getAmount(); }
	 * 
	 * }
	 * 
	 * 
	 * 
	 * public void payMentCancle(String access_token, String imp_uid, String amount,
	 * String reason) { System.out.println("결제 취소");
	 * 
	 * System.out.println(access_token);
	 * 
	 * System.out.println(imp_uid);
	 * 
	 * HttpsURLConnection conn = null; URL url = new
	 * URL("https://api.iamport.kr/payments/cancel");
	 * 
	 * conn = (HttpsURLConnection) url.openConnection();
	 * 
	 * conn.setRequestMethod("POST");
	 * 
	 * conn.setRequestProperty("Content-type", "application/json");
	 * conn.setRequestProperty("Accept", "application/json");
	 * conn.setRequestProperty("Authorization", access_token);
	 * 
	 * conn.setDoOutput(true);
	 * 
	 * JsonObject json = new JsonObject();
	 * 
	 * json.addProperty("reason", reason); json.addProperty("imp_uid", imp_uid);
	 * json.addProperty("amount", amount); json.addProperty("checksum", amount);
	 * 
	 * BufferedWriter bw = new BufferedWriter(new
	 * OutputStreamWriter(conn.getOutputStream()));
	 * 
	 * bw.write(json.toString()); bw.flush(); bw.close();
	 * 
	 * BufferedReader br = new BufferedReader(new
	 * InputStreamReader(conn.getInputStream(), "utf-8"));
	 * 
	 * br.close(); conn.disconnect();
	 * 
	 * }
	 */

}
