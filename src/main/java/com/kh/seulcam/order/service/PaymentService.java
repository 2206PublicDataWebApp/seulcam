package com.kh.seulcam.order.service;

import java.io.IOException;

public interface PaymentService {
	 
String getToken() throws IOException;
/*
 * int paymentInfo(String imp_uid, String access_token);
 *
 * */
/*
 * public void payMentCancle(String access_token, String imp_uid, String amount,
 * String reason);
 */
  public void payMentCancle(String access_token, String imp_uid, int amount,
		  String reason) throws IOException;
 

int paymentInfo(String getimpUid, String token)throws IOException;

}