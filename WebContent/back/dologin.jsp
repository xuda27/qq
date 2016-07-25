<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//设置编码集
	request.setCharacterEncoding( "utf-8" ); //注意：	不会对请求地址中的数据编码
	
	//获取当前登录名
	String uname = request.getParameter( "uname" );
	
	if( uname == null || "".equals( uname )){
		out.println("<script>alert('请输入您的用户名...');location.href='../index.jsp';</script>");
	}else{
		//存储当前用户的信息
		session.setAttribute("currentUser", uname);
		//为了让所有用户都能取到当前在线用户列表，我们需要将当前用户信息添加到application中
		//规定存在application中的在线用户列表的键为userList
		List<String> userList = new ArrayList<String>();
		
		if( application.getAttribute("userList")!=null){
			//取出在线用户
			userList = (List<String>)application.getAttribute( "userList" );
		}
		
		userList.add(uname);
		//更新在线用户表信息
		application.setAttribute("userList", userList);
		response.sendRedirect("talk.jsp");
	}
%>