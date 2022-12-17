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
    
    <title>update</title>
   	
   	<link href="<%=request.getContextPath() %>/css/update.css" type="text/css" rel="stylesheet">

  </head>
  
  <body>
	<div id="up">
	   <ul>
	    	<li><span>课程信息修改</span></li>
	   </ul>
	</div>
	<div id="down">
	    <form action="administrator/courseUpdate" method="post" modelAttribute="category">
	    	<input type="hidden" name="_method" value="PUT">
			<input type="hidden" name="id" value="${course.id}">
	   		<table width="500px">
	   			<tr>
	   				<td>课程名称</td>
	   				<td><input type="text" class="text" name="courseName" value="${course.courseName}" readonly/></td>
	   			</tr>
				<tr>
					<td>学分</td>
					<td><input type="text" class="text" name="credit" value="${course.credit}"/></td>
				</tr>
	   			<tr>
					<td>简介</td>
					<td><input type="text" class="text" name="detail" value="${course.detail}"/></td>
	   			</tr>

	   			<tr>
	   				<td></td>
	   				<td>
	   					<input type="submit" value="修&nbsp;&nbsp;&nbsp;改" class="su">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   					<input type="button" id="reset" value="清&nbsp;&nbsp;&nbsp;空" class="su">
	   				</td>
	   			</tr>
	   		</table>
	    </form>
    </div>

  	<script type="text/javascript">
		let reset = document.getElementById("reset")
		reset.onclick = function () {
			let all = document.getElementsByClassName("class")
			for (let i = 0; i < all.length; ++i) {
				all[i].value=""
			}
		}
	</script>

  </body>
</html>
