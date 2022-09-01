package com.spring.myweb.Service.BoardService;

import java.util.List;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.myweb.DAO.SellBoardDAO.SellBoardDAO;
import com.spring.myweb.VO.SellboardVO.SellBoardVO;


@Service
public class BoardServiceImpl implements BoardService{
	
	
	@Inject
	private SellBoardDAO boardDAO;

	@Override
	public List<SellBoardVO> boardList() {
		return boardDAO.boardList();
	}

	@Override
	public int insertSell(SellBoardVO vo) {
		return boardDAO.insertSell(vo);
		
	}

	@Override
	public SellBoardVO sellDetail(int prod_seq) {
		return boardDAO.sellDetail(prod_seq);
	}

	@Override
	public void sellDelete(int pord_seq) {
		boardDAO.sellDelete(pord_seq);
		
	}

}
