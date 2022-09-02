package com.spring.myweb.DAO.RegisterAgreeDAO;

import java.util.List;

import com.spring.myweb.VO.RegisterAgreementVO.RegisterAgreementVO;


public interface RegisterAgreementDAO {
	public List<RegisterAgreementVO> selectAll();
	public RegisterAgreementVO select(int agreement_seq);
}
