package com.spring.myweb.Service.AdminService;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.myweb.DAO.AdminDAO.AdminDAO;
import com.spring.myweb.VO.AdminVO.BannerVO;
import com.spring.myweb.VO.AdminVO.BoardSingoVO;
import com.spring.myweb.VO.AdminVO.BoardVO;
import com.spring.myweb.VO.AdminVO.PostSingoVO;
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
	public List<ReviewSingoVO> selectReviewSingo(){
		return adminDAO.selectSingoReview();
	}

	@Override
	public List<BoardSingoVO> selectBoardSingo() {
		return adminDAO.selectSingoBoard();
	}
	
	@Override
	public List<PostSingoVO> selectPostSingo() {
		return adminDAO.selectSingoPost();
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

	@Override
	public List<UserVO> adminList() {
		return adminDAO.selectAdmin();
	}
	 
	@Override
	public int giveAdmin(String id) {
		int result = adminDAO.giveAdmin(id);
		return result;
	}

	@Override
	public int deleteAdmin(String id) {
		int result = adminDAO.deleteAdmin(id);
		return result;
	}
	@Override
	public List<BannerVO> bannerList() {
		return adminDAO.bannerList();
	}

	@Override
	public void addBanner(BannerVO vo) {
		adminDAO.abbBanner(vo);
	}


}
