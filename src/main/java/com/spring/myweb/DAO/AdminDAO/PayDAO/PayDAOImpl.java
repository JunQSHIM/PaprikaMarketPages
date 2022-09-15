package com.spring.myweb.DAO.AdminDAO.PayDAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.myweb.VO.AdminVO.PayVO.PayVO;

@Repository
public class PayDAOImpl implements PayDAO{
	@Inject
	private SqlSession session;

	@Override
	public List<PayVO> payList() {
		List<PayVO> payList = session.selectList("adminDB.payList");
		return payList;
	}
}
