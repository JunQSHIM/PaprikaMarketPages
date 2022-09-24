package net.example.message;

import java.util.HashMap;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class SendTest {
	public static void main(String[] args) {
		String api_key = "NCSQGXGK3XI7U2T6"; // 실제 발급 받은 api key
		String api_secret = "LX4T9ACCZ8ERKPUDTTBV2MCS15EQUX3J"; // 실제 발급 받은 secret api key
		Message coolsms = new Message(api_key, api_secret);

		// 4 params(to, from, type, text) are mandatory. must be filled
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", "01020676295"); // 수신전화번호
		params.put("from", "01041250363"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
		params.put("type", "SMS");
		params.put("text", "Test 문자 메시지 발송");
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
	}
}
