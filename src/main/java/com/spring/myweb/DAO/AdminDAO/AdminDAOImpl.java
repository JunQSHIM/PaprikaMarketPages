package com.spring.myweb.DAO.AdminDAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.myweb.VO.AdminVO.BannerVO;
import com.spring.myweb.VO.AdminVO.BoardSingoVO;
import com.spring.myweb.VO.AdminVO.BoardVO;
import com.spring.myweb.VO.AdminVO.PostSingoVO;
import com.spring.myweb.VO.AdminVO.ReviewSingoVO;
import com.spring.myweb.VO.AdminVO.UserSmsVO;
import com.spring.myweb.VO.UserVO.UserVO;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Inject
	private SqlSession session;

	@Override
	public List<UserVO> selectAll() {
		List<UserVO> userList = session.selectList("adminDB.selectUserAll");
		return userList;
	}

	@Override
	public List<UserSmsVO> selectSmsAll() {
		List<UserSmsVO> userSmsList = session.selectList("adminDB.selectUserSms");
		return userSmsList;
	}

	@Override
	public List<ReviewSingoVO> selectSingoReview() {
		List<ReviewSingoVO> reviewSingoList = session.selectList("adminDB.selectReviewSingo");
		return reviewSingoList;
	}
	
	@Override
	public List<BoardSingoVO> selectSingoBoard() {
		List<BoardSingoVO> boardSingoList = session.selectList("adminDB.selectBoardSingo");
		return boardSingoList;
	}

	@Override
	public List<PostSingoVO> selectSingoPost() {
		List<PostSingoVO> postSingoList = session.selectList("adminDB.selectPostSingo");
		return postSingoList;
	}

	@Override
	public void deleteSingoPage(int singo_page) {
		session.delete("adminDB.deleteSingoPage", singo_page);
	}

	@Override
	public List<BoardVO> selectBoardAll() {
		List<BoardVO> boardList = session.selectList("adminDB.selectBoardAll");
		return boardList;
	}

	@Override
	public BoardVO boardDetail(int board_seq) {
		BoardVO bde = session.selectOne("adminDB.boardDetail", board_seq); 
		return bde;
	}

	@Override
	public void boardDelete(int board_seq) {
		session.delete("adminDB.boardDelete", board_seq); 
		
	}

	@Override
	public List<UserVO> selectAdmin() {
		List<UserVO> list = session.selectList("adminDB.adminList");
		return list;
	}

	@Override
	public int giveAdmin(String id) {
		int result = session.update("adminDB.giveAdmin",id);
		return result;
	}
	
	@Override
	public int deleteAdmin(String id) {
		int result = session.update("adminDB.deleteAdmin",id);
		return result;
	}

	@Override
	public List<BannerVO> bannerList() {
		List<BannerVO> bannerImgs = session.selectList("adminDB.bannerList");
		return bannerImgs;
	}

	@Override
	public void abbBanner(BannerVO vo) {
		session.insert("insertBanner", vo);
	}

	

}
