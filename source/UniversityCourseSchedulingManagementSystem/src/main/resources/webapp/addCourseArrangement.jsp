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
    
    <title>添加</title>
   	
   	<link href="<%=request.getContextPath() %>/css/update.css" type="text/css" rel="stylesheet">

	  <script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>

  </head>
  
  <body>
	<div id="up">
	   <ul>
	    	<li><span>授课信息 添加</span></li>
	   </ul>
	</div>
	<div id="down">
	    <form id="form" action="administrator/addCourseArrangement" method="post" modelAttribute="category">
	   		<table width="500px">
				<tr>
					<td>课程名称</td>
					<td>
						<select id="courseId" name="courseId">
							<c:forEach items="${allCourseInfo}" var="courseInfo">
								<option value="${courseInfo.id}">${courseInfo.courseName}</option>
							</c:forEach>
						</select>
						<span id="msg"></span>
					</td>
				</tr>
	   			<tr>
					<td>授课老师</td>
					<td>
						<select id="teacherId" name="teacherId" >
							<c:forEach items="${allTeacherInfo}" var="teacherInfo">
								<option value="${teacherInfo.workId}">${teacherInfo.teacherName}</option>
							</c:forEach>
						</select>
					</td>
	   			</tr>
				<tr>
					<td>上课班级</td>
					<td>
						<select id="classId" name="classId">
							<c:forEach items="${allClassInfo}" var="classInfo">
								<option value="${classInfo.id}">${classInfo.className}</option>
							</c:forEach>
						</select>
					</td>
				</tr>
	   			<tr>
	   				<td></td>
	   				<td>
	   					<input type="submit" value="添&nbsp;&nbsp;&nbsp;加" class="su">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   					<input type="button" id="reset" value="清&nbsp;&nbsp;&nbsp;空" class="su">
	   				</td>
	   			</tr>
	   		</table>
	    </form>
    </div>

  	<script type="text/javascript">
		let form = document.getElementById("form")
		form.onsubmit = function () {
			let courseId = document.getElementById("courseId").value;
			let teacherId = document.getElementById("teacherId").value;
			let classId = document.getElementById("classId").value;
			let flag = true;
			$.ajax({
				url:"/administrator/isExistCourseArrangement", // 请求
				data:{
					"courseId":courseId,
					"teacherId":teacherId,
					"classId":classId
				},
				type:"post",          // 请求方式
				dataType:"json",      // 返回数据类型
				async: false, // 关闭异步
				success:function (isExist) { // 请求返回后 ajax
					if (isExist) {
						alert("该授课已经安排，请更换");
						flag = false;
					}
				}
			});
			return flag
		}

	</script>

  </body>
</html>
