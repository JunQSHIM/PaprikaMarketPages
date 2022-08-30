package com.spring.myweb.DAO.UserDAO;

import java.util.List;

import com.spring.myweb.VO.UserVO.UserVO;

public interface UserDAO {
	public List<UserVO> selectAll();
	public UserVO select(String id);
	public int insertUser(UserVO vo);
}
