<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Logout</title>
</head>
<body>
<img src = "images/logos.png" align = "left" width="200" height = "150" style="margin-left:30px;margin-top:30px" />
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<center><font color ="red" size="5"><a> You have logged out Successfully </a></font><br/><br/><br/>
<%

		session.invalidate();
%>
<font color="green" size="4"><b><a href="stafflogin.jsp"> Login </a></b></font><br/><br/><br/>
</center>
<body>
<html>