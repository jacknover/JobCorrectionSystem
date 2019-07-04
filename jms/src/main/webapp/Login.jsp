<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>作业管理系统</title>
<style type="text/css">
.div1{
       background: url(images/timg.jpg);

     }
.div-b{ background:#000;color:#2E2E2E;
       filter:alpha(Opacity=80);-moz-opacity:0.8;opacity: 0.8}
</style>
</head>
<body>
<%
    String ID = (String)session.getAttribute("ID");
    if(ID == null)
        ID = "";
%>

<div class="div1">
<div style="left:0px;top:0px;width:1500px;height:710px;">

<div class="div-b">
<div style="border-radius:5px;position:absolute;left:1000px;top:150px;width:300px;height:435px;
              background-color:#F0F8FF;float:none;clear:none;z-index:1">

           <p>&nbsp;</p>
           <h2 align="center" >作业管理系统</h2>
            <div style="position:absolute;left:50px;top:130px;width:250px;height:100px;
                 background-color:#F0F8FF;float:none;clear:none;z-index:1">

  <form id="form1" name="form1" method="post" action="Login">
  <p>
    <label for="textfield"></label>
  <font color="black">账号</font>
  <input type="text" style="border-radius:5px"
 name="loginID"  id="textfield" value =<%=ID%>></input>
  </p>
  <p><font color="black">密码</font>
    <label for="textfield2"></label>
    <input type="password" style="border-radius:5px" name="password"  id="textfield2" />
  </p>
  <p>
    <label>
      <input type="radio" name="typeGroup1" value="student" id="RadioGroup1_0" />
      <font color="black">学生</font></label>

    <label>
      <input type="radio" name="typeGroup1" value="teacher" id="RadioGroup1_1" />
      <font color="black">教师</font></label>

    <label>
      <input type="radio" name="typeGroup1" value="admin" id="RadioGroup1_2" />
      <font color="black">管理员</font></label>
  </p>
  <p>
  <%
  	if(request.getAttribute("wrong") != null){%>
  	    <h7 align="center"  style="color:red">用户名或密码错误!</h7>
  	<%}%>
  	<%if(request.getAttribute("loginID") != null || request.getAttribute("password") != null){%>
  	    <h7 align="center"  style="color:red">用户名或密码为空!</h7>
  	<%}%>
  	<%if(request.getAttribute("type") != null){%>
  	    <h7 align="center"  style="color:red">请选择登陆身份!</h7>
  	<%}%>
  	<%if(request.getAttribute("msg4") != null){%>
  	    <h7 align="center"  style="color:red">用户名格式不正确!</h7>
  	<%}%>
  </p>
  <p>&nbsp;</p>
  <p>
    <input type="submit" style="cursor:pointer;border-radius:5px;margin-right:80px;margin-left:10px;height:25px;width:180px;background:#42a410;" name="button" id="button" value="登陆" />
  </p>
</form>
</div>
</div>
</div>
</div>
</div>
</body>
</html>