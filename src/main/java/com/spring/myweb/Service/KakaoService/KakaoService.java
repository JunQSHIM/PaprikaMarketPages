package com.spring.myweb.Service.KakaoService;

import java.util.HashMap;

import com.spring.myweb.VO.KakaoVO.KakaoVO;

public interface KakaoService {

	public void kakaoinsert(HashMap<String, Object> userInfo);
	public KakaoVO findkakao(HashMap<String, Object> userInfo);
	public KakaoVO getUserInfo(String access_Token);
	public String getAccessToken(String authroize_code);
}
