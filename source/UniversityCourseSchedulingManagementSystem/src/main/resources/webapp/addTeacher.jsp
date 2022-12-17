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
	    	<li><span>老师信息 添加</span></li>
	   </ul>
	</div>
	<div id="down">
	    <form id="form" action="administrator/addTeacher" method="post" modelAttribute="category">
	   		<table width="500px">
	   			<tr>
	   				<td>工号</td>
	   				<td><input id="workId" type="text" class="text" name="workId"/><span id="msg"></span></td>
	   			</tr>
				<tr>
					<td>姓名</td>
					<td><input id="username" type="text" class="text" name="teacherName"/></td>
				</tr>
	   			<tr>
					<td>密码</td>
					<td><input id="password" type="text" class="text" name="password"/></td>
	   			</tr>
				<tr>
					<td>性别</td>
					<td>
						<select id="gender" name="gender" >
							<option value="男" selected="selected">男</option>
							<option value="女">女</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>年龄</td>
					<td><input id="age"  type="text" class="text" name="age"/></td>
				</tr>
				<tr>
					<td>职称</td>
					<td><input id="title" type="text" class="text" name="title"/></td>
				</tr>
				<tr>
					<td>学历</td>
					<td><input id="academic" type="text" class="text" name="academic"/></td>
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
		let workId = document.getElementById("workId")
		reset.onclick = function () {
			for (let i = 0; i < coll.length; ++i) {
				coll[i].value = ""
			}
		}

		workId.onblur = function () {
			let flag = true;
			$.ajax({
				url:"/administrator/isExistTeacher", // 请求
				data:{"workId":workId.value},  // 键和值
				type:"post",          // 请求方式
				dataType:"json",      // 返回数据类型
				async: false, // 关闭异步
				success:function (isExist) { // 请求返回后 ajax
					if (isExist) {
						msg.innerText = "该工号已经存在";
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
			let id = workId.value.trim();
			let name = document.getElementById("username").value.trim();
			let password = document.getElementById("password").value.trim();
			let gender = document.getElementById("gender").value.trim();
			let age = document.getElementById("age").value.trim();
			let title = document.getElementById("title").value.trim();
			let academic = document.getElementById("academic").value.trim();
			let detail = document.getElementById("detail").value.trim();
			if (id == "" || name=="" || password==""||gender==""||age==""||title==""||academic==""||detail=="") {
				alert("请将信息填完整")
				return false;
			}
			if (workId.onblur() == true) return true;
			alert("工号已经存在!");
			return false;
		}

	</script>

  </body>
</html>
