<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "com.gxun.jms.pojo.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%UserTest xyw = (UserTest)request.getAttribute("xyw");%>
<h1><%=xyw.getName()%></h1>
<h2><%=xyw.getAge()%></h2>
<h3><%=xyw.getGender()%></h3>
</body>
</html>