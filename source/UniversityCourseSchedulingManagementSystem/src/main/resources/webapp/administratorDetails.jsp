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
    
    <title>个人信息</title>
    
	<link  href="<%=request.getContextPath() %>/css/content.css" rel="stylesheet" type="text/css">
	<style type="text/css">
		#down table {
			position: relative;
			left: 50%;
			margin-left: -500px;
			top: 50px;
			border-top: 1px #999 solid;
			border-right: 1px #999 solid;
		}
		#down tr {
			height: 60px;
		}
		
		#down tr td {
			text-align: center;
			border-left: 1px #999 solid;
			border-bottom: 1px #999 solid;
		}
		
		#up a:VISITED,#up a:LINK {
			color: #4C8FBD;
			text-decoration: none;
		}
		#up a:HOVER {
			color: #4C8FBD;
			text-decoration: none;
		}
		.head {
			background: #438EB9;
			color: #fff;
		}
		tbody tr:nth-child(odd) {
			background: #e5e5e5;
		}
		
		tbody tr:nth-child(even) {
			background: #d5d5d5;
		}
	</style>
	<script type="text/javascript">
		
	</script>
  </head>
  
  <body>
  	<div id="up">
	   <ul>
	    	<li><span>个人信息 管理员</span></li>
	   </ul>
	</div>
	<div id="down">
	    <table width="1000px" cellpadding="0" cellspacing="0">
	    	<thead>
		    	<tr class="head">
					<td>账号</td>
					<td>管理员名</td>
					<td>密码</td>
					<td>操作</td>
		    	</tr>
	    	</thead>
	    	<tbody>
					<tr>
						<td>${administrator.id}</td>
						<td>${administrator.adminName}</td>
						<td>${administrator.password}</td>
			    		<td>
							<a href="administratorUpdate.jsp">修改</a>&nbsp;
			    		</td>
			    	</tr>
			</tbody>
	    </table>
    </div>
  </body>
</html>
