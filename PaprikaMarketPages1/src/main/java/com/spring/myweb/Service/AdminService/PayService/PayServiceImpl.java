package com.spring.myweb.Service.AdminService.PayService;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.myweb.DAO.AdminDAO.PayDAO.PayDAO;
import com.spring.myweb.VO.AdminVO.PayVO.PayVO;

@Service
public class PayServiceImpl implements PayService{

	@Inject
	PayDAO payDAO;

	@Override
	public List<PayVO> payList() {
		return payDAO.payList();
	}
}
