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
	<a href="javascript:window.location.href='managestock.jsp?id=' + document.getElementById('sel').value" style="text-decoration:none"><font size="5">Go</a>
	</div><br/><br/>
<%
String id=request.getParameter("id");
String msg = request.getParameter("msg");
if(msg!=null && msg!=""){
	out.print(msg);
	msg="";
}
else{
		if(id!=null){
String sqlware = "select (capacity-(select sum(stk_size) stk_size from stock_size where wid in (select wid from warehouse where state_code=(select state_code from states where state_name = ?)))) rem_capacity from warehouse where state_code= (select state_code from states where state_name = ?)";
PreparedStatement sqlwarepst = conn.prepareStatement(sqlware);
sqlwarepst.setString(1,id);
sqlwarepst.setString(2,id);
ResultSet rssqlwarepst = sqlwarepst.executeQuery();
String REM_CAPACITY="";
while(rssqlwarepst.next()){
%>
<div style="float:right;margin-right:50px">
<font size="5">Remaining Capacity of Warehouse :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=rssqlwarepst.getString("rem_capacity")%> </font>
		<%
		REM_CAPACITY=rssqlwarepst.getString("rem_capacity");
		}
	%>
<%String sqlstock = "select ss.WID,p.PNAME,p.psize,ss.Quantity,ss.STK_SIZE from stock_size ss,products p,warehouse w where p.pid= ss.pid and ss.wid = w.wid and state_code= (select state_code from states where state_name = ?)";
PreparedStatement sqlstockpst = conn.prepareStatement(sqlstock);
sqlstockpst.setString(1,id);
ResultSet rssqlstockpst = sqlstockpst.executeQuery();
%>
<font></div><br/>
	<table border="1">
		<col width="100"><col width="100">
  <col width="100"><col width="100">
  <col width="100"><col width="100">
		<tr>
		<th>Warehouse ID</th>
  <th>Product Name</th>
    <th>Quantity</th>
	<th>Product Size(Cubic feet)</th>
    <th>Stock Size</th>
	<th></th>
  </tr>
<%
while(rssqlstockpst.next()){
	int orgqty = rssqlstockpst.getInt("STK_SIZE");
	%>
<tr><td><center><font size="3"><b><%=rssqlstockpst.getString("WID")%></b></font></center></td>
<td><center><font size="3"><b><%=rssqlstockpst.getString("PNAME")%></b></font></center></td>
<td><center><font size="3"><b><input type="text" maxlength="3" onkeypress="return onlyNumbers()" value="<%=rssqlstockpst.getString("Quantity")%>" id="qty<%=rssqlstockpst.getString("Quantity")%>"></b></font></center></td>
<td><center><font size="3"><b><%=rssqlstockpst.getString("psize")%></b></font></center></td>
<td><center><font size="3"><b><%=rssqlstockpst.getString("STK_SIZE")%></b></font></center></td>
<td><center><a href="javascript:if(
document.getElementById('qty<%=rssqlstockpst.getString("Quantity")%>').value!=''){
	window.location.href='updatestock.jsp?Quantity=' + document.getElementById('qty<%=rssqlstockpst.getString("Quantity")%>').value 
	+ '&WID=<%=rssqlstockpst.getString("WID")%>' 
+ '&PNAME=<%=rssqlstockpst.getString("PNAME")%>'
+ '&STATE=' + document.getElementById('sel').value
+ '&REM_CAPACITY=<%out.print(REM_CAPACITY);%>' 
+ '&PSIZE=<%int stk = rssqlstockpst.getInt("psize"); out.print(stk);%>'
+ '&orgqty=<%out.print(orgqty);%>' 
}">Update</a><center></td>

</tr>
<%}
}
		}
%>
</table>
	

