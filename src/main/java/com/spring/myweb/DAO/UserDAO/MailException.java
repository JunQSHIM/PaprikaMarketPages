package com.spring.myweb.DAO.UserDAO;

import org.springframework.security.core.AuthenticationException;

public class MailException extends AuthenticationException{	
	
	private static final long serialVersionUID = 1L;

	public MailException(String msg){// 문자열을 매개변수로 받는 생성자		
		super(msg);// 조상인 Exception 클래스의 생성자를 호출한다.	
	}
}
