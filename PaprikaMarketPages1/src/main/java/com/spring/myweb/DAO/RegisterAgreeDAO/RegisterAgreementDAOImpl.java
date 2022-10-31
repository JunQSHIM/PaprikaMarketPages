package com.spring.myweb.DAO.RegisterAgreeDAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.myweb.VO.RegisterAgreementVO.RegisterAgreementVO;

@Repository
public class RegisterAgreementDAOImpl implements RegisterAgreementDAO{

	@Inject
	private SqlSession session;
	
	@Override
	public List<RegisterAgreementVO> selectAll() {
		List<RegisterAgreementVO> agreementList = session.selectList("adminDB.selectAgreementAll");
		return agreementList;
	}

	@Override
	public RegisterAgreementVO select(int agreement_seq) {
		RegisterAgreementVO agreement = session.selectOne("adminDB.selectAgreement", agreement_seq);
		return agreement;
	}

	@Override
	public void update(RegisterAgreementVO vo) {
		session.update("adminDB.updateAgreement", vo);
	}

}
