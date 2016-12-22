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
		String user= (String) session.getAttribute("user");
		Class.forName("oracle.jdbc.driver.OracleDriver");
 		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl","tpradhan1","YCsBUo3...uK3Z17");
		String id=request.getParameter("id");
		Statement stdual = conn.createStatement();
		String sqldual = "select 'Pending' Status,'P' Code from DUAL UNION select 'In Progress' Status,'I' CODE from DUAL UNION select 'Shipped' Status,'S' Code from DUAL UNION select 'Delivered' Status,'D' Code  from DUAL";
		ResultSet rssqldual = stdual.executeQuery(sqldual);
		%>
		<div style="float:right;margin-right:50px">
		<font size="4">Select Status: </font><select name="sel" id="sel">
	<%
	while(rssqldual.next()){
	%>
	<option <%if((rssqldual.getString("Code")).equals(request.getParameter("id"))){%>selected="selected"<%}%> > <%out.print(rssqldual.getString("Code"));
	%></option>
	<%
	}
	%>
	</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="javascript:window.location.href='processorders.jsp?id=' + document.getElementById('sel').value" style="text-decoration:none"><font size="5">Go</a>
	</div><br/><br/>
	<table border="1">
		<col width="50">
  <col width="150">
  <col width="50">
  <col width="50">
  <col width="50">
  <col width="50">
  <col width="150">
   <col width="50">
      <col width="50">
	     <col width="50">
		<tr>
  <th>ORDER_ID</th>
    <th>PRODUCT</th>
    <th>QUANTITY</th>
	<th>AMOUNT</th>
	<th>ORDER_DATE_TIME</th>
	<th>STATUS</th>  
	<th>CARD_NUMBER</th>
	<th>ADDRESS</th>
	<th>DATE_DELIVERED</th> 
<th></th> 	
  </tr>
	<%
	if(id!=null){
		String sql = "select distinct ord.order_id,p.pname,po.quantity,(pp.price*po.quantity) total_amount,TO_CHAR(ord_time,'dd-MM-yyyy HH24:MI') ord_time,Status,Card_number,(ca.add_line1 ||' '|| ca.add_line2||' '|| ca.city||' '||ca.state_code||' '|| ca.zip) Address, case when ord.date_delivered is null then 'NA' else date_delivered end date_delivered  from products p, product_price pp,customer c, customer_address ca, orders ord, prod_orders po  where c.cid= ca.cid and p.pid=pp.pid and ca.state_code= pp.state_code and po.pid = p.pid and po.order_id= ord.order_id and ord.cid=c.cid and ca.aid= ord.aid and status = ? order by order_id";
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setString(1,id);
		ResultSet rs = pst.executeQuery();
		while(rs.next()){%>
  <tr>
<td><center><font size="4"><b><%=rs.getString("order_id")%></b><font></center>
<td><center><font size="4"><b><%=rs.getString("pname")%> </b><font></center>
<td><center><font size="4"><b><%=rs.getString("quantity")%></b></font></center></td>
<td><center><font size="4"><b><p>$ <%=rs.getString("total_amount") %></p></b></font></center></td>
<td><center><font size="4"><b><p><%=rs.getString("ORD_TIME")%></p></b></font></center></td>
<td><center><input type="text" maxlength="1" width="20" onkeypress="return onlyAlphabets()" value="<%=rs.getString("STATUS")%>" id="qty<%=rs.getString("STATUS")%>"></b></font></center></td>
<td><center><font size="3"><b><p><%=rs.getString("CARD_NUMBER") %></p></b></font></center></td>
<td><center><font size="3"><b><p><%=rs.getString("ADDRESS") %></p></b></font></center></td>
<td><center><input type="text" maxlength="8" width="50" onkeypress="return img()" value="<%=rs.getString("DATE_DELIVERED")%>" id="qty<%=rs.getString("DATE_DELIVERED")%>"></b></font></center></td>
<td><center><a href="javascript:if(
document.getElementById('qty<%=rs.getString("STATUS")%>').value!='' ||
(document.getElementById('qty<%=rs.getString("DATE_DELIVERED")%>').value!='' 
&& document.getElementById('qty<%=rs.getString("DATE_DELIVERED")%>').value.length==8 )){
window.location.href='modifyorders.jsp?STATUS=' +  document.getElementById('qty<%=rs.getString("STATUS")%>').value 
+ '&DATE_DEL=' + document.getElementById('qty<%=rs.getString("DATE_DELIVERED")%>').value
+ '&pname=<%=rs.getString("pname")%>'
+ '&order_id=<%=rs.getString("order_id")%>' }" > Modify </a><center></td>

</tr>	
		<%
		}
	}%>
		</table>