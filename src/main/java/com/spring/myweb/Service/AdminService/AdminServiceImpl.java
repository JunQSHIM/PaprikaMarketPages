package com.spring.myweb.Service.AdminService;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.myweb.DAO.AdminDAO.AdminDAO;
import com.spring.myweb.VO.AdminVO.UserSmsVO;
import com.spring.myweb.VO.UserVO.UserVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Inject
	private AdminDAO adminDAO;
	
	@Override
	public List<UserVO> selectAll() {
		return adminDAO.selectAll();
	}
	
	@Override
	public List<UserSmsVO> selectSmsAll() {
		return adminDAO.selectSmsAll();
	}

}
