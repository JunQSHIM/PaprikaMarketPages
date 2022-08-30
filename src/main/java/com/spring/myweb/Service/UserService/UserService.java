package com.spring.myweb.Service.UserService;

import java.util.HashMap;
import java.util.List;

import com.spring.myweb.VO.KakaoVO.KakaoVO;
import com.spring.myweb.VO.UserVO.UserVO;

public interface UserService {
	public List<UserVO> selectAll();
	public UserVO select(String id);
	public int insertUser(UserVO vo);
	public void kakaoinsert(HashMap<String, Object> userInfo);
	public UserVO findkakao(HashMap<String, Object> userInfo);
	public String getAccessToken(String authroize_code);
	public UserVO getUserInfo(String access_Token);
	public void kakaoLogout(String access_Token);
	public void unlink(String access_Token);
}
