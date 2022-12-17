<%@ page language="java" import="java.util.*" isELIgnored="false"  pageEncoding="UTF-8"%>
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
	  <script type="text/javascript" src="/js/jquery-1.8.3.min.js"> </script>

  </head>
  
  <body>
	<div id="up">
	   <ul>
	    	<li><span>授课信息修改</span></li>
	   </ul>
	</div>
	<div id="down">
	    <form id="form" action="administrator/courseArrangementUpdate" method="post" modelAttribute="category">
	    	<input type="hidden" name="_method" value="PUT">
	   		<table width="500px">
				<tr>
					<td>编号</td>
					<td><input type="text" name="id" value="${courseArrangement.id}" readonly/></td>
				</tr>
	   			<tr>
	   				<td>课程名称</td>
	   				<td>
						<select id="courseId" name="courseId">
							<c:forEach items="${allCourse}" var="course">
								<option value="${course.id}"
										<c:if test="${course.id == courseArrangement.courseId}">selected</c:if>>
										${course.courseName}
								</option>
							</c:forEach>
						</select>
					</td>
	   			</tr>
				<tr>
					<td>授课老师</td>
					<td>
						<select id="teacherId" name="teacherId">
							<c:forEach items="${allTeacher}" var="teacher">
								<option value="${teacher.workId}"
										<c:if test="${teacher.workId == courseArrangement.teacherId}">selected="selected"</c:if>>
										${teacher.teacherName}
								</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>上课班级</td>
					<td>
						<select id="classId" name="classId">
							<c:forEach items="${allClassInfo}" var="classInfo">
								<option value="${classInfo.id}"
										<c:if test="${classInfo.id == courseArrangement.classId}">selected="selected"</c:if>>
										${classInfo.className}
								</option>
							</c:forEach>
						</select>
					</td>
				</tr>
	   			<tr>
	   				<td>
	   					<input type="submit" value="修&nbsp;&nbsp;&nbsp;改" class="su">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	   					<input type="button" id="reset" value="清&nbsp;&nbsp;&nbsp;空" class="su">
	   				</td>
	   			</tr>
	   		</table>
	    </form>
    </div>

  	<script type="text/javascript">
		let form = document.getElementById("form")

		/*最开始的*/
		let srcCourseId = document.getElementById("courseId").value;
		let srcTeacherId = document.getElementById("teacherId").value;
		let srcClassId = document.getElementById("classId").value;

		form.onsubmit = function () {
			let courseId = document.getElementById("courseId").value;
			let teacherId = document.getElementById("teacherId").value;
			let classId = document.getElementById("classId").value;

			if (srcCourseId == courseId && srcTeacherId == teacherId && srcClassId == classId) { // 没改过
				return true;
			}

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
						alert("该授课已经安排，请更换为其他");
						flag = false;
					}
				}
			});
			return flag
		}
	</script>

  </body>
</html>
