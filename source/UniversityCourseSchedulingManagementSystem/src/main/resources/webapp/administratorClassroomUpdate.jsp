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
	<script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>

  </head>
  
  <body>
	<div id="up">
	   <ul>
	    	<li><span>教室信息修改</span></li>
	   </ul>
	</div>
	<div id="down">
	    <form id="form" action="administrator/classroomUpdate" method="post" modelAttribute="category">
	    	<input type="hidden" name="_method" value="PUT">
	   		<table width="500px">
				<tr>
					<td>编号</td>
					<td><input type="text" name="id" value="${classroom.id}" readonly/></td>
				</tr>
	   			<tr>
	   				<td>教室</td>
	   				<td><input type="text" id="classroomName" name="classroomName" value="${classroom.classroomName}"/></td>
	   			</tr>
				<tr>
					<td>容量</td>
					<td><input type="text" id="capacity" name="capacity" value="${classroom.capacity}"/></td>
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
		let srcClassroomName = document.getElementById("classroomName").value
		let reset = document.getElementById("reset")
		reset.onclick = function () {
			document.getElementById("classroomName").value = "";
			document.getElementById("capacity").value = "";
		}

		document.getElementById("form").onsubmit = function () {
			let classroomName = document.getElementById("classroomName").value.trim()
			let capacity = document.getElementById("capacity").value.trim();
			if (classroomName == "" || capacity=="") {
				alert("请将信息填完整")
				return false;
			}

			if (srcClassroomName == classroomName) { // 名字未改变
				return true;
			}

			let flag = true;
			$.ajax({
				url:"/administrator/isExistClassroom", // 请求
				data:{"classroomName":classroomName},  // 键和值
				type:"post",          // 请求方式
				dataType:"json",      // 返回数据类型
				async: false, // 关闭异步
				success:function (isExist) { // 请求返回后 ajax
					if (isExist) {
						alert("该教室已经存在");
						flag = false;
					}
				}
			});
			return flag
		}

	</script>

  </body>
</html>
