package com.mid.alcohol.filter;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class SessionFilter implements Filter {
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		Filter.super.init(filterConfig);
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest httprequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		
		Object userNickname = httprequest.getSession().getAttribute("userNickname");
		
		if(userNickname == null) {
			log.info("Not SignIn()");
			if(!httprequest.getRequestURI().contains("/signup") && !httprequest.getRequestURI().contains("/account")
					&& !httprequest.getRequestURI().contains("/api/login") && !httprequest.getRequestURI().contains("/static")) {
				httpResponse.sendRedirect("/alcohol/signup/signupEmail");
				return;
			}
			
		}
		log.info("Complete User Account");
		chain.doFilter(httprequest, httpResponse);
		
		
	}
}
