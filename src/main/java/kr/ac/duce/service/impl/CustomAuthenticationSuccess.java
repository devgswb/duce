package kr.ac.duce.service.impl;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import kr.ac.duce.model.SecurityUserModel;
import kr.ac.duce.model.UserModel;


public class CustomAuthenticationSuccess extends SavedRequestAwareAuthenticationSuccessHandler /* implements AuthenticationSuccessHandler */ {

	private CustomUserDetailsService userService;
	
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();;

	public CustomAuthenticationSuccess(String defaultTargetUrl) {
		// setDefaultTargetUrl(defaultTargetUrl);
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		 
		 
		  super.onAuthenticationSuccess(request, response, authentication);
		 
		  
		  System.out.println(request.getAttribute("name"));
		  
		  HttpSession session = request.getSession();
		  String ip = request.getRemoteAddr();
		  
		  if (session != null) {
			  System.out.println(ip);
			 
		  }
		
	}

	
}