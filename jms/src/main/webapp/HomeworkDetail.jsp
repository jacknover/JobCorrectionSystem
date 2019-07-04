<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.util.*,com.gxun.jms.pojo.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查询作业详情</title>
<style type="text/css">
#divMain{
	width: 70%;
	height: 830px;
	margin-left: 14%;
	margin-top: 0px;
	border-style: inset	;
	border-width: 5px;
	border-color: #00CD66;
}
#divQuestion{
	width: 99%;
	height: 723px;
	overflow: auto;
	scrollbar-base-color: #00CD66;
	border-style: solid;
	border-width: 1px;
	margin-top: 3px;
	margin-left: 3px;
	margin-right: 3px;
}
#divSearch{
	width: 99%;
	height: 40px;
	border-style: solid;
	border-color: #99f994;
	text-align: center;
	line-height: 40px;
	margin-top: 3px;
	margin-left: 3px;
	margin-right: 3px;
}
#divSearch label{
	margin-left: 10px;
	font-size: 17px;
	text-align:center;
}
#tableQuestion{
	width: 100%;
	height: 730px;
	margin-top: 10px;
	margin-bottom: 10px;
}
#tableButtons{
	width: 100%;
	height: 40px;
	margin-top: 3px;
}
#tdSub{
	width: 40%;
	height: 100%;
}
#tdRe{
	width: 30%;
	height: 100%;
}
#tdBack{
	width: 30%;
	height: 80%;;
	background-color: #36d33d;
	border: none;
	border-radius: 4px;
}
input[type=submit]{
	width: 100%;
	height: 100%;
	font-size: 17px;
	color: white;
	background-color: #36d33d;
	border: none;
	border-radius: 4px;
  	cursor: pointer;
}
input[type=submit]:hover {
  background-color: #45a049;
}
input[type=reset]{
	width: 100%;
	height: 100%;
	font-size: 17px;
	color: white;
	background-color: #36d33d;
	border: none;
	border-radius: 4px;
  	cursor: pointer;
}
input[type=reset]:hover {
  background-color: #45a049;
}
a{
	width: 100%;
	height: 100%;
	display: block;
	text-align: center;
	text-decoration:none;
	line-height: 40px;
	color: white;
	background-color: #36d33d;
	border: none;
	border-radius: 4px;

}
a:hover{
	background-color: #45a049;
}
</style>
</head>
<body>
<%
     String className = (String)request.getAttribute("className");
     String homeworkName = (String)request.getAttribute("homeworkName");
     String name = className + homeworkName;
    ArrayList<StudentAssignment> studentAssignments = (ArrayList) request.getAttribute("studentAssignments");
    float sum = 0;
    int num = 0;
    int num1 = 0;
%>
<div style="left:0px;top:0px;width:1520px;height:850px;background-color:#FFFFF4">
<div id="divMain" style="border-radius:5px;">
	<div id="divSearch" style="border-radius:5px;">
       <font style="border-radius:5px;margin-left:100px;width:250px;height:50px;font-size:30px;"><%=name%></font>
	</div>
	<div id="divQuestion" style="border-radius:5px;">
		<table  width="1053"   style="border-radius:5px;border-style:solid;border-color:#dddddd #777777 #777777 #dddddd;">
                    <tr>
						<td border='1' width="120" height="30" style="border-radius:5px;margin-top:10px;text-align:center;border-style:solid;border-color:#777777#dddddd#dddddd#777777;background:#F0F0F0;">学号</td>
						<td border='1' width="120" height="30" style="border-radius:5px;margin-top:10px;text-align:center;border-style:solid;border-color:#777777#dddddd#dddddd#777777;background:#F0F0F0;">学生名</td>
						<td border='1' width="120" height="30" style="border-radius:5px;margin-top:10px;text-align:center;border-style:solid;border-color:#777777#dddddd#dddddd#777777;background:#F0F0F0;">状态</td>
						<td border='1' width="120" height="30" style="border-radius:5px;margin-top:10px;text-align:center;border-style:solid;border-color:#777777#dddddd#dddddd#777777;background:#F0F0F0;">成绩</td>
					</tr>
                    <%
                        for(int i = 0; i < studentAssignments.size(); i++){
                            if(studentAssignments.get(i).getAssignSubmissionFlag() == 1){
                                num++;
                                sum+=studentAssignments.get(i).getAssignScore();
                            }
                            else
                                num1++;
                        %>

                    <tr>
                        <td border='1' width="120" height="30" style="border-radius:5px;text-align:center;border-style:solid;border-color:#777777#dddddd#dddddd#777777;background:#ECF5FF;"><%=studentAssignments.get(i).getStudentID()%></td>
                        <td border='1' width="120" height="30" style="border-radius:5px;text-align:center;border-style:solid;border-color:#777777#dddddd#dddddd#777777;background:#ECF5FF;"><%=studentAssignments.get(i).getStudentName()%></td>
                        <td border='1' width="120" height="30" style="border-radius:5px;text-align:center;border-style:solid;border-color:#777777#dddddd#dddddd#777777;background:#ECF5FF;"><%=studentAssignments.get(i).getAssignSubmissionFlag() == 1 ? "已提交" : "未提交"%></td>
                        <td border='1' width="120" height="30" style="border-radius:5px;text-align:center;border-style:solid;border-color:#777777#dddddd#dddddd#777777;background:#ECF5FF;"><%=studentAssignments.get(i).getAssignScore()%></td>
                    </tr>
                     <%   }
                          sum = sum/num;
                    %>

				</table>
		</table><%-- tableQuestion --%>
		<p>&nbsp;</p>
        				<font style="color:black;margin-left:680px;">已交:</font><input readonly style="font-size:20px;border-radius:5px;text-align:center;margin-right:15px;height:25px;width:50px;" name="已交" type="text" value=<%=num%>>
        				</input><font style="color:black;">缺交:</font><input readonly style="font-size:20px;border-radius:5px;text-align:center;margin-right:15px;height:25px;width:50px;" name="缺交" type="text" value=<%=num1%>>
        				</input><font style="color:black;">平均分:</font><input readonly name="缺交" style="font-size:20px;border-radius:5px;text-align:center;margin-right:15px;height:25px;width:50px;" type="text" value=<%=sum%>></input>
	</div><%-- divQuestion --%>
		<table id="tableButtons" style="border-radius:5px;">
			<tr>
				<td id="tdBack"><a href="TeacherIndex.jsp">退出</a></td>
			</tr>
		</table><%-- tableButtons --%>
</div><%-- divMain --%>
</div>
</body>
</html>