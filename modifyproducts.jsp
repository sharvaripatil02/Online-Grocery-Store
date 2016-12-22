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
<% 
try{
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
	session.setAttribute("statename",rs.getString("state_name"));
	%></option>
	<%
	}
	%>
	</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="javascript:window.location.href='modifyproducts.jsp?id=' + document.getElementById('sel').value" style="text-decoration:none"><font size="5">Go</a>
	</div><br/><br/><br/>
	
	<%
	String id=request.getParameter("id");
		if(id!=null){
	String lower_state=id.toLowerCase();
	String sqlprod = "select p.PID,PNAME,PTYPE,DETAILS, pp.price,PSIZE,img_path from products p, product_price pp, states s where pp.pid=p.pid and pp.state_code= s.state_code and lower(state_name)=?";
    PreparedStatement prodpst = conn.prepareStatement(sqlprod);
	prodpst.setString(1,lower_state);
	ResultSet rssqlprod = prodpst.executeQuery();	
	%>
	<center><font size="6"><%
	out.print("Viewing Products for " + request.getParameter("id"));%>
	<font></center><br/>
	<table border="1">
		<col width="100"><col width="150">
  <col width="200"><col width="300"><col width="100"><col width="100">
  <col width="100"><col width="70">
		<tr>
		<th>PRODUCT ID</th>
  <th>PRODUCT NAME</th>
    <th>PRODUCT TYPE</th>
    <th>PRODUCT DETAILS</th>
	<th>PRODUCT PRICE</th>
	<th>PRODUCT SIZE(Cubic feet)</th>
	<th>IMG PATH</th>
	<th></th>
	<th></th>
  </tr>
<%while(rssqlprod.next()){
		%>
		<tr>
<td><center><font size="5"><b><%=rssqlprod.getString("PID")%></b></font></center></td>
<td><center><font size="5"><b><input type="text" maxlength="19" onkeypress="return onlyAlphabetssp()" value="<%=rssqlprod.getString("PNAME")%>" id="qty<%=rssqlprod.getString("PNAME")%>"></b></font></center></td>
<td><center><font size="5"><b><input type="text" maxlength="19" onkeypress="return onlyAlphabetssp()" value="<%=rssqlprod.getString("PTYPE")%>" id="qty<%=rssqlprod.getString("PTYPE")%>"></b></font></center></td>
<td><center><font size="5"><b><textarea rows="4" cols="40" maxlength="990" id="qty<%=rssqlprod.getString("DETAILS")%>"><%out.print(rssqlprod.getString("DETAILS"));%></textarea></b></font></center></td>
<td><center><font size="5"><b><input type="text" maxlength="10" onkeypress="return myPrice()" value="<%=rssqlprod.getString("price")%>" id="qty<%=rssqlprod.getString("price")%>"></b></font></center></td>
<td><center><font size="5"><b><input type="text" onkeypress="return onlyNumbers()" maxlength="5" value="<%=rssqlprod.getString("PSIZE")%>" id="qty<%=rssqlprod.getString("PSIZE")%>"></b></font></center></td>
<td><center><font size="5"><b><input type="text" onkeypress="return img()" maxlength="199" value="<%=rssqlprod.getString("img_path")%>" id="qty<%=rssqlprod.getString("img_path")%>"></b></font></center></td>
<td><center><a href="javascript:if(
document.getElementById('qty<%=rssqlprod.getString("PNAME")%>').value!='' ||
document.getElementById('qty<%=rssqlprod.getString("PTYPE")%>').value!='' || 
document.getElementById('qty<%=rssqlprod.getString("DETAILS")%>').value!=''|| 
document.getElementById('qty<%=rssqlprod.getString("price")%>').value !='' ||
document.getElementById('qty<%=rssqlprod.getString("img_path")%>').value !='' ||  
document.getElementById('qty<%=rssqlprod.getString("PSIZE")%>').value!=''  )
{window.location.href='updateproducts.jsp?DETAILS=' + document.getElementById('qty<%=rssqlprod.getString("DETAILS")%>').value 
+ '&PTYPE=' + document.getElementById('qty<%=rssqlprod.getString("PTYPE")%>').value  
+ '&PID=<%=rssqlprod.getString("PID")%>' 
+ '&PNAME=' + document.getElementById('qty<%=rssqlprod.getString("PNAME")%>').value 
+ '&price=' + document.getElementById('qty<%=rssqlprod.getString("price")%>').value
+ '&PSIZE=' + document.getElementById('qty<%=rssqlprod.getString("PSIZE")%>').value
+ '&img_path=' + document.getElementById('qty<%=rssqlprod.getString("img_path")%>').value
+ '&STATE=' + document.getElementById('sel').value }">Update</a><center></td>
<td><center><a href="javascript:window.location.href='deleteproducts.jsp?PID=<%=rssqlprod.getString("PID")%>' 
+ '&STATE=' + document.getElementById('sel').value "> Delete </a></center></td></tr>	
	<%
		}
		}
	}

catch (SQLException e){
	out.print("AN Error Occured");
}
		%>
		 </table>
	
	</body>
	</html>