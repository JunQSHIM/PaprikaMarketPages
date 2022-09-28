package com.spring.myweb.DAO.UserDAO;

import java.util.HashMap;
import java.util.List;

import com.spring.myweb.VO.MyMannerVO.MyMannerVO;
import com.spring.myweb.VO.ReportVO.ReportVO;
import com.spring.myweb.VO.UserVO.UserVO;
import com.spring.myweb.VO.WithdrawalVO.WithdrawalVO;

public interface UserDAO {
	public List<UserVO> selectAll();
	public UserVO selectByNickname(String nickname);
	public UserVO select(String id);
	public int insertUser(UserVO vo);
	public void kakaoinsert(HashMap<String, Object> userInfo);
	public UserVO findkakao(HashMap<String, Object> userInfo);
	public int locationInsert(UserVO vo);
	public int emailCheck(String email);
	public int nicknameCheck(String nickname);
	public int phoneCheck(String phone);
	public int reloadUser(UserVO vo);
	public int updateProfile(UserVO vo);
	int updateMailKey(UserVO vo) throws Exception;
	int updateMailAuth(UserVO vo) throws Exception;
	int emailAuthFail(String id) throws Exception;
	int updatePw(UserVO vo) throws Exception;
	int updatePay(UserVO vo) throws Exception;
	public void withdrawal(UserVO vo) throws Exception; // 회원탈퇴
	public int WithdrawalReason(WithdrawalVO vo) throws Exception; // 탈퇴사유
	public int evaluation(MyMannerVO vo) throws Exception; // 매너 평가 주기
	
	public UserVO selectByUserSeq(int user_seq);
	public int repNo(int user_seq) throws Exception; // 신고 횟수 증가
	
	public int mannerCount(MyMannerVO vo) throws Exception; // 받은 칭찬
	public int badCount(MyMannerVO vo) throws Exception; // 받은 비매너
}
