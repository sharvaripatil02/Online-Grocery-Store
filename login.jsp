<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>JSP Page</title> 
 </head> 
 <body> 
   <link rel="stylesheet" href="style.css">
    <div>
	<a href="main.jsp">	<img src = "http://localhost:8010/examples/CS425_project/images/logos.png" align = "left" width="200" height = "150" style="margin-left:30px;margin-top:30px" /></a>
		</div>
		
		 <center><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/> <h1>Login Details</h1> </center> 
 <center>
 
  <script type="text/javascript" src="javascripts.jsp"></script>
 <form action="LoginCheck.jsp" method="post"> 
 <table><b>
<br/><br/><tr><td><input type="text"required name="username" onkeypress="return AlphaNumeric()" placeholder="Username" maxlength="10"></td></tr>
 <tr><td><input type="password"required name="password" placeholder="Password" maxlength="32"> </td></tr>
 <tr><td><input type="submit" value="LogIn"><a>   </a><button type="button" onclick="window.location.href='http://localhost:8010/examples/CS425_project/signup.jsp'"> SignUp </button> </td></tr>
 </form> 
 <%
 	 if(session.getAttribute("user")!=null)
	 session.invalidate();
 %>
  </table>
  <br/>
 <br/>
  <br/>
   <br/>
 <td>Customer Support - <a href="contact.jsp">Contact us</a> </td>
 </center> 
 </body> 
 </html>
