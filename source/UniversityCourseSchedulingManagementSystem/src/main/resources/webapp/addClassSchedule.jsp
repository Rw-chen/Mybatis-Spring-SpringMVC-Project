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
	    	<li><span>授课信息 添加</span></li>
	   </ul>
	</div>
	<div id="down">
	    <form id="form" action="administrator/addClassSchedule" method="post" modelAttribute="category">
	   		<table width="500px">
				<tr>
					<td>授课选择</td>
					<td>
						<select id="caId" name="classArrangementId">
							<c:forEach items="${allCourseArrangement}" var="courseArrangement" varStatus="status">
								<option value="${courseArrangement.id}">
									${status.count}.&nbsp;${courseArrangement.courseInfo.courseName}&nbsp;
										${courseArrangement.teacherInfo.teacherName}&nbsp;
										${courseArrangement.classInfo.className}
								</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>课次</td>
					<td>
						第<input id="times" name="times">次课
					</td>
				</tr>
				<tr>
					<td>周次</td>
					<td>
						第<input id="weekth" name="weekth">周
					</td>
				</tr>
				<tr>
					<td>星期</td>
					<td>
						<select id="dayth" name="dayth">
							<option value="1">周一</option>
							<option value="2">周二</option>
							<option value="3">周三</option>
							<option value="4">周四</option>
							<option value="5">周五</option>
							<option value="6">周六</option>
							<option value="7">周日</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>第几节课</td>
					<td>
						<select id="courseth" name="courseth">
							<option value="1">第一节课</option>
							<option value="2">第二节课</option>
							<option value="3">第三节课</option>
							<option value="4">第四节课</option>
							<option value="5">第五节课</option>
							<option value="6">第六节课</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>教室</td>
					<td>
						<select id="classroomId" name="classRoomId">
							<c:forEach items="${allClassroom}" var="classroom">
								<option value="${classroom.id}">${classroom.classroomName}</option>
							</c:forEach>
						</select>
					</td>
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
		let form = document.getElementById("form")
		form.onsubmit = function () {
			// 检查当前课程是否已经安排
			// 检查当前时间教室是否空闲 (weekth, dayth, courseth, classroomId)0或1,1等于csId,times即可
			// 检查当前时间老师是否要上其他班课
			// 检查当前时间该班级是否有其他课
			let caId = document.getElementById("caId").value.trim();
			let times = document.getElementById("times").value.trim();
			let weekth = document.getElementById("weekth").value.trim();
			let dayth = document.getElementById("dayth").value.trim();
			let courseth = document.getElementById("courseth").value.trim();
			let classroomId = document.getElementById("classroomId").value.trim();


			if (caId == "" || times == "" || weekth == "" || dayth == "" || courseth == "" || classroomId == "") {
				alert("请将信息填完整");
				return false;
			}

			// alert(csId)
			// alert(times)
			// alert(weekth)
			// alert(dayth)
			// alert(courseth)
			// alert(classroomId)

			let flag = true;
			// 查询该次课程是否已经安排了
			$.ajax({
				url:"/administrator/canSchedule", // 请求
				data:{
					"classArrangementId":caId,
					"times":times,
					"weekth":weekth,
					"dayth":dayth,
					"courseth":courseth,
					"classRoomId":classroomId
				},  // 键和值
				type:"post",          // 请求方式
				dataType:"json",      // 返回数据类型
				async: false,         // 关闭异步
				success:function (canSchedule) { // 请求返回后 ajax
					if (!canSchedule) {
						alert("该课程已经安排了，不用重复安排");
						flag = false;
					}
				}
			});
			if (!flag) return false;


			// 查询该时间是否教室空闲
			$.ajax({
				url:"/administrator/canUseRoom", // 请求
				data:{
					"classArrangementId":caId,
					"times":times,
					"weekth":weekth,
					"dayth":dayth,
					"courseth":courseth,
					"classRoomId":classroomId
				},  // 键和值
				type:"post",          // 请求方式
				dataType:"json",      // 返回数据类型
				async: false,         // 关闭异步
				success:function (canUse) { // 请求返回后 ajax
					if (!canUse) {
						alert("该时间教室已被占用，请换教室");
						flag = false;
					}
				}
			});
			if (!flag) return false;

			// 检查当前时间老师是否要上其他班课
			$.ajax({
				url:"/administrator/isTeacherFree", // 请求
				data:{
					"classArrangementId":caId,
					"times":times,
					"weekth":weekth,
					"dayth":dayth,
					"courseth":courseth,
					"classRoomId":classroomId
				},  // 键和值
				type:"post",          // 请求方式
				dataType:"json",      // 返回数据类型
				async: false,         // 关闭异步
				success:function (isFree) { // 请求返回后 ajax
					if (!isFree) {
						alert("该时间老师正在教其他班，请更换老师");
						flag = false;
					}
				}
			});
			if (!flag) return false;

			// 检查当前时间该班级是否要上课
			$.ajax({
				url:"/administrator/haveOtherCourse", // 请求
				data:{
					"classArrangementId":caId,
					"times":times,
					"weekth":weekth,
					"dayth":dayth,
					"courseth":courseth,
					"classRoomId":classroomId
				},  // 键和值
				type:"post",          // 请求方式
				dataType:"json",      // 返回数据类型
				async: false,         // 关闭异步
				success:function (hasCourse) { // 请求返回后 ajax
					if (!hasCourse) {
						alert("该时间当前班级有课，请更换时间");
						flag = false;
					}
				}
			});

			return flag;
		}

	</script>

  </body>
</html>
