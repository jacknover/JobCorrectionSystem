<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*,com.gxun.jms.pojo.*,com.gxun.jms.service.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>修改密码</title>
    <style>
    html, body, h1, form, fieldset, legend, ol ,li{
        padding:0;
        margin:0;
    }
    ol{
        list-style:none;
    }
    body{
        background:#fff;
        color:#111;
        margin-top:150px;
        margin-left:450px;
    }
    form#payment{
        background:#9cbc2c;
        -webkit-border-radius:5px;
        border-radius:5px;
        padding:20px;
        width:400px;
    }
    form#payment fieldset{
        border:none;
        margin-bottom:10px;
    }
    form#payment fieldset:last-of-type{ margin-bottom:0; }
    form#payment legend{
        color:#384313;
        font-size:16px;
        font-weight:bold;
        padding-bottom:10;
        text-shadow:0px 1px 1px #c0d576;
    }

    form#payment fieldset fieldset legend{
        color:#111;
        font-size:13px;
        font-weight:normal;
        padding-bottom:0;
    }
    form#payment ol li{
        background:#b9cf6a;
        background:rgba(255, 255, 255, 0.3);
        border:#e3ebc3;
        border-color:rgba(255, 255, 255, 0.6);
        border-style:solid;
        border-width:2px;
        -webkit-border-radius:5px;
        line-height:30px;
        padding:5px 10px;
        margin-bottom:2px;
    }
    form#payment ol ol li{
        bakcground:none;
        border:none;
        float:left;
    }
    form#payment label{
        float:left;
        font-size:13px;
        width:100px;
    }
    form#payment fieldset fieldset label{
        background:none no-repeat left 70%;
        line-height:20px;
        padding:0 0 0 30px;
        width:auto;
    }
    form#payment fieldset fieldset label:hover{cursor:pointer;}
    form#payment input:not([type=radio]), form#payment textarea{
        background:#fff;
        border:#fc3 solid 1px;
        -webkit-border-radius:3px;
        outline:none;
        padding:5px;
    }
form#payment dibu{
       margin-top:20px;
        width:350px;
margin-left:150px;
    }
    </style>
</head>
<body>
<form id=payment name="form1" method="post" action="updatePassword">
    <fieldset>
        <legend>修改密码</legend>
        <ol>
            <li>
                <label for="name">旧密码：</label>
                <input type="password" id="pastpws" name="pastpws" placeholder="请注意区分大小写" required autofocus>
            </li>
            <li>
                <label for="email">新密码：</label>
                <input type="password" name="newpws" id="newpws" placeholder="请输入8-16位数字或字母" required autofocus>
            </li>
            <li>
                <label for="phone" >确认新密码：</label>
                <input type="password" placeholder="请输入8-16位数字或字母" id="pws" name="pws" required autofocus>
            </li>
        </ol>
    </fieldset>


 <dibu>
    <button type="submit" style="font-size:15px;background:#9cbc2c">确认</button>
    <button type="reset" style="font-size:15px;background:#9cbc2c">重置</button>
  </dibu>
</form>


</body>
</html>