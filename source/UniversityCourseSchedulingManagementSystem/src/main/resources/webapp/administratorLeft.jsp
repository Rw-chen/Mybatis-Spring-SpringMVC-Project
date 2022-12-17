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
		<%-- 1.查看所有课程，2.添加课程（添加学生，添加老师，添加课程，添加安排，添加节次），3.删除课程	--%>
		<h3 id="con"></h3>
		<h3 class="h1"><span>查看|编辑|删除</span></h3>
		<ul>
			<li><a href="/administrator/getAllTeacher" target="con">--查看所有老师</a></li>
			<li><a href="/administrator/getAllStudent" target="con">--查看所有学生</a></li>
			<li><a href="/administrator/getAllCourse" target="con">--查看所有课程</a></li>
			<li><a href="/administrator/getAllClassroom" target="con">--查看所有教室</a></li>
			<li><a href="/administrator/getAllCourseArrangement" target="con">--查看所有授课关系</a></li>
			<li><a href="/administrator/getAllClassSchedule" target="con">--查看所有具体授课</a></li>
		</ul>
		<h3 class="h2"><span>添加</span></h3>
		<ul>
			<li><a href="addTeacher.jsp" target="con">--添加老师</a></li>
			<li><a href="/administrator/toAddStudent" target="con">--添加学生</a></li>
			<li><a href="addCourse.jsp" target="con">--添加课程</a></li>
			<li><a href="addClassroom.jsp" target="con">--添加教室</a></li>
			<li><a href="/administrator/toAddCourseArrangement" target="con">--添加授课关系</a></li>
			<li><a href="/administrator/toAddClassSchedule" target="con">--添加具体授课</a></li>
		</ul>
    </div>
  </body>
</html>
