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
    
    <title>授课具体信息</title>
    
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

  </head>
  
  <body>
  	<div id="up">
	   <ul>
	    	<li><span>所有授课具体信息</span></li>
	   </ul>
	</div>
	<div id="down">
	    <table width="1000px" cellpadding="0" cellspacing="0">
	    	<thead>
		    	<tr class="head">
					<td>序号</td>
		    		<td>课程名称</td>
		    		<td>授课老师</td>
		    		<td>上课班级</td>
					<td>课次</td>
					<td>周次</td>
					<td>星期</td>
					<td>第几节课</td>
					<td>教室</td>
					<td>操作</td>
		    	</tr>
	    	</thead>
	    	<tbody>
				<c:forEach items="${list}" var="detail" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<td>${detail.courseName}</td>
						<td>${detail.teacherName}</td>
						<td>${detail.className}</td>
						<td>第${detail.times}次课</td>
						<td>第${detail.week}周</td>
						<td>${detail.day}</td>
						<td>第${detail.courseth}节课</td>
						<td>${detail.classroom}</td>
						<td>
							<a href="/administrator/toClassScheduleUpdate?caId=${detail.courseArrangementId}&times=${detail.times}">修改</a>&nbsp;
							<a href="/administrator/toDeleteClassSchedule?caId=${detail.courseArrangementId}&times=${detail.times}">删除</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
	    </table>
    </div>


  </body>
</html>
