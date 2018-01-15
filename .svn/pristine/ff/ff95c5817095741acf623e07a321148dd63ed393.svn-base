<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%

HttpSession varSession = request.getSession();

String userName = (String)varSession.getAttribute("login-username");
String rights = (String)varSession.getAttribute("login-rights");
if (userName == null || rights == null ){
	response.sendRedirect("includes/action/endSession.jsp");
}  
%>