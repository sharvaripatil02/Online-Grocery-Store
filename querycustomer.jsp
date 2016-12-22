<html>
<head>
<title> GreenGrocer Welcomes you </title>
 <script type="text/javascript" src="jquery.js"></script>
  <script type="text/javascript" src="javascripts.jsp"></script>
</head>
 <link rel="stylesheet" href="customer.css">
<body>
<style>
.floated_img
{
    float: left;
}
textarea {
 font-size: 12;
 font-weight: bold;
 font-family: Verdana, Arial, Helvetica, sans-serif;
 border: 1px solid black;
 width:300;
 height:100;
}
</style>
<%
if(session.getAttribute("user")==null){
	String redirectURL = "http://localhost:8010/examples/CS425_project/stafflogin.jsp";
response.sendRedirect(redirectURL);
}%>
<input type="text" id="status" name="status" pattern="[A-Za-z]" style="visibility:hidden"/>
	<img src = "images/logos.png" align = "left" width="200" height = "150" style="margin-left:30px;margin-top:30px"  />
		<br/><br/>
		<div style="float:right;margin-right:0px;margin-top:1px">
		<button type="button" style="float:right;margin-right:50px" onclick="window.location.href='http://localhost:8010/examples/CS425_project/stafflogout.jsp'"> LogOut </button>
		<br/><br/><br/>	<button type="button" style="float:right;margin-right:50px" onclick="window.location.href='http://localhost:8010/examples/CS425_project/staffprofile.jsp'">Profile</button>
		<br/><br/><br/><font size="5"><a> Welcome <%String wel = (String)session.getAttribute("user"); out.print(wel);%> &nbsp;&nbsp;&nbsp;</a></font>
		</div>
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><hr/>
		<div>
<table align="center"><div>
<tr><td>

	<a href="modifyproducts.jsp" name="ref" id="ref" style="text-decoration:none">ModifyProducts</a>
	<a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
	<a href="addproducts.jsp"  name="ref2" id="ref2" style="text-decoration:none">AddProducts</a>
	<a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
	<a href="processorders.jsp"  name="ref3" id="ref3" style="text-decoration:none">ProcessOrders</a>
	<a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
	<a href="managestock.jsp"  name="ref4" id="ref4" style="text-decoration:none">ManageStock</a>
	<a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
	<a href="querycustomer.jsp"  name="ref4" id="ref4" style="text-decoration:none">CustomerDetails</a>
	<a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
	<a href="supplierdetails.jsp"  name="ref4" id="ref4" style="text-decoration:none">SupplierDetails</a>
	</div></td></tr>
	</div></table><hr/><br/>
	<%@page  import="java.sql.*"%>
	<%

	
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl","tpradhan1","YCsBUo3...uK3Z17");

String cid=request.getParameter("cid");
if (cid!=null) cid=cid.toLowerCase();
String First=(String)request.getParameter("First");
if (First!=null) First=First.toLowerCase();
String Last=(String)request.getParameter("Last");
if (Last!=null) Last=Last.toLowerCase();
String user=(String)request.getParameter("user");
if (user!=null) user=user.toLowerCase();
String email=(String)request.getParameter("email");
if (email!=null) email=email.toLowerCase();
String sql4= "select cid,FNAME,LNAME,EMAIL_ID,UNAME,WALLET_AMT from Customer where CID like ? UNION select cid,FNAME,LNAME,EMAIL_ID,UNAME,WALLET_AMT from Customer where lower(FNAME) like ? UNION select cid,FNAME,LNAME,EMAIL_ID,UNAME,WALLET_AMT from Customer where lower(LNAME) like ? UNION select cid,FNAME,LNAME,EMAIL_ID,UNAME,WALLET_AMT from Customer where lower(UNAME) like  ? UNION select cid,FNAME,LNAME,EMAIL_ID,UNAME,WALLET_AMT from Customer where lower(EMAIL_ID) like ?";
PreparedStatement pst4 = conn.prepareStatement(sql4);
if(cid!="" & cid!=null)
pst4.setString(1,cid);
else
pst4.setString(1,"");
if(First!="" & First!=null)
pst4.setString(2,"%"+First+"%");
else
pst4.setString(2,"");
if(Last!="" & Last!=null)
pst4.setString(3,"%"+Last+"%");
else
pst4.setString(3,"");
if(user!="" & user!=null)
pst4.setString(4,"%"+user+"%");
else
pst4.setString(4,"");
if(email!="" & email!=null)
pst4.setString(5,"%"+email+"%");
else
pst4.setString(5,"");
ResultSet rs4 = pst4.executeQuery();
%>


<center><font size="4">Search Customers :</font></center><br/>
<center><table>
<tr><td><input type="text" onkeypress="return onlyNumbers()" placeholder="CustomerID" name="cid" id ="cid" maxlength="10">
<input type="text" onkeypress="return onlyAlphabets()" placeholder="First Name" name="First" id="First" maxlength="19">
<input type="text"  placeholder="Last Name" onkeypress="return onlyAlphabets()" name="Last" id="Last" maxlength="19">
<input type="text"  placeholder="Username" onkeypress="return AlphaNumeric()" id="user" name="user" maxlength="10">
<input type="email"  placeholder="EmailID" id="email" name="email" maxlength="49"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<font size="4"><a href=
"javascript:if(
(document.getElementById('cid').value!='' &&
document.getElementById('First').value!='' &&
document.getElementById('Last').value!='' &&
document.getElementById('user').value!='' &&
document.getElementById('email').value!='') ||
 document.getElementById('cid').value!='' || 
 document.getElementById('First').value!='' ||
 document.getElementById('Last').value!='' ||
 document.getElementById('user').value!='' ||
 document.getElementById('email').value!=''){
window.location.href='querycustomer.jsp?cid=' + document.getElementById('cid').value 
+ '&First=' + document.getElementById('First').value
+ '&Last=' + document.getElementById('Last').value
+ '&user=' + document.getElementById('user').value
 + '&email=' + document.getElementById('email').value }">Search</a></td></tr></table><center>


	<table border="1">
		<col width="150">
  <col width="150">
  <col width="150">
  <col width="150">
  <col width="150">
  <col width="150">
  <col width="150">
   <col width="150">
		<tr>
  <th>CustomerID</th>
    <th>FirstName</th>
    <th>LastName</th>
	<th>EmailID</th>
	<th>UserName</th>
	<th>WalletAmt</th>   
  </tr>
	<%
		while(rs4.next()){%>
  <tr>
<td><center><font size="4"><b><%=rs4.getString("cid")%></b><font></center>
<td><center><font size="4"><b><%=rs4.getString("FNAME")%></b></font></center></td>
<td><center><font size="4"><b><p><%=rs4.getString("LNAME") %></p></b></font></center></td>
<td><center><font size="4"><b><p><%=rs4.getString("EMAIL_ID")%></p></b></font></center></td>
<td><center><font size="4"><b><p><%=rs4.getString("UNAME") %></p></b></font></center></td>
<td><center><font size="4"><b><p><%=rs4.getString("WALLET_AMT") %></p></b></font></center></td>
</tr>	
<%
}
%>
</table>

	
	