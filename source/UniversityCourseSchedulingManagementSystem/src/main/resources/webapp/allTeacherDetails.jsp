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
    
    <title>教师信息</title>
    
	<link  href="<%=request.getContextPath() %>/css/content.css" rel="stylesheet" type="text/css">
	<style type="text/css">
		#down table {
			position: relative;
			left: 50%;
			margin-left: -800px;
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

	  <script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>

  </head>
  
  <body>
  	<div id="up">
	   <ul>
	    	<li><span>所有教师信息</span></li>
	   </ul>
	</div>
	<div id="down">
	    <table width="1500px" cellpadding="0" cellspacing="0">
	    	<thead>
		    	<tr class="head">
		    		<td>工号</td>
					<td>密码</td>
					<td>姓名</td>
					<td>性别</td>
					<td>年龄</td>
					<td>职称</td>
					<td>最高学历</td>
		    		<td>简介</td>
					<td>操作</td>
		    	</tr>
	    	</thead>
	    	<tbody>
				<c:forEach items="${list}" var="teacher">
					<tr>
						<td>${teacher.workId}</td>
						<td>${teacher.password}</td>
						<td>${teacher.teacherName}</td>
						<td>${teacher.gender}</td>
						<td>${teacher.age}</td>
						<td>${teacher.title}</td>
						<td>${teacher.academic}</td>
						<td>${teacher.detail}</td>
			    		<td>
							<a href="/administrator/toTeacherUpdate?workId=${teacher.workId}">修改</a>&nbsp;
							<a href="/administrator/toDeleteTeacher?workId=${teacher.workId}"
							   onclick="return deleteTeacher('${teacher.workId}')">删除</a>
			    		</td>
			    	</tr>
				</c:forEach>
			</tbody>
	    </table>
    </div>

	<script type="text/javascript">
		deleteTeacher = function (workId) {
			let flag = confirm('确定删除？')
			if (!flag) return false;
			$.ajax({
				url:"/administrator/checkHaveCourse", // 请求
				data:{"workId":workId},  // 键和值
				type:"post",          // 请求方式
				dataType:"json",      // 返回数据类型
				async: false, // 关闭异步
				success:function (canDelete) { // 请求返回后 ajax
					if (!canDelete) {
						alert("该老师有在授课程，无法删除");
						flag = false;
					}
				}
			});
			return flag; // 返回请求结果
		}
	</script>
  
  </body>
</html>
