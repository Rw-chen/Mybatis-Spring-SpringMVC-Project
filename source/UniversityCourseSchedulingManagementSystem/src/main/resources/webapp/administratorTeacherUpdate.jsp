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
	    	<li><span>老师信息修改</span></li>
	   </ul>
	</div>
	<div id="down">
	    <form action="administrator/teacherUpdate" method="post" modelAttribute="category">
	    	<input type="hidden" name="_method" value="PUT">
	   		<table width="500px">
	   			<tr>
	   				<td>账号</td>
	   				<td><input type="text" class="in" name="workId" value="${teacher.workId}" readonly/></td>
	   			</tr>
				<tr>
					<td>姓名</td>
					<td><input type="text" id="text1" class="in" name="teacherName" value="${teacher.teacherName}"/></td>
				</tr>
	   			<tr>
					<td>密码</td>
					<td><input type="text" id="text2" class="in" name="password" value="${teacher.password}"/></td>
	   			</tr>
				<tr>
					<td>性别</td>
					<td>
						<select name="gender" class="in">
							<option value="男" <c:if test="${teacher.gender=='男'}">selected="selected"</c:if> >男</option>
							<option value="女" <c:if test="${teacher.gender=='女'}">selected="selected"</c:if> >女</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>年龄</td>
					<td><input type="text" id="text4" class="in" name="age" value="${teacher.age}"/></td>
				</tr>
				<tr>
					<td>职称</td>
					<td><input type="text" id="text5" class="in" name="title" value="${teacher.title}"/></td>
				</tr>
				<tr>
					<td>学历</td>
					<td><input type="text" id="text6" class="in" name="academic" value="${teacher.academic}"/></td>
				</tr>
				<tr>
					<td>简介</td>
					<td><input type="text" id="text7" class="in" name="detail" value="${teacher.detail}"/></td>
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
			document.getElementById("text1").value = "";
			document.getElementById("text2").value = "";
			document.getElementById("text3").value = "";
			document.getElementById("text4").value = "";
			document.getElementById("text5").value = "";
			document.getElementById("text6").value = "";
			document.getElementById("text7").value = "";
		}
	</script>

  </body>
</html>
