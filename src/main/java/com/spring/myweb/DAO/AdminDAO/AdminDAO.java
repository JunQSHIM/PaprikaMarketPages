package com.spring.myweb.DAO.AdminDAO;

import java.util.List;

import com.spring.myweb.VO.AdminVO.ReviewSingoVO;
import com.spring.myweb.VO.AdminVO.UserSmsVO;
import com.spring.myweb.VO.UserVO.UserVO;

public interface AdminDAO {
	public List<UserVO> selectAll();
	public List<UserSmsVO> selectSmsAll();//회원 sms 목록 불러오기
	public List<ReviewSingoVO> selectSingoReview();//리뷰의 신고 리스트 불러오기
}
