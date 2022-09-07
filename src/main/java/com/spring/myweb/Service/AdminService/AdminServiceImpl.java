package com.spring.myweb.Service.AdminService;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.myweb.DAO.AdminDAO.AdminDAO;
import com.spring.myweb.VO.AdminVO.BoardVO;
import com.spring.myweb.VO.AdminVO.ReviewSingoVO;
import com.spring.myweb.VO.AdminVO.UserSmsVO;
import com.spring.myweb.VO.UserVO.UserVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminDAO adminDAO;

	@Override
	public List<UserVO> selectAll() {
		return adminDAO.selectAll();
	}

	@Override
	public List<UserSmsVO> selectSmsAll() {
		return adminDAO.selectSmsAll();
	}

	@Override
	public List<ReviewSingoVO> selectReviewSingo() {
		return adminDAO.selectSingoReview();
	}

	@Override
	public void deleteSingoPage(int singo_page) {
		adminDAO.deleteSingoPage(singo_page);
	}

	@Override
	public List<BoardVO> selectBoardAll() {
		return adminDAO.selectBoardAll();
	}

	@Override
	public BoardVO boardDetail(int board_seq) {
		return adminDAO.boardDetail(board_seq);
	}

	@Override
	public void boardDelete(int board_seq) {
		adminDAO.boardDelete(board_seq);
	}

}
