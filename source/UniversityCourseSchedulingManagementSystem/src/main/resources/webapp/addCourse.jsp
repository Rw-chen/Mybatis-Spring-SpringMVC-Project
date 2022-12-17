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
	    	<li><span>课程信息 添加</span></li>
	   </ul>
	</div>
	<div id="down">
	    <form id="form" action="administrator/addCourse" method="post" modelAttribute="category">
	   		<table width="500px">
				<tr>
					<td>课程名称</td>
					<td><input id="courseName" type="text" class="text" name="courseName"/><span id="msg"></span></td>
				</tr>
	   			<tr>
					<td>学分</td>
					<td><input id="credit" type="text" class="text" name="credit"/></td>
	   			</tr>
				<tr>
					<td>简介</td>
					<td><input id="detail" type="text" class="text" name="detail"/></td>
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
		let courseName = document.getElementById("courseName")
		reset.onclick = function () {
			for (let i = 0; i < coll.length; ++i) {
				coll[i].value = ""
			}
		}

		courseName.onblur = function () {
			let flag = true;
			$.ajax({
				url:"/administrator/isExistCourse", // 请求
				data:{"courseName":courseName.value},  // 键和值
				type:"post",          // 请求方式
				dataType:"json",      // 返回数据类型
				async: false, // 关闭异步
				success:function (isExist) { // 请求返回后 ajax
					if (isExist) {
						msg.innerText = "该课程已经存在";
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
			let name = courseName.value.trim();
			let credit = document.getElementById("credit").value.trim();
			let detail = document.getElementById("detail").value.trim();
			if (name == "" || credit=="" || detail=="") {
				alert("请将信息填完整")
				return false;
			}
			if (courseName.onblur() == true) return true;
			alert("课程已经存在!");
			return false;
		}

	</script>

  </body>
</html>
