package com.cts.bao;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
public class SessionTimeout implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,Object o) throws Exception {	
		 if((null == request.getSession(false)) && (!request.getRequestURL().toString().endsWith("login1.html"))){	
			 response.sendRedirect("login1.html");
			 return false;
		 }
		return true;
	}
	@Override
	public void postHandle(HttpServletRequest obj1, HttpServletResponse obj2, Object o, ModelAndView model)
			throws Exception {
		HttpSession session = obj1.getSession();
		session.setMaxInactiveInterval(2*60);
	}
	@Override
	public void afterCompletion(HttpServletRequest obj1, HttpServletResponse obj2, Object o, Exception e)
			throws Exception {
	}
}
