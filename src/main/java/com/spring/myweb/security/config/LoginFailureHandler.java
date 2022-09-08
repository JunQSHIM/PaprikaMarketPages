package com.spring.myweb.security.config;

import java.io.IOException;

import javax.security.auth.login.CredentialException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;


import lombok.Data;

@Data
public class LoginFailureHandler implements AuthenticationFailureHandler{

	private String id;
	private String password;
	private String errormsg;
	private String defaultFailureUrl;
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		String username = request.getParameter(id);
		String pwd = request.getParameter(password);
		String error = null;
		
		if(exception instanceof BadCredentialsException) {
			errormsg = "아이디나 비밀번호가 맞지 않습니다. 다시 확인해주세요.";
		}else if(exception instanceof InternalAuthenticationServiceException) {
			errormsg = "아이디나 비밀번호가 맞지 않습니다. 다시 확인해주세요.";
		}else if(exception instanceof DisabledException) {
			errormsg = "계정이 비활성화되었습니다. 관리자에게 문의하세요.";
		}
		
		
		request.setAttribute(id, username);
		request.setAttribute(password, pwd);
		request.setAttribute(error, errormsg);
		request.getRequestDispatcher(defaultFailureUrl).forward(request, response);
		
	}

}
