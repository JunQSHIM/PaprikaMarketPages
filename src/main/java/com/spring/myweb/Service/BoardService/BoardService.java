package com.spring.myweb.Service.BoardService;

import java.util.List;

import com.spring.myweb.VO.SellboardVO.SellBoardVO;

public interface BoardService {
	public List<SellBoardVO> boardList();
	public int insertSell(SellBoardVO vo);
}
