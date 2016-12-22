<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>JSP Page</title> 
 </head> 
 <body> 
   <link rel="stylesheet" href="style.css">
    <div>
		<img src = "http://localhost:8010/examples/CS425_project/images/logos.png" align = "left" width="200" height = "150" style="margin-left:30px;margin-top:30px" />
		</div>
		
		 <center><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/> <h1>Staff Login Details</h1> </center> 
 <center>
 
  <script type="text/javascript" src="javascripts.jsp"></script>
 <form action="staffLoginCheck.jsp" method="post"> 
 <table><b>
<br/><br/><tr><td><input type="text"required name="username" onkeypress="return AlphaNumeric()" maxlength="10" placeholder="Username"></td></tr>
 <tr><td><input type="password"required name="password" placeholder="Password" maxlength="32"> </td></tr>
 <tr><td><input type="submit" value="LogIn"></td></tr>
 </form> 
  </table>
 </center> 
 </body> 
 </html>
