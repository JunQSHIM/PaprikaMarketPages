package com.spring.myweb.DAO.SellBoardDAO;

import java.util.List;

import com.spring.myweb.VO.SellboardVO.SellBoardVO;

public interface SellBoardDAO {

	public List<SellBoardVO> boardList(); // 글목록
	public int insertSell(SellBoardVO vo); // 쓰기
}
