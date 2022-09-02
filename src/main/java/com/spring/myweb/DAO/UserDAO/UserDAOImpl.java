package com.spring.myweb.DAO.UserDAO;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.myweb.VO.UserVO.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{

	@Inject
	private SqlSession session;

	@Override
	public List<UserVO> selectAll() {
		List<UserVO> userList = session.selectList("userDB.selectUserAll");
		return userList;
	}

	@Override
	public UserVO select(String id) {
		UserVO user = session.selectOne("userDB.selectUser", id);
		return user;
	}

	@Override
	public int insertUser(UserVO vo) {
		int success = 0;
		success = session.insert("userDB.insertUser", vo); 
		return success;
	}

	@Override
	public void kakaoinsert(HashMap<String, Object> userInfo) {
		session.insert("userDB.kakaoInsert",userInfo);
	}

	@Override
	public UserVO findkakao(HashMap<String, Object> userInfo) {
		return session.selectOne("userDB.findKakao", userInfo);
	}

	@Override
	public int locationInsert(UserVO vo) {
		int success = 0;
		success = session.update("userDB.locationInsert",vo);
		return success;
	}
	

}
