<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.util.*,com.gxun.jms.pojo.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>个人信息</title>
<meta charset="utf-8">
</head>

 <body>
 <%
           	if(request.getAttribute("wrong") != null){
           		out.print("<script> alert(\"密码修改失败！\"); </script>");
           	}
          	if(request.getAttribute("ok") != null){
          		out.print("<script> alert(\"密码修改成功！\"); </script>");
          	}
 %>
<div style="left:0px;top:0px;width:1520px;height:720px;background-color:#FFFFF4">
<form>

 <table border="2px" style="border-radius:5px;solid;border-color:#ff7777#b40486#ff7777#b40486" align="center"width="40%" height="500px"
                background="">
         <div <caption style="border-radius:5px;margin-left:100px;color:blue;font-family:stcaiyun"><h1>个人信息</h1></caption>
 <tr style="border-radius:5px;">
<th style="border-radius:5px;border-width:2px;border-style:solid;border-color:#ff7777#b40486#ff7777#b40486">教师ID</th>

 <th style="border-radius:5px;">
<input type="text"  readonly style="border-radius:5px;width:95% border-width:2px;border-style:solid;border-color:#ff7777#b40486#ff7777#b40486"  value=<%=session.getAttribute("teacherLoginID")%>></input>

</th>

 </tr>

<tr style="border-radius:5px;">
<th style="border-radius:5px;border-width:2px;border-style:solid;border-color:#ff7777#b40486#ff7777#b40486">教师名</th>

 <th style="border-radius:5px;">
<input type="text" readonly style="border-radius:5px;width:95% border-width:2px;border-style:solid;border-color:#ff7777#b40486#ff7777#b40486" value=<%=session.getAttribute("teacherName")%>></input>

</th>

 </tr>

<tr style="border-radius:5px;">
<th style="border-radius:5px;border-width:2px;border-style:solid;border-color:#ff7777#b40486#ff7777#b40486">教师学院</th>

 <th style="border-radius:5px;">
<input type="text" readonly style="border-radius:5px;width:95% border-width:2px;border-style:solid;border-color:#ff7777#b40486#ff7777#b40486" value=<%=session.getAttribute("collegeName")%>/>

</th>

 </tr>

 <tr>

        <td colspan="4" align="center" style="border-radius:5px;">

            <a href="UpdatePassword.jsp"><input type="button" style="cursor:pointer;border-radius:5px;margin-right:100px;background:#D2E9FF;width:80px;height:30px;" value="修改密码"></a>

            <a href="TeacherIndex.jsp"><input type="button" style="cursor:pointer;border-radius:5px;background:#D2E9FF;width:80px;height:30px;" value="返回"></a>

        </td>



    </tr>
              </table>
      </form>
      </div>
   </body>
</html>
