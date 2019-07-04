<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*,com.gxun.jms.pojo.*,com.gxun.jms.service.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
 <title>添加学生</title>
<meta charset="utf-8">
</head>

 <body>
 <%
        	if(request.getAttribute("wrong") != null){
        		out.print("<script> alert(\"姓名格式错误！\"); </script>");
        	}
    ArrayList<College> colleges = (ArrayList) session.getAttribute("colleges");
    ArrayList<ClassBean> classes = (ArrayList) session.getAttribute("classes");
 %>
 <div style="left:0px;top:0px;width:1520px;height:720px;background-color:#FFFFF4">
<form  id="form1" name="form1" method="post" action="addStudent">

 <table border="2px" style="border-radius:5px;border-solid;border-color:#ff7777#b40486#ff7777#b40486" align="center"width="40%" height="500px"
                background="">
         <div <caption style="margin-left:100px;color:blue;font-family:stcaiyun"><h1>添加学生</h1></caption>

<tr style="border-radius:5px;">
<th style="border-radius:5px;border-width:2px;border-style:solid;border-color:#ff7777#b40486#ff7777#b40486">学生名</th>

 <th style="border-radius:5px;">
<input type="text" name = "studentName" style="border-radius:5px; margin-right:50px;width:160px;height:32px; border-width:2px;border-style:solid;border-color:#d0d0d0" required autofocus/>

</th>

 </tr>

<tr style="border-radius:5px;">
<th style="border-radius:5px;border-width:2px;border-style:solid;border-color:#ff7777#b40486#ff7777#b40486">学院</th>

 <th style="border-radius:5px;">
<select name="collegeSelect" style="border-radius:5px;margin-right:50px;border-radius:5px;width:160px;height:32px;">
 										  <%
                   							for(College temp : colleges)
                   							{
                   								out.print("<option value = '" + temp.getCollegeID() + "'>" + temp.getCollegeName() + "</option>");
                   							}
                  						 %>
                                         </select>

</th>

 </tr>

<tr style="border-radius:5px;">
<th style="border-radius:5px;border-width:2px;border-style:solid;border-color:#ff7777#b40486#ff7777#b40486">班级</th>

 <th style="border-radius:5px;">
<select name="classSelect" style="border-radius:5px;margin-right:50px;border-radius:5px;width:160px;height:32px;">
 										  <%
                   							for(ClassBean temp : classes)
                   							{
                   								out.print("<option value = '" + temp.getClassID() + "'>" + temp.getClassName() + "</option>");
                   							}
                  						 %>
                                         </select>

</th>

 </tr>

 <tr >

        <td colspan="4" align="center" style="border-radius:5px;">

            <input type="submit" style="cursor:pointer;border-radius:5px;margin-right:100px;background:#D2E9FF;width:50px;height:30px;" value="添加">

            <a href = "AdminIndex.jsp"><input type="button" style="cursor:pointer;border-radius:5px;background:#D2E9FF;width:50px;height:30px;" value="返回"></a>

        </td>



    </tr>
              </table>
      </form>
      </div>
   </body>
</html>
