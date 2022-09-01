package com.spring.myweb.Service.BoardService;

import java.util.List;

import com.spring.myweb.VO.SellboardVO.SellBoardVO;

public interface BoardService {
	public List<SellBoardVO> boardList(); // 글 목록
	public int insertSell(SellBoardVO vo); // 판매하기 등록
	public SellBoardVO sellDetail(int prod_seq); // 글 상세보기
	public void sellDelete(int prod_seq);// 글 삭제
	public void viewCount(int prod_seq); // 조회수 증가

}
