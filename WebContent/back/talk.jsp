<%@page import="java.util.List"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%
	if( session.getAttribute("currentUser") == null ){
		out.println("<script>alert('请您先登录...');location.href='../index.jsp'</script>");
	}
%>
<!DOCTYPE HTML>
<html>
<head>
   	<title>web简易聊天室</title>
    <meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<meta http-equiv="keywords" content="聊天">
	<meta http-equiv="description" content="在线聊天室">
	<link type="image/x-icon" rel="shortcut icon" href="../images/yclogo.png"> 
	<style type="text/css">
		*{
			margin:0 auto;
			padding:0px;
			font-size:12px;
			font-family:"微软雅黑";
			line-height:26px;
		}
		#bigbox{
			margin:0px auto;
			padding:0px;
			width:906px;
		}
		
		#bigbox #left{
			width:700px;
			height:600px;
			border:1px solid red;
			float:left;
			overflow-y:scroll;
		}
		
		#bigbox #right{
			width:200px;
			float:left;
			border:1px solid red;
			height:600px;
			overflow-y:scroll;
			margin-left:2px;
		}
		
		#bigbox #main{
			clear:both;
			width:904px;
			border:1px solid red;
		}
		
		#content{
			width:400px;
			height:30px;
		}
	</style>
	<script type="text/javascript" src="../js/jquery-3.0.0.js"></script>
	<script type="text/javascript">
		//ajax的封装
		//请求资源的地址  参数键值对 函数
		function myAjax(url, params, fun){
			var xmlHttp;
			if(window.XMLHttpRequest) {    
				xmlHttp = new XMLHttpRequest();
			}else if(window.ActiveXObject) {
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlHttp.onreadystatechange = function() {
				if(xmlHttp.readyState == 4) {	//如果已经完成解析
					if(xmlHttp.status == 200) {	//如果请求是成功，并得到响应
						fun(xmlHttp.responseText);
					}
				}
			};
			xmlHttp.open("POST", url);//请求的方式
			xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
			if( params == null ){
				xmlHttp.send( null );
			}else{
				var str = "";
				for( var s in params){
					str += s + "=" + params[s] + "&";
				}
				xmlHttp.send(str);
			}
		}
	
		//发送聊天信息
		function addContent(){
			var content = $.trim( $("#content").val() );
			var status = $.trim( $("#status").val() );
			if(content != ""){
				myAjax("dotalk.jsp", {status:status,content:content}, function(data) {
					$("#talkInfo").html(data);
					$("#content").val("");
				});
			}
		}
		
		
		//发送 请求
		function startRequest() {
			
			myAjax("docontent.jsp", null, function(data) {
				$("#talkInfo").html(data);
				$("#left").scrollTop( $("#info").height()-600 );
				
			});
		}
		
		//定时发送请求  刷新页面
		window.setInterval("startRequest()", 2000 );
		
		function loginOut() {
			location.href='dologinout.jsp';
			
		}
	</script>
</head>
  
<body>
    <div id="bigbox">
    	<div id="talkInfo">
	    	<%@ include file = "content.jsp" %>
    	</div>
    	<div id="main">
    		<center>
    			<form action="dotalk.jsp" method="post" id="myform">
    				您：<select name="status" id="status">
    					<option value="快乐地">快乐地</option>
    					<option value="悲伤地">悲伤地</option>
    					<option value="无聊地">无聊地</option>
    					<option value="得瑟地">得瑟地</option>
    				</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    				说：<input type="text" name="content" id="content"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    				<input type="button" value=" &nbsp;发送&nbsp; " onclick="addContent()"/>&nbsp;&nbsp;
    				<input type="button" value=" &nbsp;我闪 &nbsp; " onclick="loginOut()"/>	 
    			</form>    			
    		</center>
    	</div>
    </div>
</body>
</html>
