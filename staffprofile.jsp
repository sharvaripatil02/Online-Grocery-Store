<html>
<head>
<title> GreenGrocer Welcomes you </title>
 <script type="text/javascript" src="jquery.js"></script>
  <script type="text/javascript" src="javascripts.jsp"></script>
</head>
 <link rel="stylesheet" href="stylestaff.css">
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
}
</style>
<%
if(session.getAttribute("user")==null){
	String redirectURL = "http://localhost:8010/examples/CS425_project/stafflogin.jsp";
response.sendRedirect(redirectURL);
}%>
<form action="products.jsp" id="searchForm" method="post">
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
	</div></table><hr/>
	<%@page  import="java.sql.*"%>
<%String user=(String)session.getAttribute("user");
	Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl","tpradhan1","YCsBUo3...uK3Z17");
	user=user.toLowerCase();
	String sqlprod = "select SID,FNAME,LNAME, email_id,PHONE,UNAME, job_title, TO_CHAR(joining_date,'MM-DD-YYYY') joining_date, salary, add_line1, add_line2, city, state_code,zip from staff where lower(UNAME)=?";
    PreparedStatement prodpst = conn.prepareStatement(sqlprod);
	prodpst.setString(1,user);
	ResultSet rssqlprod = prodpst.executeQuery();
%>
<br/><br/><center>
<table>	
<%while(rssqlprod.next()){%>
<tr><td><font size="4"><b>Staff ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b><%=rssqlprod.getString("SID") %></font></td></tr>
<tr><td><font size="4"><b>First Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b><%=rssqlprod.getString("FNAME") %></center></td></tr>
<tr><td><font size="4"><b>Last Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b><%=rssqlprod.getString("LNAME") %></center></td></tr>
<tr><td><font size="4"><b>EmailID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b><%=rssqlprod.getString("email_id") %></center></td></tr>
<tr><td><font size="4"><b>Phone&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b><%=rssqlprod.getString("PHONE") %></center></td></tr>
<tr><td><font size="4"><b>Username&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b><%=rssqlprod.getString("UNAME") %></center></td></tr>
<tr><td><font size="4"><b>Position&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b><%=rssqlprod.getString("job_title") %></center></td></tr>
<tr><td><font size="4"><b>Joining Date&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b><%=rssqlprod.getString("joining_date") %></center></td></tr>
<tr><td><font size="4"><b>Salary&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b><%=rssqlprod.getString("salary") %></center></td></tr>

<tr><td><font size="4"><b>Address Line 1:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b><%=rssqlprod.getString("add_line1") %></center></td></tr>
<tr><td><font size="4"><b>Address Line 2:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b><%=rssqlprod.getString("add_line2") %></center></td></tr>
<tr><td><font size="4"><b>City&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b><%=rssqlprod.getString("city") %></center></td></tr>
<tr><td><font size="4"><b>State&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b><%=rssqlprod.getString("state_code") %></center></td></tr>
<tr><td><font size="4"><b>Zip&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b><%=rssqlprod.getString("zip") %></center></td></tr>
<%}%>
</center>
</body>
</html>
