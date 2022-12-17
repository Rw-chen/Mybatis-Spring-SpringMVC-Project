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
	    	<li><span>教室信息 添加</span></li>
	   </ul>
	</div>
	<div id="down">
	    <form id="form" action="administrator/addClassroom" method="post" modelAttribute="category">
	   		<table width="500px">
				<tr>
					<td>教室名称</td>
					<td><input id="classroomName" type="text" class="text" name="classroomName"/><span id="msg"></span></td>
				</tr>
	   			<tr>
					<td>容量</td>
					<td><input id="capacity" type="text" class="text" name="capacity"/></td>
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
		let reset = document.getElementById("reset")
		let coll = document.getElementsByClassName("text")
		let msg = document.getElementById("msg")
		let classroomName = document.getElementById("classroomName")
		reset.onclick = function () {
			for (let i = 0; i < coll.length; ++i) {
				coll[i].value = ""
			}
		}

		classroomName.onblur = function () {
			let flag = true;
			$.ajax({
				url:"/administrator/isExistClassroom", // 请求
				data:{"classroomName":classroomName.value},  // 键和值
				type:"post",          // 请求方式
				dataType:"json",      // 返回数据类型
				async: false, // 关闭异步
				success:function (isExist) { // 请求返回后 ajax
					if (isExist) {
						msg.innerText = "该教室名已经存在，请更换教室名";
						msg.style.color = "red";
						flag = false;
					} else {
						msg.innerText = ""
					}
				}
			});
			return flag
		}

		document.getElementById("form").onsubmit = function () {
			let name = classroomName.value.trim();
			let capacity = document.getElementById("capacity").value.trim();
			if (name == "" || capacity=="") {
				alert("请将信息填完整")
				return false;
			}
			if (classroomName.onblur() == true) return true;
			alert("教室已经存在!");
			return false;
		}

	</script>

  </body>
</html>
