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
    
    <title>My JSP 'left.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link href="<%=request.getContextPath() %>/css/left.css" rel="stylesheet" type="text/css">

	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("h3").click(topic,topic);
			function topic() {
				$(this).next("ul").slideToggle(200);
				$(this).next("ul").siblings("ul").slideUp(200);
			}
		});
	</script>
  </head>
  
  <body>
    <div>
    	<h3 id="con"></h3>
    	<h3 class="h2"><span>课程信息</span></h3>
    	<ul>
    		<li><a href="/student/getAllCourse" target="con">--查询本学期课表</a></li>
		</ul>
    </div>
  </body>
</html>
