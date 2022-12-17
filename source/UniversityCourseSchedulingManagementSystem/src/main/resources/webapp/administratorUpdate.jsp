<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

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
	    	<li><span>信息修改</span></li>
	   </ul>
	</div>
	<div id="down">
	    <form action="administrator/update" method="post" modelAttribute="category">
	    	<input type="hidden" name="_method" value="PUT">
	   		<table width="500px">
	   			<tr>
	   				<td>账号</td>
	   				<td><input type="text" class="in" name="id" value="${administrator.id}" readonly/></td>
	   			</tr>
				<tr>
					<td>姓名</td>
					<td><input type="text" id="text2" class="in" name="adminName" value="${administrator.adminName}"/></td>
				</tr>
	   			<tr>
					<td>密码</td>
					<td><input type="text" id="text1" class="in" name="password" value="${administrator.password}"/></td>
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
		}
	</script>

  </body>
</html>
