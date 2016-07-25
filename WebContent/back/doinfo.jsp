<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	List<String> userList = new ArrayList<String>();
	
	boolean flag = false;
	if( application.getAttribute("userList") != null ){
		userList = (List<String>)application.getAttribute("userList");
		if( userList.size()>0 ){
			
			for(String str : userList ){
				if( str.equals(name) ){
					flag = true;
					break;
				}
			}
			
		}
	}
	
	out.print(flag);
%>