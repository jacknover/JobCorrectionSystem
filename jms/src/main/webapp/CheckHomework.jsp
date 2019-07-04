<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import = "java.util.*,com.gxun.jms.pojo.*,com.gxun.jms.service.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>批改作业</title>
<meta name="description" content="">
<meta name="keywords" content="">
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script src="http://www.jq22.com/jquery/jquery-ui-1.11.0.js"></script>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}
#t-keybord {
	position: absolute;
	top: 200px;
	left: 600px;
	z-index: 100px;
	background-color: #fff;
	width: 170px;
	border: 0px solid rgba(0, 150, 136, .5);
	box-shadow: 0 0 50px 2px #ccc;
}
#t-value {
	width: 160px;
	height: 30px;
	outline: none;
	border: 1px solid #ccc;
	font-size: 18px;
	border-radius: 3px;
	text-indent: 10px;
}
table#t-keyvalue {
	margin: 1px;
	border-collapse: collapse;
	border-style: hidden;
	width: 170px;
	table-layout: fixed;
	word-break: break-all;
}
table#t-keyvalue tr td {
	height: 35px;
	width: 50px;
	text-align: center;
	cursor: pointer;
}
table#t-keyvalue tr:last-child,  table#t-keyvalue tr:first-child {
	height: 1px;
}
#t-keyvalue tr td button {
	width: 50px;
	height: 30px;
	outline: none;
	font-size: 18px;
	border-radius: 3px;
}
#t-keyvalue tr td button.control {
	border: 1px solid #C9C9C9;
	background-color: #fff;
	color: #555;
	box-sizing: border-box;
}
#t-keyvalue tr td button.clicker {
	color: #555;
	border: 1px solid #C9C9C9;
	background-color: #fff;
}
#t-keyvalue tr td button.control:hover {
	border: 1px solid rgba(0, 150, 136, .5);

}
#t-keyvalue tr td button.clicker:hover {
	border: 1px solid rgba(0, 150, 136, .5);
}
.hidden {
	display: none;
}
.t-keybord {
	text-indent: 1px;
	height: 20px;
	line-height: 38px;
	width: 30px;
	border: 1px solid #ccc;
	margin: 5px 0 0 5px;
}
</style>
<style type="text/css">
html,body{margin:0; padding:20px;}
</style>
<style type="text/css">
#divMain{
	width: 70%;
	height: 830px;
	margin-left: 14%;
	margin-top: 17px;
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
    ArrayList<HomeworkView> list = (ArrayList)session.getAttribute("list");
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
                        					"&nbsp&nbsp&nbsp得分:<input size='1' t-filter='' class='t-keybord' type='text' name='scores' id='inputscores'></input></td></tr>");
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
                        					"&nbsp&nbsp&nbsp得分:<input size='1' t-filter='' class='t-keybord' type='text' name='scores' id='inputscores'></input></td></tr>");
                       out.println("<tr><td>学生答案:<br><textarea readonly rows='10' cols='100' type='text'>" + temp.getStudentAnswer() +"</textarea></td></tr>");
                       out.println("<tr><td>正确答案:<br><textarea rows='10' cols='100' type='text'>" + temp.getQuestionRightAnswer() +"</textarea></td></tr>");
                        i++;
			        }
				}
			%>


		</table><%-- tableQuestion --%>
	</div><%-- divQuestion --%>
		<table id="tableButtons" style="border-radius:5px;">
			<tr>
				<td id="tdSub"><input type="submit" value="确认批改" ></td>
				<td id="tdRe"><input type="reset" value="重置"></td>
				<td id="tdBack"><a href="TeacherIndex1.jsp">返回</a></td>
			</tr>
		</table><%-- tableButtons --%>
		</from>
</div><%-- divMain --%>
</body>
<script type="text/javascript">
	var clicker;
	var context = "<div id=\"t-keybord\" style=\"border-radius:3px\"><table id=\"t-keyvalue\" class=\"keyboard\" cellspacing=\"0\" cellpadding=\"0\"><tr><td class=\"hidden\"></td><td class=\"hidden\"></td><td class=\"hidden\"></td></tr><tr><td colspan=\"3\"><input type=\"text\" id=\"t-value\"></td></tr><tr><td><button class=\"clicker\">1</button></td><td><button class=\"clicker\">2</button></td><td><button class=\"clicker\">3</button></td></tr><tr><td><button class=\"clicker\">4</button></td><td><button class=\"clicker\">5</button></td><td><button class=\"clicker\">6</button></td></tr><tr><td><button class=\"clicker\">7</button></td><td><button class=\"clicker\">8</button></td><td><button class=\"clicker\">9</button></td></tr><tr><td><button class=\"clicker\">0</button></td><td><button class=\"clicker\" style=\"font-size: 24px;\">.</button></td><td><button id=\"t-del\" class=\"control\"><font color=\"black\">删除</font></button></td></tr><tr><td><button id=\"t-submit\" class=\"control\"><font color=\"black\">确定</font></button></td><td><button id=\"t-clear\" class=\"control\"><font color=\"black\">清除</font></button></td><td><button id=\"t-close\" class=\"control\"><font color=\"black\">关闭</font></button></td></tr><tr><td class=\"hidden\"></td><td class=\"hidden\"></td><td class=\"hidden\"></td></tr></table></div>";
	/**
	 * 当点击input时
	 */
	$(".t-keybord").mousedown(function (event) {
		clicker = $(this);
		var values = clicker.val();
		var wh = $(window).height();
		var ww = $(window).width();
		var kh = $("#t-keybord").height();
		var kw = $("#t-keybord").width();
		if($("#t-keybord").length<=0){
			$("body").append(context);
		}
		var t = clicker.offset().top + clicker.outerHeight() + 5;
		var l = clicker.offset().left;
		if ((t + kh) > wh) {
			t = clicker.offset().top - kh - 5;
		}
		if (l + kw > ww) {
			l = clicker.offset().left - kw + clicker.width();
		}
		$("#t-keybord").css({
			top: t,
			left: l
		});
		$("#t-value").val(values);
		$("#t-keybord").fadeIn('fast');
	});

	/**
	 * 点击确定时
	 */
	$("body").on("click", "#t-submit", function (event) {
		var valuer = $("#t-value").val();
		if (valuer == "") {
			valuer = "0";
		} else {
			if (valuer.charAt(valuer.length - 1) == ".") {
				valuer += "0";
			}
			if (valuer.charAt(0) == ".") {
				valuer = "0" + valuer;
			}
			var varr = valuer.split("+");
			valuer = "";
			for (var s in varr) {
				varr[s] = parseFloat(varr[s]);
				if (isNaN(varr[s])) {
					valuer = "";
					alert("请输入正确参数");
					break;
				}
				if (s == 0) {
					valuer += varr[s];
				} else {
					valuer += "+" + varr[s];
				}
			}
		}
		clicker.val(valuer);
		$("#t-keybord").fadeOut('fast');
	});

	/**
	 * 点击关闭
	 */
	$("body").on("click", "#t-close", function () {
		$("#t-keybord").fadeOut('fast');
	});

	/**
	 * 点击clicker
	 */
	$("body").on("mousedown", ".clicker", function () {
		var val = $("#t-value").val();
		var htm = $(this).html();
		if ((val == "0" || val == "0.0") && htm != ".") {
			val = "";
		} else if (val == "0.0" && htm == ".") {
			val = "0";
		}
		val += htm;
		if (clicker.attr("t-filter") == "int") {
			val = val.replace(/[^0-9]/g, '');
		}
		if (clicker.attr("t-filter") == "float") {
			val = val.replace(/[^0-9.]/g, '');
		}
		$("#t-value").val(val);
	});

	/**
	 * 点击删除时
	 */
	$("body").on("click", "#t-del", function () {
		var val = $("#t-value").val();
		if (val.length > 0) {
			val = val.substring(0, val.length - 1);
		}
		$("#t-value").val(val);
	});

	/**
	 * 点击清除方法
	 */
	$("body").on("click", "#t-clear", function () {
		$("#t-value").val("");
	});
</script>
<script type="text/javascript">
var text = document.getElementById("inputscores");
text.onkeyup = function(){
this.value=this.value.replace(/\D/g,'');
if(text.value>100){
  text.value = 100;
}
}
</script>
</html>
