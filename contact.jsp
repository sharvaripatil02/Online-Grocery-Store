<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title> GreenGrocer Welcomes you </title>
</head>
 <link rel="stylesheet" href="style.css">
<body>
<%@page  import="java.sql.*"%>
<% 
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl","tpradhan1","YCsBUo3...uK3Z17");
%>
		<form action="main.jsp" method="post">
		<button type="button" style="float:right;margin-right:50px;margin-top:50px" onclick="window.location.href='http://localhost:8010/examples/CS425_project/login.jsp'"> LogIn / SignUp </button>
		<div>
		<a href="main.jsp"> <img src = "http://localhost:8010/examples/CS425_project/images/logos.png" align = "left" width="200" height = "150" style="margin-left:30px;margin-top:30px" /></a>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
		<center><p><h1> Contact : +1-312-444-7871 </h1></p></center><p>
		<center><a href="mailto:greengrocers@helpdesk.com"><img src="images/mail.ico" width="50" height="50" /></a></center>
		</div>
		
<%
conn.close();
conn=null;
	%>


</body>
</html>

