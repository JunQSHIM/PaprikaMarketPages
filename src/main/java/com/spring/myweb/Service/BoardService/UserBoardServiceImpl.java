package com.spring.myweb.Service.BoardService;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.myweb.DAO.UserboardDAO.UserBoardDAO;
import com.spring.myweb.VO.CategoryVO.CategoryVO;
import com.spring.myweb.VO.UserBoardVO.UserBoardVO;

@Service
public class UserBoardServiceImpl implements UserBoardService {

	@Inject
	private UserBoardDAO boardDAO;

	@Override
	public List<UserBoardVO> boardList() {
		return boardDAO.boardList();
	}

	@Override
	public int insertBoard(UserBoardVO vo) {
		return boardDAO.insertBoard(vo);

	}

	@Override
	public UserBoardVO boardDetail(int board_seq) {
		return boardDAO.boardDetail(board_seq);
	}

	@Override
	public void sellDelete(int prod_seq) {
		boardDAO.sellDelete(prod_seq);

	}

	@Override
	public void viewCount(int prod_seq) {
		boardDAO.viewCount(prod_seq);
	}

	@Override
	public List<CategoryVO> categoryList() {
		return boardDAO.categoryList();
	}

	@Override
	public int board_seq(int user_seq) {
		return boardDAO.board_seq(user_seq);
	}

}
