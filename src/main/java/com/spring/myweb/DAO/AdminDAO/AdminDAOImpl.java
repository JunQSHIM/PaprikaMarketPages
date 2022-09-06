package com.spring.myweb.DAO.AdminDAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.myweb.VO.AdminVO.BoardVO;
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
	public void deleteSingoPage(int singo_page) {
		session.delete("adminDB.deleteSingoPage", singo_page);
	}

	@Override
	public List<BoardVO> selectBoardAll() {
		List<BoardVO> boardList = session.selectList("adminDB.selectBoardAll");
		return boardList;
	}

	

}
