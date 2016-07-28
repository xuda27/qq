<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax</title>
	<script type="text/javascript">
	var xmlHttp;
	function createXMLHttpRequest() {//创建请求对象
		if(window.XMLHttpRequest) {    
			xmlHttp = new XMLHttpRequest();
		}else if(window.ActiveXObject) {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	//发送请求
	function startRequest() {
		createXMLHttpRequest();
		xmlHttp.onreadystatechange = function() {
			if(xmlHttp.readyState == 4) {	//如果已经完成解析
				if(xmlHttp.status == 200) {	//如果请求是成功，并得到响应
					alert("服务器回应：" + xmlHttp.responseText);
				}
			}
		};
		xmlHttp.open("POST", "doajax.jsp");
		xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xmlHttp.send("name=xd&pwd=000");
	}

	</script>
</head>
<body>
	<a href="javascript:startRequest()">发送请求</a> <br>
	<input type="text" name="uname">
	
	
</body>
</html>