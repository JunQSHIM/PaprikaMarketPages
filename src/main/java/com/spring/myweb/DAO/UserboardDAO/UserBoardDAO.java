package com.spring.myweb.DAO.UserboardDAO;

import java.util.List;

import com.spring.myweb.VO.CategoryVO.CategoryVO;
import com.spring.myweb.VO.UserBoardVO.UserBoardVO;

public interface UserBoardDAO {

	public List<UserBoardVO> boardList(); // 글목록
	public int insertBoard(UserBoardVO vo); // 쓰기
	public UserBoardVO boardDetail(int board_seq); // 글 상세보기
	public void sellDelete(int prod_seq);// 글 삭제
	public void viewCount(int prod_seq); // 조회수 증가
	public List<CategoryVO> categoryList(); // 카테고리 보이기
	public int board_seq(int board_seq);//최신 등록 게시물 번호 조회
}
