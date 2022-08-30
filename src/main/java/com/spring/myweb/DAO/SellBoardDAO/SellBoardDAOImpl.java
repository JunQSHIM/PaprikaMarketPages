package com.spring.myweb.DAO.SellBoardDAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.myweb.VO.SellboardVO.SellBoardVO;

@Repository
public class SellBoardDAOImpl implements SellBoardDAO {
	
	@Inject
	private SqlSession session;

	@Override
	public List<SellBoardVO> boardList() {
		List<SellBoardVO> sellList=session.selectList("userDB.boardList");
		return sellList;
	}

}
