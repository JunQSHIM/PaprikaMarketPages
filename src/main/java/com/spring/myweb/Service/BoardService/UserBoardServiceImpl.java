package com.spring.myweb.Service.BoardService;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.myweb.DAO.UserboardDAO.UserBoardDAO;
import com.spring.myweb.VO.CategoryVO.CategoryVO;
import com.spring.myweb.VO.PageVO.UserBoardPageVO;
import com.spring.myweb.VO.PhotoVO.PhotoVO;
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
	public void deleteBoard(int board_seq) {
		boardDAO.deleteBoard(board_seq);

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
	@Override
	public void insertPhoto(PhotoVO photo) {
		boardDAO.insertPhoto(photo);
	}

	@Override
	public int count(int user_seq) throws Exception {
		return boardDAO.count(user_seq);
	}
	@Override
	public List<UserBoardVO> listPage(UserBoardPageVO vo) throws Exception {
		return boardDAO.listPage(vo);
	}

	@Override
	public List<String> photoDetail(int board_seq) {
		return boardDAO.photoDetail(board_seq);
	}

	@Override
	public String photoOne(int board_seq) {
		return boardDAO.photoOne(board_seq);
	}

	@Override
	public String findNickname(int user_seq) {
		return boardDAO.findNickname(user_seq);
	}

	@Override
	public void updateBoard(UserBoardVO vo) {
		boardDAO.updateBoard(vo);
	}

	@Override
	public void deleteImage(int board_seq) {
		boardDAO.deleteImage(board_seq);
	}


}
