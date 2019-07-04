<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "java.util.*,com.gxun.jms.pojo.*"%>
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
  	if(request.getAttribute("wrong") != null){
  		out.print("<script> alert(\"请选择题目!\"); </script>");
  	}
    ArrayList<Question> questions = (ArrayList) request.getAttribute("questions");
%>
<div style="left:0px;top:0px;width:1520px;height:850px;background-color:#FFFFF4">
<div id="divMain" style="border-radius:5px;">
	<div id="divSearch" style="border-radius:5px;">
		<form id="form2" name="form2" method="post" action="searchQuestion">
			题型:
			<select style="margin-right:10px;width:100px;height:25px;" name="type">
				<option value="0">所有</option>
				<option value="1">选择题</option>
				<option value="2">非选择题</option>
			</select>
			难度:
			<select style="margin-right:10px;width:100px;height:25px;" name="difficuty">
				<option value="0">所有</option>
				<option value="1">易</option>
				<option value="2">中</option>
				<option value="3">难</option>
			</select>
			内容:
			<input style="width:80px;height:18px;" type="text" name="name">
			<input style="margin-left:20px;width:50px;height:25px;" type="submit" value="搜索" >
		</form>
	</div>
	<form id="form1" name="form1" method="post" action="addQuestion">
	<div id="divQuestion" style="border-radius:5px;">
		<table id="tableQuestion" style="border-radius:5px;">

			<%
                  int i = 1;
			    for(Question temp : questions)
			    {
			        if(temp.getQuestionType() == 1)
			        {
			            out.println("<tr><td><input type='checkbox'" +
                        					" name='addhomework' value='"
                        					+ temp.getQuestionID() + "'>"+i+".难度:"+temp.getQuestionDifficulty()+" " +
                        					temp.getQuestionContent()+
                        					"("+"分值 "+temp.getQuestionScore()+")"+
                        					"</td></tr>");
                        out.println("<tr><td>&nbsp&nbsp&nbsp&nbsp&nbspA."+temp.getQuestionOptionA()+"</td></tr>");
                        out.println("<tr><td>&nbsp&nbsp&nbsp&nbsp&nbspB."+temp.getQuestionOptionB()+"</td></tr>");
                        out.println("<tr><td>&nbsp&nbsp&nbsp&nbsp&nbspC."+temp.getQuestionOptionC()+"</td></tr>");
                        out.println("<tr><td>&nbsp&nbsp&nbsp&nbsp&nbspD."+temp.getQuestionOptionD()+"</td></tr>");

                        i++;
			        }

			        else if(temp.getQuestionType() == 2)
			        {
			            out.println("<tr><td><input type='checkbox'" +
                        					" name='addhomework' value='"
                        					+ temp.getQuestionID() + "'>"+i+".难度:"+temp.getQuestionDifficulty()+" " +
                        					temp.getQuestionContent()+
                        					"("+"分值 "+temp.getQuestionScore()+")"+
                        					"</td></tr>");

                        i++;
			        }
			    }
			%>
		</table><%-- tableQuestion --%>
	</div><%-- divQuestion --%>
		<table id="tableButtons">
			<tr>
				<td id="tdSub"><input type="submit" value="布置作业" ></td>
				<td id="tdRe"><input type="reset" value="重置" ></td>
			</tr>
		</table><%-- tableButtons --%>
	</form>
</div><%-- divMain --%>
</div>
</body>
</html>