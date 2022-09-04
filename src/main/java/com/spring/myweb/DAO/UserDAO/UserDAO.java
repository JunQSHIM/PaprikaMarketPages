package com.spring.myweb.DAO.UserDAO;

import java.util.HashMap;
import java.util.List;

import com.spring.myweb.VO.UserVO.UserVO;

public interface UserDAO {
	public List<UserVO> selectAll();
	public UserVO select(String id);
	public int insertUser(UserVO vo);
	public void kakaoinsert(HashMap<String, Object> userInfo);
	public UserVO findkakao(HashMap<String, Object> userInfo);
	public int locationInsert(UserVO vo);
	public int emailCheck(String email);
	public int nicknameCheck(String nickname);
	public int phoneCheck(String phone);
	public int reloadUser(UserVO vo);

}
