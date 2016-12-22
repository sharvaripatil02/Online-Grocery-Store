<html> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>JSP Page</title> 
 </head> 
 <body> 
  <center>
  <link rel="stylesheet" href="style.css">
   <div>
		<img src = "http://localhost:8010/examples/CS425_project/images/logos.png" align = "left" width="200" height = "150" style="margin-left:30px;margin-top:30px" />
		</div>
		<center><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/> <h1><font color="#1ab188">Create a New Account</font></h1> </center>
 <script type="text/javascript" src="jquery.js"></script>
  <script type="text/javascript" src="javascripts.jsp"></script>
  
 <form action="SignUpCheck.jsp" method="post"> 
 <table><b>
<br/><br/><tr><td></td></tr> 
<tr><td><input type="text"required onkeypress="return onlyAlphabets()" placeholder="First Name" name="First" maxlength="19">
<input type="text"required  placeholder="Last Name" onkeypress="return onlyAlphabets()" name="Last" maxlength="19"></td></tr> 
<tr><td><input id="username"required  placeholder="Username" onkeypress="return AlphaNumeric()" type="text" name="username" maxlength="10">
<input type="password"required placeholder="Password" pattern=".{6,}" title="Password must have atleast 6 characters" onkeypress="return PasswordChk()" name="password"  maxlength="32"><div id="status"></div></td></tr> 
 <script type="text/javascript" src="chk_user.js"></script> 
<tr><td><input type="text"required placeholder="Address Line1" onkeypress="return AlphaNumericSp()"  name="AL1" maxlength="49">
<input type="text"required  placeholder="Address Line2" onkeypress="return AlphaNumericSp()"  name="AL2" maxlength="49">  </td></tr> 
<tr><td><input type="text"required onkeypress="return onlyAlphabets()"  placeholder="City" name="City" maxlength="19">
<%@page  import="java.sql.*"%>
<% 
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl","tpradhan1","YCsBUo3...uK3Z17");
//Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","Atos123");
Statement st = conn.createStatement();
String sql = "select state_code from states where state_code not in ('XX')";
ResultSet rs = st.executeQuery(sql);
		%>
		<select name="State">
	<%
	while(rs.next()){
	%>
		<option> <%out.print(rs.getString("state_code")); %></option>
	<%
	}
	}
catch (SQLException e){
	out.print("AN Error Occured");
}
		%>
	
</select><a> :State </a></td></tr> 
<tr><td><input type="text"required placeholder="Zip"  name="Zip"  pattern=".{5,}" title="XXXXX - Invalid Zip" onkeypress="return onlyNumbers()" maxlength="5" >
<input type="email"required placeholder="EmailID" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" title="abc@xyz.com" name="EmailID" id="EmailID" maxlength="49"><div id="statuse" name="statuse" ></div>
</td></tr>
 <script type="text/javascript" src="chk_email.js"></script>  
<tr><td><input type="text"required placeholder="Phone"  name="Phone"  pattern=".{10,}" title="XXXXXXXXXX - Phone must be 10 Digit"  maxlength="10" onkeypress="return onlyNumbers()">
<input type="text"  placeholder="AlternatePhone"  pattern=".{10,}" title="XXXXXXXXXX - Phone must be 10 Digit"  name="ALPhone"  maxlength="10" onkeypress="return onlyNumbers()"></td></tr> 
 <td>By submitting this form you agree to Green Grocer's - <a href="TermsOfServices.jsp"> Terms of Services</a> </td>
<tr><td><input type="submit" id="submit" value="SignUp"></td></tr> 
</table> 
 </form> 
 </center> 
 </body> 
 </html>