package com.spring.myweb.DAO.AdminDAO;

import java.util.List;

import com.spring.myweb.VO.AdminVO.BoardSingoVO;
import com.spring.myweb.VO.AdminVO.BoardVO;
import com.spring.myweb.VO.AdminVO.PostSingoVO;
import com.spring.myweb.VO.AdminVO.ReviewSingoVO;
import com.spring.myweb.VO.AdminVO.UserSmsVO;
import com.spring.myweb.VO.UserVO.UserVO;


public interface AdminDAO {
	public List<UserVO> selectAll();
	public List<UserSmsVO> selectSmsAll();//회원 sms 목록 불러오기
	public List<ReviewSingoVO> selectSingoReview();//리뷰의 신고 리스트 불러오기
	public List<BoardSingoVO> selectSingoBoard();//리뷰의 신고 리스트 불러오기
	public List<PostSingoVO> selectSingoPost();//리뷰의 신고 리스트 불러오기
	
	public void deleteSingoPage(int singo_page);//신고된 페이지 삭제
	public List<BoardVO> selectBoardAll();// 게시판 불러오기
	public BoardVO boardDetail(int board_seq); // 게시판 상세보기
	public void boardDelete(int board_seq);
	
	public List<UserVO> selectAdmin(); //관리자 명단 불러오기
	public int giveAdmin(String id); //관리자 권한 주기
	public int deleteAdmin(String id); //관리자 권한 삭제
}
