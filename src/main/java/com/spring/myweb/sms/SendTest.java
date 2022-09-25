package com.spring.myweb.sms;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.Data;
import net.nurigo.java_sdk.api.Message;

public class SendTest {
	
		private String api_key = "NCSQGXGK3XI7U2T6"; // 실제 발급 받은 api key
		private String api_secret = "LX4T9ACCZ8ERKPUDTTBV2MCS15EQUX3J"; // 실제 발급 받은 secret api key
		private Message coolsms = new Message(api_key, api_secret);

		public int sms(ArrayList<String> info) throws Exception{
			System.out.println(info.toString());
//			HashMap<String, String> params = new HashMap<String, String>();
//			params.put("to", toList.get(0)); // 수신전화번호
//			params.put("from", "01041250364"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
//			params.put("type", "SMS");
//			params.put("text", text);
//			params.put("app_version", "test app 1.2"); // application name and version
//	
//			try {
//				JSONObject obj = (JSONObject) coolsms.send(params);
//				System.out.println(obj.toString());
//			} catch (CoolsmsException e) {
//				System.out.println(e.getMessage());
//				System.out.println(e.getCode());
//			}
			return 1;
		}
}
