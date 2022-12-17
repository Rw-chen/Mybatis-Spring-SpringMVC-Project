<%@ page language="java" import="java.util.*" isELIgnored="false"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>上课信息</title>
   	
   	<link href="<%=request.getContextPath() %>/css/update.css" type="text/css" rel="stylesheet">

	  <script type="text/javascript" src="/js/jquery-1.8.3.min.js"></script>

  </head>
  
  <body>
	<div id="up">
	   <ul>
	    	<li><span>上课信息修改</span></li>
	   </ul>
	</div>
	<div id="down">
	    <form action="administrator/classScheduleUpdate?classArrangementId=${cs.classArrangementId}&times=${cs.times}"
			  method="post" modelAttribute="category"
			  onsubmit="return canUpdateClassSchedule(${cs.classArrangementId}, ${cs.times})"
		>
	    	<input type="hidden" name="_method" value="PUT">
	   		<table width="500px">
				<tr>
					<td>课程名称</td>
					<td>
						<input value="${courseDetail.courseName}" readonly="readonly">
					</td>
				</tr>
	   			<tr>
	   				<td>授课老师</td>
	   				<td>
						<input value="${courseDetail.teacherName}" readonly="readonly">
					</td>
	   			</tr>
				<tr>
					<td>上课班级</td>
					<td>
						<input value="${courseDetail.className}" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td>课次</td>
					<td>
						第<input value="${courseDetail.times}" readonly="readonly">次课
					</td>
				</tr>
				<tr>
					<td>周次</td>
					<td>
						第<input id="weekth" name="weekth" value="${courseDetail.week}">周
					</td>
				</tr>
				<tr>
					<td>星期</td>
					<td>
						<select id="dayth" name="dayth">
							<option value="1" <c:if test="${cs.dayth == 1}">selected="selected"</c:if> >周一</option>
							<option value="2" <c:if test="${cs.dayth == 2}">selected="selected"</c:if> >周二</option>
							<option value="3" <c:if test="${cs.dayth == 3}">selected="selected"</c:if> >周三</option>
							<option value="4" <c:if test="${cs.dayth == 4}">selected="selected"</c:if> >周四</option>
							<option value="5" <c:if test="${cs.dayth == 5}">selected="selected"</c:if> >周五</option>
							<option value="6" <c:if test="${cs.dayth == 6}">selected="selected"</c:if> >周六</option>
							<option value="7" <c:if test="${cs.dayth == 7}">selected="selected"</c:if> >周日</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>第几节课</td>
					<td>
						<select id="courseth" name="courseth">
							<option value="1" <c:if test="${cs.courseth == 1}">selected="selected"</c:if>>第一节课</option>
							<option value="2" <c:if test="${cs.courseth == 2}">selected="selected"</c:if>>第二节课</option>
							<option value="3" <c:if test="${cs.courseth == 3}">selected="selected"</c:if>>第三节课</option>
							<option value="4" <c:if test="${cs.courseth == 4}">selected="selected"</c:if>>第四节课</option>
							<option value="5" <c:if test="${cs.courseth == 5}">selected="selected"</c:if>>第五节课</option>
							<option value="6" <c:if test="${cs.courseth == 6}">selected="selected"</c:if>>第六节课</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>教室</td>
					<td>
						<select id="classroomId" name="classRoomId">
							<c:forEach items="${allClassroom}" var="classroom">
								<option value="${classroom.id}" <c:if test="${classroom.id == cs.classRoomId}">selected="selected"</c:if>>
										${classroom.classroomName}</option>
							</c:forEach>
						</select>
					</td>
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
		canUpdateClassSchedule = function (csId, times) {
			// 检查当前时间教室是否空闲 (weekth, dayth, courseth, classroomId)0或1,1等于csId,times即可
			// 检查当前时间老师是否要上其他班课
			// 检查当前时间该班级是否有其他课
			let weekth = document.getElementById("weekth").value;
			let dayth = document.getElementById("dayth").value;
			let courseth = document.getElementById("courseth").value;
			let classroomId = document.getElementById("classroomId").value;
			//
			// alert(csId)
			// alert(times)
			// alert(weekth)
			// alert(dayth)
			// alert(courseth)
			// alert(classroomId)

			let flag = true;
			// 查询该时间是否教室空闲
			$.ajax({
				url:"/administrator/canUseRoom", // 请求
				data:{
					"classArrangementId":csId,
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
					"classArrangementId":csId,
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
					"classArrangementId":csId,
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
