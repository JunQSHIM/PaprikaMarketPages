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

	@Override
	public int insertSell(SellBoardVO vo) {
		int success = 0;
		session.insert("userDB.insertSell", vo);
		return success;
	}

	@Override
	public SellBoardVO sellDetail(int prod_seq) {
		SellBoardVO detail = session.selectOne("userDB.sellDetail", prod_seq);
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

}
