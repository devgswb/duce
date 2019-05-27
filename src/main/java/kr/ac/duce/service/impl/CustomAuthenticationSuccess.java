package kr.ac.duce.service.impl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.security.core.Authentication;

import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;



public class CustomAuthenticationSuccess
extends SavedRequestAwareAuthenticationSuccessHandler /*	 implements AuthenticationSuccessHandler */  {

	
	public CustomAuthenticationSuccess(String defaultTargetUrl) {
		 setDefaultTargetUrl(defaultTargetUrl);
	}

	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {

		HttpSession session = request.getSession();

		//로그인 성공시  이전 페이지로 돌아가기
		if(session != null) {
			//이전 페이지 가져옴
			String redirectUrl = (String)session.getAttribute("prevPage");
			//null이 아니면 이전 페이지 복귀
			if(redirectUrl !=null) {
				session.removeAttribute("prevPage");
				getRedirectStrategy().sendRedirect(request, response, redirectUrl);
			}else {
				super.onAuthenticationSuccess(request, response, authentication);
			}
		}else {
			super.onAuthenticationSuccess(request, response, authentication);
		}
		
		// ip 가져오기인데 생략 가능
		String ip = request.getRemoteAddr();

		if (session.getAttribute("name") != null) {
			System.out.println(ip);

		}
		
	}


}