package com.spring.myweb.Service.BoardService;

import java.util.List;

import com.spring.myweb.VO.CategoryVO.CategoryVO;
import com.spring.myweb.VO.UserBoardVO.UserBoardVO;

public interface UserBoardService {
	public List<UserBoardVO> boardList(); // 글 목록
	public int insertBoard(UserBoardVO vo); // 게시판 등록
	public UserBoardVO boardDetail(int board_seq); // 글 상세보기
	public void sellDelete(int prod_seq);// 글 삭제
	public void viewCount(int prod_seq); // 조회수 증가
	public List<CategoryVO> categoryList(); // 카테고리 보이기
	public int board_seq(int user_seq);//최신 작성 글 번호 조회

}
