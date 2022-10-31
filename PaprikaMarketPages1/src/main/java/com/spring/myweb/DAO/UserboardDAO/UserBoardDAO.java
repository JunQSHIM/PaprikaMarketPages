
package com.spring.myweb.DAO.UserboardDAO;

import java.util.List;

import com.spring.myweb.VO.CategoryVO.CategoryVO;
import com.spring.myweb.VO.PageVO.UserBoardPageVO;
import com.spring.myweb.VO.PhotoVO.PhotoVO;
import com.spring.myweb.VO.UserBoardVO.UserBoardVO;

public interface UserBoardDAO {

	public List<UserBoardVO> boardList(); // 글 목록

	public List<String> photoDetail(int board_seq);// 글 사진

	public void insertPhoto(PhotoVO photo);// 사진 등록

	public String photoOne(int board_seq);// 사진 미리보기

	public int insertBoard(UserBoardVO vo); // 쓰기

	public UserBoardVO boardDetail(int board_seq); // 글 상세보기

	public void deleteBoard(int board_seq);// 글 삭제

	public void deleteImage(int board_seq);// 사진 삭제

	public void updateBoard(UserBoardVO vo);// 게시판 업데이트

	public void viewCount(int prod_seq); // 조회수 증가

	public List<CategoryVO> categoryList(); // 카테고리 보이기

	public int board_seq(int board_seq);// 최신 등록 게시물 번호 조회

	public int count(int user_seq) throws Exception; // 게시물 총 개수

	public List<UserBoardVO> listPage(UserBoardPageVO vo) throws Exception;

	public String findNickname(int user_seq);// 이름 찾기

}
