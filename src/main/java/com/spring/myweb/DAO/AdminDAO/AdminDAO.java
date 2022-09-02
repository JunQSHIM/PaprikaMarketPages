package com.spring.myweb.DAO.AdminDAO;

import java.util.List;

import com.spring.myweb.VO.AdminVO.UserSmsVO;
import com.spring.myweb.VO.UserVO.UserVO;

public interface AdminDAO {
	public List<UserVO> selectAll();
	public List<UserSmsVO> selectSmsAll();//회원 sms 목록
}
