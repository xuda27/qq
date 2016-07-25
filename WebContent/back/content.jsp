<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script>
    	$("#right").scrollTop( $("#info1").height()-600 );
    </script>
	<div id="left">
		<div id="info">
		<%
			List<String> words = (List<String>)application.getAttribute("words");
			if( words!=null && words.size()>0 ){
			for( String str : words ){
		%>
				<%=str %>
				<hr style="border: 1px dashed #CCC" />
		<%		
				}
			}
		%>
			<hr style="border: 1px dashed #CCC" />
		</div>
	</div>
	<div id="right">
		<div id="info1">
		欢迎您：<%= session.getAttribute("currentUser") %>
		<br /><hr />
	<%
		List<String> userList = (List<String>)application.getAttribute("userList");
	%>
		当前有 <%= userList.size() %>个用户在线
		<br /><hr />他们是:<br /><hr />
	<% 
		for(String str:userList){
	%>
			用户：<%=str %><hr style="border:1px dashed #CCC"/>
	<%
		}
	%>	</div>
	</div>