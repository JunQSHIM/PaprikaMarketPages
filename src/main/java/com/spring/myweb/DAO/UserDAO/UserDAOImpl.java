package com.spring.myweb.DAO.UserDAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.myqwb.VO.WithdrawalVO.WithdrawalVO;
import com.spring.myweb.VO.MyMannerVO.MyMannerVO;
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

	@Override
	public int emailCheck(String email) {
		int result = 0;
		result = session.selectOne("userDB.emailCheck",email);
		return result;
	}

	@Override
	public int nicknameCheck(String nickname) {
		int result = 0;
		result = session.selectOne("userDB.nicknameCheck",nickname);
		return result;
	}

	@Override
	public int phoneCheck(String phone) {
		int result = 0;
		result = session.selectOne("userDB.phoneCheck",phone);
		return result;
	}

	@Override
	public int reloadUser(UserVO vo) {
		int success = 0;
		success = session.update("userDB.reloadUser",vo);
		return success;
	}

	@Override
	public int updateProfile(UserVO vo) {
		int success = 0;
		success = session.update("userDB.updateProfile",vo);
		return success;
	}

	@Override
	public int updateMailKey(UserVO vo) throws Exception {
		return session.update("userDB.updateMailKey", vo);
	}

	@Override
	public int updateMailAuth(UserVO vo) throws Exception {
		return session.update("userDB.updateMailAuth", vo);
	}

	@Override
	public int emailAuthFail(String id) throws Exception {
		return session.selectOne("userDB.emailAuthFail", id);
	}

	@Override
	public int updatePw(UserVO vo) throws Exception {
		return session.update("userDB.updatePw",vo);
	}

	@Override
	public int updatePay(UserVO vo) throws Exception {
		return session.update("userDB.updatePay",vo);
	}

	// 회원탈퇴
	@Override
	public void withdrawal(UserVO vo) throws Exception {
		session.delete("userDB.withdrawal", vo);
		}
		
	public UserVO selectByUserSeq(int user_seq) {
		return session.selectOne("userDB.selectUserbySeq",user_seq);
	}

	//탈퇴사유
	@Override
	public int WithdrawalReason(WithdrawalVO vo) throws Exception {
		return session.insert("userDB.WithdrawalReason", vo);
		
	}

	@Override
	public int evaluation(MyMannerVO vo) throws Exception {
		return session.insert("userDB.evaluation",vo);
	}

	
}
