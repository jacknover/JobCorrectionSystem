<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.util.*,com.gxun.jms.pojo.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
 <title>教师批改作业页面</title>
 <style type="text/css">
  body{
    background-image:url(images/back.jpg);
  }
  *{ margin:0px;
   padding:0px;
   border:0px; }
   #box{ width:1100px;
   height:875px;
   margin:auto; }

  #hen {
   margin-top:5px;
   width:1100px;
   height:40px;
  float:left;
  text-align:center;}

   #zuo{ width:110px;
   height:515px;
   margin-top:25px;
   float:left;
   background-color:#f2f2f2;
   margin-bottom:10px;
  border:1px solid;
  border-top-color:red;
  border-bottom-color:green;
  border-left-color:black;
  border-right-color:blue;
    }

  #you{ width:912px;
   height:482px;
   margin-left:1px;
   margin-top:25px;
  border:1px solid;
  border-top-color:red;
  border-bottom-color:green;
  border-left-color:black;
  border-right-color:blue;
   float:left;
  }
  #dibu{
   width:900px;
   height:50px;
   margin-top:1px;
   border:1px solid;
   border-top-color:red;
   border-bottom-color:green;
   border-left-color:black;
   border-right-color:blue;
   float:left;
  }



  #na ul{ list-style:none;}

  #na ul li{ float:left; line-height:20px;width:50px; text-align:center; position:relative;}

  #na ul li a{ text-decoration:none; color:#000; display:block;padding:0px 10px;}

  #na ul li a:hover{ color:#FFF; background:#333
  }
  #na ul li ul{ position:absolute; display:none;
  }
  #na ul li ul li{ float:left; line-height:20px; width:60px;text-align:center;
  }
  #na ul li ul li a{ width:100%;}

  #na ul li ul li a:hover{ background-color:#06f;}

  #na ul li:hover ul{ display:block}


  #menu{
     width: 110px;
    border: 1px solid #999;
     }

  #menu ul{
  margin: 0px;
     padding: 0px;
   list-style: none;/* 隐藏默认列表符号*/
  }

  #menu ul li{
   background: #ADC1AD;
   border-top: 1px solid #fff;
  border-left: 1px solid #fff;
  border-bottom: 1px solid #333;
  border-right: 1px solid #333;height: 40px;
    line-height: 40px;  /*行距*/
     text-align: center;
    border-bottom: 1px solid #999;
    position: relative;
   }

   a{
    display: block;font-size: 13px;
    color: #FFF;
    text-decoration: none;/*隐藏超廉价默认下划线*/}

  a:hover{color:#F00;
   background-color: #889E88;font-size: 14px;border-top: 1px solid #333;
  border-left: 1px solid #333;
  border-bottom: 1px solid #fff;
  border-right: 1px solid #fff;
  }

  #menu ul li ul{
   display: none;/*默认隐藏*/
   background-color: #C5D8C5;   top:0px;
    width: 90px;
     border: 1px solid #ccc;
    border-bottom: none;
    position: absolute;
    left: 108px;
   }

  #menu ul li:hover ul{
   display: block;
   background-color: #889E88; }

  #menu ul li:hover ul li a{
  display: block;
   }

  ul.pagination {

  width:912px;
  height:30px;
  margin-left:1px;
  border:1px solid;
  border-top-color:red;
  border-bottom-color:green;
  border-left-color:black;
  border-right-color:blue;
  float:left;
  }

  ul.pagination li {display: inline;

  }

  ul.pagination li a {
      color: black;
      float: left;
      padding: 4px 10px;
      text-decoration: none;
      transition: background-color .3s;
      border: 1px solid #ddd;
  }

  ul.pagination li  a:hover,.select{
                  background: #ffcccc;
                  color: #fff;
              }
  </style>
</head>
 <body>
   <%
     	if(request.getAttribute("msg") != null){
     		out.print("<script> alert(\"作业布置成功!\"); </script>");
     	}
       int pageSize = 7;
       int currentPage = 1;
       int allPage = -1;
       ArrayList<StudentAssignment> undoneTeacherAssignments = (ArrayList) session.getAttribute("undoneTeacherAssignments");
       String pages = request.getParameter("pages");
   %>
   <div style="left:0px;top:0px;width:1520px;height:720px;background-color:#FFFFF4">
   <div style="position:absolute;left:0px;top:0px;width:1520px;height:60px;
                 background-color:#009999;float:none;clear:none;z-index:1">
<div id="box">
<div id="hen">
<img src="images\teacher.png"style="float:left">
<div style="margin-top:10px;float:left;"><span style="font-family:华文行楷;font-size:25px;color:black;">教师批改作业系统</span></div>
<div style="margin-top:10px;float:left;"><input type="text" placeholder=<%=session.getAttribute("teacherName")%> style="border-radius:5px;margin-top:5px;margin-left:550px;float:left;height:20px;width:100px; text-align:center; border: 2px solid #f2f2f2;" /></div>
<div id="na" style="margin-top:10px;"><ul style="margin-top:5px;">

 <li style="border-radius:5px;float:left; margin-left:10px;"><a  href="#">&nbsp设&nbsp置</a><ul>
        <li><a href="TeacherMessage.jsp">个人信息</a></li>

<li><a href="Login.jsp">退出</a></li>


            </ul>   </li>
 </ul>
</div>
</div>
<div id="zuo" style="border-radius:5px;">
<div id="menu">
<ul>

<li style="border-radius:5px;"><a href="#">批改情况</a>
<ul>

 <li style="border-radius:5px;"><a href="TeacherIndex.jsp">已批改</a></li>

 <li style="border-radius:5px;"><a href="TeacherIndex1.jsp">未批改</a></li>

 </ul>

</li>

<li style="border-radius:5px;"><a href="<%=request.getContextPath()%>/questionBank">我的题库</a>
 </li>
 <li style="border-radius:5px;"><a href="AssignHomeworkStepOne.jsp">布置作业</a>
 </li>
    </ul>
</div>
    </div>
<div id="you" style="border-radius:5px;">
<form id="form1" name="form1" method="post" action="searchUndoneTeacherAssignment">
<input type="text" placeholder="作业ID" name="homeworkID" style="border-radius:5px;margin-top:10px;margin-left:25px;float:left;height:25px;width:100px; text-align:center; border: 2px solid #f2f2f2;" />
<input type="text" placeholder="标题" name="homeworkDescribe"style="border-radius:5px;margin-top:10px;float:left;height:25px;width:100px;text-align:center;  border: 2px solid #f2f2f2;" />
<input type="text" placeholder="科目" name="courseName" style="border-radius:5px;margin-top:10px;float:left;height:25px;width:100px;text-align:center;  border: 2px solid #f2f2f2;" />
<input type="text" placeholder="学生ID" name="studentID" style="border-radius:5px;margin-top:10px;float:left;height:25px;width:100px;text-align:center;  border: 2px solid #f2f2f2;" />
<input type="text" placeholder="学生名" name="studentName" style="border-radius:5px;margin-top:10px;float:left;height:25px;width:100px;text-align:center;  border: 2px solid #f2f2f2;" />
<input type="text" placeholder="班级" name="className" style="border-radius:5px;margin-top:10px;float:left;height:25px;width:100px;text-align:center;  border: 2px solid #f2f2f2;" />
<select name="stateSelect" style="border-radius:5px;margin-top:10px;float:left;height:29px;width:100px;text-align:center;  border: 2px solid #f2f2f2;">
<option value="0">所有</option>
<option value="1">已提交</option>
<option value="-1">未提交</option>
</select>
<button type="submit"style="cursor:pointer;border-radius:5px;margin-top:10px;margin-left:30px;float:left;height:30px;width:100px;background:ffcccc;border: 2px solid #f2f2f2;">搜索</button><br>
</form>
<table width="910"   style="border-radius:5px;border-style:solid;border-color:#dddddd#777777#777777#dddddd">
<br/>
	<tr>

	        <td colspan="1" border='1' width="120" height="30" style="text-align:center;border-radius:5px;border-style:solid;border-color:#777777#dddddd#dddddd#777777;background:#F0F0F0">作业ID</td>
			<td colspan="1" border='1' width="120" height="30" style="text-align:center;border-radius:5px;border-style:solid;border-color:#777777#dddddd#dddddd#777777;background:#F0F0F0">标题</td>
			<td colspan="1" border='1' width="120" height="30" style="text-align:center;border-radius:5px;border-style:solid;border-color:#777777#dddddd#dddddd#777777;background:#F0F0F0">科目</td>
			<td colspan="1" border='1' width="120" height="30" style="text-align:center;border-radius:5px;border-style:solid;border-color:#777777#dddddd#dddddd#777777;background:#F0F0F0">学生ID</td>
			<td colspan="1" border='1' width="120" height="30" style="text-align:center;border-radius:5px;border-style:solid;border-color:#777777#dddddd#dddddd#777777;background:#F0F0F0">学生名</td>
			<td colspan="1" border='1' width="120" height="30" style="text-align:center;border-radius:5px;border-style:solid;border-color:#777777#dddddd#dddddd#777777;background:#F0F0F0">班级</td>
			<td colspan="1" border='1' width="120" height="30" style="text-align:center;border-radius:5px;border-style:solid;border-color:#777777#dddddd#dddddd#777777;background:#F0F0F0">状态</td>
			<td colspan="1" border='1' width="120" height="30" style="text-align:center;border-radius:5px;border-style:solid;border-color:#777777#dddddd#dddddd#777777;background:#F0F0F0">操作</td>
		</tr>
						<%
                        		       if(pages != null)
                                        {
                                           //System.out.print("pages ");
                                            currentPage = Integer.parseInt(pages);
                                            //System.out.print(currentPage);
                                         }
                                         if(undoneTeacherAssignments == null){}
                                         else if(undoneTeacherAssignments != null){
                                            allPage = (undoneTeacherAssignments.size() - 1)/pageSize + 1;
                                            int left = pageSize*(currentPage - 1);
                                            int right = undoneTeacherAssignments.size() < pageSize*currentPage ? undoneTeacherAssignments.size() : pageSize*currentPage;

                                            for(int i = left; i < right; i++){

                                 %>


                            			<td colspan="1" border='1' width="96" height="30" style="text-align:center;border-radius:5px;border-style:solid;border-color:#777777#dddddd#dddddd#777777;background:#ECF5FF"><%=undoneTeacherAssignments.get(i).getHomeworkID()%></td>
                                		<td colspan="1" border='1' width="96" height="30" style="text-align:center;border-radius:5px;border-style:solid;border-color:#777777#dddddd#dddddd#777777;background:#ECF5FF"><%=undoneTeacherAssignments.get(i).getHomeworkDescribe()%></td>
                                		<td colspan="1" border='1' width="96" height="30" style="text-align:center;border-radius:5px;border-style:solid;border-color:#777777#dddddd#dddddd#777777;background:#ECF5FF"><%=undoneTeacherAssignments.get(i).getCourseName()%></td>
                                		<td colspan="1" border='1' width="96" height="30" style="text-align:center;border-radius:5px;border-style:solid;border-color:#777777#dddddd#dddddd#777777;background:#ECF5FF"><%=undoneTeacherAssignments.get(i).getStudentID()%></td>
                                		<td colspan="1" border='1' width="96" height="30" style="text-align:center;border-radius:5px;border-style:solid;border-color:#777777#dddddd#dddddd#777777;background:#ECF5FF"><%=undoneTeacherAssignments.get(i).getStudentName()%></td>
                                		<td colspan="1" border='1' width="96" height="30" style="text-align:center;border-radius:5px;border-style:solid;border-color:#777777#dddddd#dddddd#777777;background:#ECF5FF"><%=undoneTeacherAssignments.get(i).getClassName()%></td>
                                		<td colspan="1" border='1' width="96" height="30" style="text-align:center;border-radius:5px;border-style:solid;border-color:#777777#dddddd#dddddd#777777;background:#ECF5FF"><%=undoneTeacherAssignments.get(i).getAssignSubmissionFlag() == -1 ? "未提交" : "已提交"%></td>
                                		<td colspan="1" border='1' width="96" height="30" style="text-align:center;border-radius:5px;border-style:solid;border-color:#777777#dddddd#dddddd#777777;background:#ECF5FF">
                                		<a href="<%=request.getContextPath()%>/checkHomework?studentID=<%=undoneTeacherAssignments.get(i).getStudentID()%>&homeworkID=<%=undoneTeacherAssignments.get(i).getHomeworkID()%>&homeworkName=<%=undoneTeacherAssignments.get(i).getHomeworkDescribe()%>"><font color="#FF5151">批改作业</font></a>
                                		</td>
                            			</tr>
                        		<%
                        		       }}
                        		%>

	</table>


</div>

	 <tr>
                            		     <td colspan="8">
                                         <ul class="pagination" style="border-radius:5px;">
                                         <li><a href="TeacherIndex1.jsp?pages=<%= currentPage == 1? currentPage : currentPage - 1%>">上一页</a></li>
                                                <%for(int i = 1; i <= allPage; i++){
                                                          out.print("<li><a href = TeacherIndex1.jsp?pages=" + i + ">" + i + "</a></li>");
                                                }%>
                                         <li><a href="TeacherIndex1.jsp?pages=<%= currentPage == allPage? allPage : currentPage + 1%>">下一页</a></li>
                                         </ul>
                                         </td>
                                          </tr>
</div>
</div>
</body>
</html>