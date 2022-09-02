package com.spring.myweb.Service.RegisterAgreementService;

import java.util.List;

import com.spring.myweb.DAO.RegisterAgreeDAO.RegisterAgreementDAO;
import com.spring.myweb.VO.RegisterAgreementVO.RegisterAgreementVO;

public interface RegisterAgreementService {
	public List<RegisterAgreementVO> selectAll();
	public RegisterAgreementVO select(int agreement_seq);
}
