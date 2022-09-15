package com.spring.myweb.security.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import com.spring.myweb.DAO.UserDAO.UserDAO;
import com.spring.myweb.VO.UserVO.UserVO;

import lombok.Data;

@Data
public class LoginFailureHandler implements AuthenticationFailureHandler{

	private String id;
	private String password;
	private String errormsg;
	private String defaultFailureUrl;

	@Autowired
	private UserDAO dao;
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
		AuthenticationException exception) throws IOException, ServletException {
		String username = request.getParameter(id);
		String pwd = request.getParameter(password);
		String error = null;
		UserVO vo = dao.select(username);
		if(vo == null) {
			error = "가입되지 않은 회원입니다.";
		}else if(exception instanceof BadCredentialsException) {
			if(vo.getJoin_type()==1) {
				error = "카카오톡으로 가입한 회원입니다. 알맞은 로그인 방법으로 다시 로그인 해주십시오.";
			}else {
				error = "아이디나 비밀번호가 맞지 않습니다. 다시 확인해주세요.";
			}
		}else if(exception instanceof InternalAuthenticationServiceException) {
			if(vo.getJoin_type()==1) {
				error = "카카오톡으로 가입한 회원입니다. 알맞은 로그인 방법으로 다시 로그인 해주십시오.";
			}else {
				error = "아이디나 비밀번호가 맞지 않습니다. 다시 확인해주세요.";
			}
		}else if(exception instanceof DisabledException) {
			if(vo.getMail_auth()==0) {
				error = "이메일 인증을 먼저 해주십시오.";
			}else if(vo.getJoin_type()==1) {
				error = "카카오톡으로 가입한 회원입니다. 알맞은 로그인 방법으로 다시 로그인 해주십시오.";
			}else {
				error = "계정이 비활성화되었습니다. 관리자에게 문의하세요.";
			}
		}
		
		request.setAttribute(id, username);
		request.setAttribute(password, pwd);
		request.setAttribute(errormsg, error);
		request.getRequestDispatcher(this.defaultFailureUrl).forward(request, response);
		
	}

}
