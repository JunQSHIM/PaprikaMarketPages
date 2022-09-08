package com.spring.myweb.Service.RegisterAgreementService;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.myweb.DAO.RegisterAgreeDAO.RegisterAgreementDAO;
import com.spring.myweb.VO.RegisterAgreementVO.RegisterAgreementVO;

@Service
public class RegisterAgreementServiceImpl implements RegisterAgreementService{

	@Inject
	private RegisterAgreementDAO agreementDAO;
	
	@Override
	public List<RegisterAgreementVO> selectAll() {
		return agreementDAO.selectAll();
	}

	@Override
	public RegisterAgreementVO select(int agreement_seq) {
		return agreementDAO.select(agreement_seq);
	}

	@Override
	public void update(RegisterAgreementVO vo) {
		agreementDAO.update(vo);
	}

}

