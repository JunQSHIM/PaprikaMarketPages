package com.spring.myweb.Service.BoardService;

import java.util.List;

import com.spring.myweb.VO.CategoryVO.CategoryVO;
import com.spring.myweb.VO.PageVO.UserBoardPageVO;
import com.spring.myweb.VO.PhotoVO.PhotoVO;
import com.spring.myweb.VO.PostVO.PostVO;
import com.spring.myweb.VO.UserBoardVO.UserBoardVO;

public interface UserBoardService {
	public List<UserBoardVO> boardList(); // 글 목록
	public int insertBoard(UserBoardVO vo); // 게시판 등록
	public void insertPhoto(PhotoVO photo);//사진등록
	public List<String> photoDetail(int board_seq);// 글 사진
	public 	String photoOne(int board_seq);//사진 미리보기
	public void deleteImage(int board_seq);//사진 삭제
	
	public UserBoardVO boardDetail(int board_seq); // 글 상세보기
	public void deleteBoard(int board_seq);// 글 삭제
	public void viewCount(int prod_seq); // 조회수 증가
	public List<CategoryVO> categoryList(); // 카테고리 보이기
	public int board_seq(int user_seq);//최신 작성 글 번호 조회
	public int count(int user_seq) throws Exception; // 게시물 총 개수
	public List<UserBoardVO> listPage(UserBoardPageVO vo) throws Exception;
	public String findNickname(int user_seq);//이름 찾기
	public void updateBoard(UserBoardVO vo);//게시판 수정


}
