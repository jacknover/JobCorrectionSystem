<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import = "java.util.*,com.gxun.jms.pojo.*,com.gxun.jms.service.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>布置作业</title>
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
	text-color: black;
}
#divSearch label{
	margin-left: 10px;
	font-size: 17px;
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
    ArrayList<HomeworkView> list = (ArrayList)request.getAttribute("list");
%>
<div style="left:0px;top:0px;width:1520px;height:850px;background-color:#FFFFF4">
<div id="divMain" style="border-radius:5px;">
	<div id="divSearch" style="border-radius:5px;">
        <%=request.getAttribute("homeworkName")%>
	</div>
	<form id="form1" name="form1" method="post" action="submitCheckedHomework">
	<div id="divQuestion" style="border-radius:5px;">
		<table id="tableQuestion" style="border-radius:5px;">

			<%
			    int i = 0;
				for(HomeworkView temp : list)
				{
				    if(temp.getStudentAnswer() == null)
				        temp.setStudentAnswer("");
			        if(temp.getQuestionType() == 1)
			        {
			            out.println("<tr><td>"
			                                + (i+1) +"."+
                        					temp.getQuestionContent()+
                        					"("+"分值:"+temp.getExpr1()+")"+
                        					"&nbsp&nbsp&nbsp得分:<input readonly size='1' type='text' name='scores' value='"+ temp.getQuestionScore()+"'></input></td></tr>");
                        out.println("<tr><td>&nbsp&nbsp&nbsp&nbsp&nbspA."+temp.getQuestionOptionA()+"</td></tr>");
                        out.println("<tr><td>&nbsp&nbsp&nbsp&nbsp&nbspB."+temp.getQuestionOptionB()+"</td></tr>");
                        out.println("<tr><td>&nbsp&nbsp&nbsp&nbsp&nbspC."+temp.getQuestionOptionC()+"</td></tr>");
                        out.println("<tr><td>&nbsp&nbsp&nbsp&nbsp&nbspD."+temp.getQuestionOptionD()+"</td></tr>");
                        out.println("<tr><td>&nbsp&nbsp&nbsp&nbsp&nbsp学生答案:<input size='1' readonly type='text' value='"+temp.getStudentAnswer()+"'></input>"+"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp    正确答案:<input size='1' readonly type='text' value='"+temp.getQuestionRightAnswer()+"'></input>"+"</td></tr>");
                        i++;
			        }

			        else if(temp.getQuestionType() == 2)
			        {
			            out.println("<tr><td>"
                        					+(i+1)+"." +
                        					temp.getQuestionContent()+
                        					"("+"分值:"+temp.getExpr1()+")"+
                        					"&nbsp&nbsp&nbsp得分:<input text-align='center' readonly size='1' type='text' name='scores'value='"+ temp.getQuestionScore()+"'></input></td></tr>");
                       out.println("<tr><td>学生答案:<br><textarea readonly rows='10' cols='100' type='text'>" + temp.getStudentAnswer() +"</textarea></td></tr>");
                       out.println("<tr><td>正确答案:<br><textarea rows='10' readonly cols='100' type='text'>" + temp.getQuestionRightAnswer() +"</textarea></td></tr>");
                        i++;
			        }
				}
			%>


		</table><%-- tableQuestion --%>
	</div><%-- divQuestion --%>
		<table id="tableButtons" style="border-radius:5px;">
			<tr>
				<td id="tdBack"><a href="TeacherIndex.jsp">返回</a></td>
			</tr>
		</table><%-- tableButtons --%>
		</from>
</div><%-- divMain --%>
</div>
</body>
</html>