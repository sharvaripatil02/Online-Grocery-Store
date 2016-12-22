<html>
<head>
<title> GreenGrocer Welcomes you </title>
 <script type="text/javascript" src="jquery.js"></script>
  <script type="text/javascript" src="javascripts.jsp"></script>
</head>
 <link rel="stylesheet" href="orders.css">
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
th {
    background-color: #4CAF50;
    color: white;
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
	</div></table><hr/>
	
	
	<%@page  import="java.sql.*"%>
<%

	Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl","tpradhan1","YCsBUo3...uK3Z17");
Statement st = conn.createStatement();
String sql = "select state_name from states where state_code not in ('XX')";
ResultSet rs = st.executeQuery(sql);
		%>
		<div style="float:right;margin-right:50px">
		<font size="4">Select State: </font><select name="sel" id="sel">
	<%
	while(rs.next()){
	%>
	<option <%if((rs.getString("state_name")).equals(request.getParameter("id"))){%>selected="selected"<%}%> > <%out.print(rs.getString("state_name"));
	%></option>
	<%
	}
	%>
	</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="javascript:window.location.href='supplierdetails.jsp?id=' + document.getElementById('sel').value" style="text-decoration:none"><font size="5">Go</a>
	</div><br/><br/>
	<%String id=request.getParameter("id");
		if(id!=null){
	String lower_state=id.toLowerCase();
	String sqlprod = "select s.SPID,SNAME,p.pname,(ADD_LINE1||' '||ADD_LINE2||' '||State_code||' '||Zip) Address, sp.sprice,Phone  from supplier s,supplies sp,products p where p.pid= sp.pid and s.spid= sp.spid and state_code = (select state_code from states where lower(state_name)=?)";
    PreparedStatement prodpst = conn.prepareStatement(sqlprod);
	prodpst.setString(1,lower_state);
	ResultSet rssqlprod = prodpst.executeQuery();%>	
	<font></div><br/>
	<table border="1">
		<col width="100"><col width="100">
  <col width="100"><col width="200">
  <col width="100">
		<tr>
		<th>Supplier ID</th>
  <th>Supplier Name</th>
    <th>Product Name</th>
	<th>Supplier Price</th>
    <th>Address</th>
	<th>Phone</th>
  </tr>
<%
while(rssqlprod.next()){
	%>
<tr><td><center><font size="3"><b><%=rssqlprod.getString("SPID")%></b></font></center></td>
<td><center><font size="3"><b><%=rssqlprod.getString("SNAME")%></b></font></center></td>
<td><center><font size="3"><b><%=rssqlprod.getString("pname")%></b></font></center></td>
<td><center><font size="3"><b>$ <%=rssqlprod.getString("sprice")%></b></font></center></td>
<td><center><font size="3"><b><%=rssqlprod.getString("Address")%></b></font></center></td>
<td><center><font size="3"><b><%=rssqlprod.getString("Phone")%></b></font></center></td>

</tr>
<%}
}
%>
</table>
		
	
	