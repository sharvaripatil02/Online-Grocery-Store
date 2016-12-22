<html>
<head>
<title> GreenGrocer Welcomes you </title>
 <script type="text/javascript" src="jquery.js"></script>
  <script type="text/javascript" src="javascripts.jsp"></script>
</head>
 <link rel="stylesheet" href="cart.css">
 <script type="text/javascript">
$(document).ready(function(){
    $('#ref').click(function(){
		var txt=$('#ref').text();
        $('#status').val(txt);
		document.forms.searchForm.submit();
    });
});
$(document).ready(function(){
    $('#ref2').click(function(){
        var txt=$('#ref2').text();
        $('#status').val(txt);
		document.forms.searchForm.submit();
    });
});
$(document).ready(function(){
    $('#ref3').click(function(){
       var txt=$('#ref3').text();
        $('#status').val(txt);
		document.forms.searchForm.submit();
    });
});
$(document).ready(function(){
    $('#ref4').click(function(){
        var txt=$('#ref4').text();
        $('#status').val(txt);
		document.forms.searchForm.submit();
    });
});
</script>
<body>
<style>
.floated_img
{
    float: left;
}


</style>
<%if(session.getAttribute("state")==null){
			String redirectURL = "http://localhost:8010/examples/CS425_project/main.jsp";
response.sendRedirect(redirectURL);}%>

<form action="products.jsp" id="searchForm" method="post">
<input type="text" id="status" name="status" pattern="[A-Za-z]" style="visibility:hidden"/>
	<a href="category.jsp">	<img src = "images/logos.png" align = "left" width="200" height = "150" style="margin-left:30px;margin-top:30px"  /></a>
		</div>
		<%if(session.getAttribute("user")==null){
			%>
<button type="button" style="float:right;margin-right:50px;margin-top:50px" onclick="window.location.href='http://localhost:8010/examples/CS425_project/login.jsp'"> LogIn / SignUp </button>
		<%}
		else{
			%>
			<div style="float:right;margin-right:0px;margin-top:1px"><font size="5"><a> Welcome <%String wel = (String)session.getAttribute("user"); out.print(wel);%> &nbsp;&nbsp;&nbsp;</a></font>
			<button type="button" style="float:right;margin-right:0px;margin-top:120px" onclick="window.location.href='http://localhost:8010/examples/CS425_project/logout.jsp'"> LogOut </button>
			<br/><br/><br/><br/><a href="cart_view.jsp"><img style="float:right;margin-right:0px;margin-top:100px" src="images/cart.jpg" width="50" height="50" /></a><br/><br/>
			<button type="button" style="float:right;margin-right:0px" onclick="window.location.href='http://localhost:8010/examples/CS425_project/customerinfo.jsp'">Profile</button>

			</div><%}
		%>
		<br/><br/>
		
		<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><hr/>
		<div>
<table align="center"><div>
<tr><td>
<%if(session.getAttribute("user")==null){
out.print("<a href=\"main.jsp\" style=\"text-decoration: none\"> HOME </a>");
}%>
	<a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
	<a href="#" name="ref" id="ref" style="text-decoration:none">VEGETABLES</a>
	<a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
	<a href="#"  name="ref2" id="ref2" style="text-decoration:none">FRUITS</a>
	<a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
	<a href="#"  name="ref3" id="ref3" style="text-decoration:none">DAIRY PRODUCTS</a>
	<a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
	<a href="#"  name="ref4" id="ref4" style="text-decoration:none">ALCOHOLIC BEVERAGES</a>
	</div></td></tr>
	</div></table><hr/>
	<table><b>
	<tr></td>
	<%@page  import="java.sql.*"%>
		<%
		try{
		String user= (String) session.getAttribute("user");
		Class.forName("oracle.jdbc.driver.OracleDriver");
 		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl","tpradhan1","YCsBUo3...uK3Z17");
		String sql = "select distinct ord.order_id,img_path,p.pname,po.quantity,(pp.price*po.quantity) total_amount,TO_CHAR(ord_time,'dd-MM-yyyy HH24:MI') ord_time,Case when Status='P' then 'Pending' when Status='I' then 'In progress' when Status='S' then 'Shipped' when Status='D' then 'Delivered' end Status,Card_number,(ca.add_line1 ||' '|| ca.add_line2||' '|| ca.city||' '||ca.state_code||' '|| ca.zip) Address, case when ord.date_delivered is null then 'NA' else date_delivered end date_delivered  from products p, product_price pp,customer c, customer_address ca, orders ord, prod_orders po  where c.cid= ca.cid and p.pid=pp.pid and ca.state_code= pp.state_code and po.pid = p.pid and po.order_id= ord.order_id and ord.cid=c.cid and ca.aid= ord.aid and lower(UNAME)=? order by order_id";
		PreparedStatement pst = conn.prepareStatement(sql);
		pst.setString(1,user);
		ResultSet rs = pst.executeQuery();
		%>
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
  <th>ORDER_ID</th>
    <th>PRODUCT</th>
    <th>QUANTITY</th>
	<th>AMOUNT</th>
	<th>ORDER_DATE_TIME</th>
	<th>STATUS</th>  
	<th>CARD_NUMBER</th>
	<th>ADDRESS</th>
	<th>DATE_DELIVERED</th>    
  </tr>
	<%
		while(rs.next()){%>
  <tr>
<td><center><font size="5"><b><%=rs.getString("order_id")%></b><font></center>
<td><img width="200" height = "150" src=<%=rs.getString("img_path")%> /><center><p><%=rs.getString("pname") %></center></td>
<td><center><font size="5"><b><%=rs.getString("quantity")%></b></font></center></td>
<td><center><font size="5"><b><p>$ <%=rs.getString("total_amount") %></p></b></font></center></td>
<td><center><font size="5"><b><p><%=rs.getString("ORD_TIME")%></p></b></font></center></td>
<td><center><font size="5"><b><p><%=rs.getString("STATUS") %></p></b></font></center></td>
<td><center><font size="3"><b><p><%=rs.getString("CARD_NUMBER") %></p></b></font></center></td>
<td><center><font size="3"><b><p><%=rs.getString("ADDRESS") %></p></b></font></center></td>
<td><center><font size="3"><b><p><%=rs.getString("DATE_DELIVERED") %></p></b></font></center></td>
</tr>	
		<%
		}%>
		</table>
		<%
		}
		catch(SQLException se){	
		}
		%>

		

</body>
</html>
