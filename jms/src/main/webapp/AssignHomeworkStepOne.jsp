<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.*,com.gxun.jms.pojo.*,com.gxun.jms.service.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="app" lang="ch">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>布置作业选题页面</title>
<link rel="stylesheet" type="text/css" href="css/wui.min.css">
<link rel="stylesheet" type="text/css" href="css/style.css">

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/angular.min.js"></script>
<script type="text/javascript" src="js/wui-date.js" charset="utf-8"></script>

<%
        	if(request.getAttribute("wrong") != null){
        		out.print("<script> alert(\"截至时间设置错误！\"); </script>");
        	}
        	  	if(request.getAttribute("wrong1") != null){
              		out.print("<script> alert(\"请选择题目!\"); </script>");
              	}
    int n=0;
   TeacherAssignmentService teacherAssignmentService = new TeacherAssignmentService();
   ArrayList<ClassBean> classList = (ArrayList)session.getAttribute("classList");
   ArrayList<Course> courseList = (ArrayList)session.getAttribute("courseList");
%>
</head>
<body>
<div style="position:absolute;left:2px;top:0px;border:2px solid #B0E2FF;width:1530px;height:720px;background-color:#FFFFF4;float:none;clear:none;z-index:1">

                      <div style="position:absolute;left:220px;top:50px;width:1000px;height:55px;
                            background-color:#FFFFF4;float:none;clear:none;z-index:1">

                                <form id="form1" name="form1" method="post" action="AssignHomeworkStepOne">

                                                                  科目名：<select name="courseSelect" style="margin-right:50px;border-radius:5px;width:140px;height:32px;">
 										  <%
                   							for(Course temp : courseList)
                   							{
                   								out.print("<option value = '" + temp.getCourseID() + "'>" + temp.getCourseName() + "</option>");
                   							}
                  						 %>
                                         </select>
                                                                  班级名：<select name="classSelect" style="margin-right:50px;border-radius:5px;width:140px;height:32px;">
 										  <%
                   							for(ClassBean temp : classList)
                   							{
                   								out.print("<option value = '" + temp.getClassID() + "'>" + temp.getClassName() + "</option>");
                   							}
                  						 %>
                                         </select>
                                                                 作业名：<input type="text" name="homeworkName" placeholder="请输入作业名" style="margin-right:50px;border-radius:5px;width:140px;height:32px;" required autofocus/>
		                                                   截止时间：<wui-date name="deadTime" format="yyyy-mm-dd hh:mm:ss" width="140px"; placeholder="请选择或输入作业提交截止日期" id="date4" btns="{'ok':'确定','now':'此刻'}" ng-model="date4" onfocus="WdatePicker({minDate:'%y-%M-{%d+1}'})">
		                                  </wui-date> <p>&nbsp;</p>
		                                                   作业描述：<p></p><textarea type="text" style="border-radius:5px;width:1000px;height:300px;readonly;font-size:20px;"></textarea><p>&nbsp;</p><p>&nbsp;</p> <p>&nbsp;</p>
                                    <input style = "cursor:pointer;border-radius:5px;margin-left:450px" name="进入选题" type="submit" value="进入选题">

<script type="text/javascript">
	var app = angular.module('app',["wui.date"]);
</script>

<div style="text-align:center;clear:both;">
<script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
<script src="/follow.js" type="text/javascript"></script>
</div>
</form>
  </div>
</div>
</body>
</html>