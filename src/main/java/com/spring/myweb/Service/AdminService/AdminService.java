package com.spring.myweb.Service.AdminService;

import java.util.List;

import com.spring.myweb.VO.AdminVO.BannerVO;
import com.spring.myweb.VO.AdminVO.BoardSingoVO;
import com.spring.myweb.VO.AdminVO.BoardVO;
import com.spring.myweb.VO.AdminVO.PostSingoVO;
import com.spring.myweb.VO.AdminVO.ReviewSingoVO;
import com.spring.myweb.VO.AdminVO.UserSmsVO;
import com.spring.myweb.VO.UserVO.UserVO;


public interface AdminService {
	public List<UserVO> selectAll();
	public List<UserSmsVO> selectSmsAll();
	public List<ReviewSingoVO> selectReviewSingo();
	public List<BoardSingoVO> selectBoardSingo();
	public List<PostSingoVO> selectPostSingo();
	public void deleteSingoPage(int singo_page);
	public List<BoardVO> selectBoardAll();
	public BoardVO boardDetail(int board_seq);
	public void boardDelete(int board_seq);
	public List<UserVO> adminList();
	public int giveAdmin(String id);
	public int deleteAdmin(String id);
	
	public List<BannerVO> bannerList();//배너관리
	public void addBanner(BannerVO vo);//배너 추가
}
