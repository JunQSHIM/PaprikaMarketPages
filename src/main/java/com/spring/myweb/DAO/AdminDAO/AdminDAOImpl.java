package com.spring.myweb.DAO.AdminDAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.myweb.VO.AdminVO.UserSmsVO;
import com.spring.myweb.VO.UserVO.UserVO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Inject
	private SqlSession session;

	@Override
	public List<UserVO> selectAll() {
		List<UserVO> userList = session.selectList("userDB.selectUserAll");
		return userList;
	}

	@Override
	public List<UserSmsVO> selectSmsAll() {
		List<UserSmsVO> userSmsList = session.selectList("userDB.selectUserSms");
		return userSmsList;
	}



}
