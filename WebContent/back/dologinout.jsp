<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String uname = (String)session.getAttribute("currentUser");
	session.removeAttribute("currentUser");
	
	boolean flag=false;
	
	List<String> userList = new ArrayList<String>();
	
	if( application.getAttribute("userList")!=null){
		//用list取出在线用户
		userList = (List<String>)application.getAttribute( "userList" );
		
		//删除application
		application.removeAttribute("userList");
		
		//list删除uname
		userList.remove(uname);
		
		
		application.setAttribute("userList", userList);
		flag=true;
	}
	

	if(flag==true){
		out.println("<script>location.href='../index.jsp';</script>");
	}
	
	out.print(flag);
%>