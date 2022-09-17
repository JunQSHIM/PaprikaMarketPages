package com.spring.myweb.DAO.UserboardDAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.spring.myweb.VO.CategoryVO.CategoryVO;
import com.spring.myweb.VO.UserBoardVO.UserBoardVO;

@Repository
public class UserBoardDAOImpl implements UserBoardDAO {
	
	@Inject
	private SqlSession session;

	@Override
	public List<UserBoardVO> boardList() {
		List<UserBoardVO> sellList=session.selectList("userDB.boardList");
		return sellList;
	}

	@Override
	public int insertBoard(UserBoardVO vo) {
		int success = 0;
		session.insert("userDB.insertboard", vo);
		return success;
	}

	@Override
	public UserBoardVO boardDetail(int board_seq) {
		UserBoardVO detail = session.selectOne("userDB.boardDetail", board_seq);
		return detail;
	}

	@Override
	public void sellDelete(int prod_seq) {
		session.delete("userDB.sellDelete", prod_seq); 
		
	}

	@Override
	public void viewCount(int prod_seq) {
		session.update("userDB.viewCount",prod_seq);
	}

	@Override
	public List<CategoryVO> categoryList() {
		List<CategoryVO> cList = session.selectList("userDB.categoryList");
		return cList;
	}

	@Override
	public int board_seq(int user_seq) {
		return session.selectOne("userDB.selectBoardNew", user_seq);
	}

}
