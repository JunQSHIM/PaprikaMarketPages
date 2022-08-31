package com.spring.myweb.DAO.KakaoDAO;

import java.util.HashMap;

import com.spring.myweb.VO.KakaoVO.KakaoVO;

public interface KakaoDAO {

	public void kakaoinsert(HashMap<String, Object> userInfo);
	public KakaoVO findkakao(HashMap<String, Object> userInfo);
}
