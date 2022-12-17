<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>欢迎管理员</title>
    
	<link href="<%=request.getContextPath() %>/css/top.css" type="text/css" rel="stylesheet">
	<script type="text/javascript">
		setInterval("clock.innerHTML=new Date().toLocaleString() + '&nbsp;&nbsp;' + ''.charAt(new Date().getDay());",1000);
	</script>
  </head>
  
  <body>
    <div id="con">
    	<div id="left" style="color:white;font-size:20px;padding-top:5px;">欢迎使用本系统</div>
    	<div id="right">
    		<span>
    			欢迎 &nbsp<a href="administratorDetails.jsp" style="color: #13E8E9" target="_top">${administrator.adminName}</a>&nbsp;&nbsp;
    			<a href="/main/logout" target="_top">退出</a>
    		</span>&nbsp;&nbsp;
			<span id="clock"></span>
		</div>
    </div>
  </body>
</html>
