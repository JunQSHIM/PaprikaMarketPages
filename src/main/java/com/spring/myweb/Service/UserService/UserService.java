package com.spring.myweb.Service.UserService;

import java.util.HashMap;
import java.util.List;

import com.spring.myweb.VO.UserVO.UserVO;

public interface UserService {
	public List<UserVO> selectAll();
	public UserVO select(String id);
	public int insertUser(UserVO vo);
	public String getAccessToken(String authroize_code);
	public HashMap<String, Object> getUserInfo(String access_Token);
	public void kakaoLogout(String access_Token);
}
