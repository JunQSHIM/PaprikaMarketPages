package com.spring.myweb.DAO.SellBoardDAO;

import java.util.List;

import com.spring.myweb.VO.SellboardVO.SellBoardVO;

public interface SellBoardDAO {

	public List<SellBoardVO> boardList(); // 글목록
	public int insertSell(SellBoardVO vo); // 쓰기
	public SellBoardVO sellDetail(int prod_seq); // 글 상세보기
	public void sellDelete(int prod_seq);// 글 삭제
	public void viewCount(int prod_seq); // 조회수 증가
}
