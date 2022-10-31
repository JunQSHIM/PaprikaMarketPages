package com.spring.myweb.security.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import com.spring.myweb.DAO.UserDAO.MailException;
import com.spring.myweb.DAO.UserDAO.UserDAO;
import com.spring.myweb.Service.ChartService.ChartService;
import com.spring.myweb.Service.PostService.PostService;
import com.spring.myweb.Service.UserService.UserService;
import com.spring.myweb.VO.UserVO.UserVO;

import lombok.Data;

@Data
public class LoginSuccessHandler implements AuthenticationSuccessHandler{

	@Autowired
	ChartService chartSerivce;
	
	@Autowired
	private UserDAO dao;
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private UserService userService;
	
	private static int TIME = 60 * 60 * 24; // 하루
	private String defaultUrl;

	private RequestCache reqCache = new HttpSessionRequestCache();
	private RedirectStrategy redirectStratgy = new DefaultRedirectStrategy();

	
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		UserVO vo = dao.select(authentication.getName());
		try {
			if(vo == null) {
				throw new BadCredentialsException(defaultUrl);
			}
			if(vo.getMail_auth()==0) {
				throw new DisabledException(defaultUrl);
			}
			if(vo.getJoin_type()==1) {
				throw new DisabledException(defaultUrl);
			}
			if(vo.getRep_no()>=5) {
				throw new DisabledException(defaultUrl);
			}
		}catch(MailException e) {
			e.printStackTrace();
		}
		
		if(vo.getUser_type()==0) {
			chartSerivce.saveHistory(vo);
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("user", vo);
		session.setMaxInactiveInterval(TIME);
		if (vo.getUser_type()==1) {
			redirectStratgy.sendRedirect(request, response, "/main.mdo");
		} else {
			resultRedirectStrategy(request, response, authentication);
		}
				
		
//		
//		if (rememberId(rememberId)) {
//			Cookie cookie = new Cookie("id", vo.getId());
//			response.addCookie(cookie);
//		} else {
//			Cookie cookie = new Cookie("id", vo.getId());
//			cookie.setMaxAge(0);
//			response.addCookie(cookie);
//		}
		// 에러 세션 지우기
		clearAuthenticationAttributes(request);

	}

	protected void resultRedirectStrategy(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		SavedRequest savedRequest = reqCache.getRequest(request, response);
		if (savedRequest != null) {
			String targetUrl = savedRequest.getRedirectUrl();
			redirectStratgy.sendRedirect(request, response, targetUrl);
		} else {
			redirectStratgy.sendRedirect(request, response, defaultUrl);
		}
	}

	private void clearAuthenticationAttributes(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if (session == null)
			return;
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	}
	
	

}