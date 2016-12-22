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
th {
    background-color: #4CAF50;
    color: white;
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
		String pid= request.getParameter("id");
		String state= (String) session.getAttribute("state");
		String name= request.getParameter("name");
		Class.forName("oracle.jdbc.driver.OracleDriver");
 		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl","tpradhan1","YCsBUo3...uK3Z17");
		String sqlqty = "SELECT Quantity FROM stock s,products p where s.pid=? and p.pid=s.pid and wid=(select wid from warehouse where state_code=(select state_code from states where lower(state_name)=?))";
		PreparedStatement pstsqlqty = conn.prepareStatement(sqlqty);
	pstsqlqty.setString(1,pid);
	pstsqlqty.setString(2,state);
	ResultSet rspstsqlqty = pstsqlqty.executeQuery();
	while(rspstsqlqty.next()){
		int qty1 = Integer.parseInt(name);
		int qty2 = rspstsqlqty.getInt("Quantity");
		if(qty1>qty2){
			out.print("Entered quantity exceeds stock");
		}
		else
		if(pid!=null)
		{
			String sql4= "Update CART set Quantity=? where CID=(select CID from CUSTOMER where lower(UNAME)=?) and PID=?";
			PreparedStatement pst4 = conn.prepareStatement(sql4);
			pst4.setString(1,name);
			pst4.setString(2,user);
			pst4.setString(3,pid);
			pst4.executeUpdate();
		}
	}
		String sql3 = "select distinct img_path,p.pname pname,quantity,(pp.price*sc.quantity) total_amount,sc.pid pid  from products p, product_price pp,customer c, customer_address ca, cart sc where c.cid= ca.cid and p.pid=pp.pid and ca.state_code= pp.state_code and sc.cid = c.cid and sc.pid= p.pid and sc.cid=c.cid and lower(UNAME)=? and sc.quantity>0";
		String sql4 = "select case when total is null then 0 else total end total from (select sum(total_amount) total from(select distinct img_path,p.pname pname,quantity,(pp.price*sc.quantity) total_amount,sc.pid pid  from products p, product_price pp,customer c, customer_address ca, cart sc where c.cid= ca.cid and p.pid=pp.pid and ca.state_code= pp.state_code and sc.cid = c.cid and sc.pid= p.pid and sc.cid=c.cid and lower(UNAME)=?))";
		String sql5 = "delete from CART where quantity=0";
		PreparedStatement pst = conn.prepareStatement(sql3);
		PreparedStatement pst3 = conn.prepareStatement(sql4);
		PreparedStatement pst5 = conn.prepareStatement(sql5);
		pst5.executeUpdate();
		pst.setString(1,user);
		pst3.setString(1,user);
		ResultSet rs2 = pst.executeQuery();
		ResultSet rs3 = pst3.executeQuery();
		%>
		<%if(rs3.next()){%>
	<div align="right" style="margin-right:60px"> <h1> Total Amount: $<%=rs3.getString("total")%></h1>
	<% if (!(rs3.getString("total").equals("0"))){%>
	<input type="button" value="Check Out" id="check" name="check" onclick="window.location.href='http://localhost:8010/examples/CS425_project/checkout.jsp'"/></div>
	<%}%><table border="1">
		<col width="300">
  <col width="200"><col width="200"><col width="200"><col width="200">
		<tr>
  <th></th>
    <th>Quantity</th>
    <th>Amount</th>
	<th></th>
	<th></th>
  </tr>
		<%
		while(rs2.next()){%>
		<tr><td>
<img width="300" height = "300" src=<%=rs2.getString("img_path")%> />
<center><p><%=rs2.getString("pname") %></center></td>
<td><center><font size="5"><b><input type="number" onkeypress="return onlyNumbers()" maxlength="3" value="<%=rs2.getString("quantity")%>" id="qty<%=rs2.getString("quantity")%>"></b></font></center></td>
<td><center><font size="5"><b><p>$ <%=rs2.getString("total_amount") %></p></b></font></center></td>
<td><center><a href="javascript:if(document.getElementById('qty<%=rs2.getString("quantity")%>').value!=''){window.location.href='cart_view.jsp?id=<%=rs2.getString("pid")%>' + '&name=' + document.getElementById('qty<%=rs2.getString("quantity")%>').value}">Update</a></center></td>
<td><center><a href="deletecart.jsp?PID=<%=rs2.getString("pid")%>"> Delete </a></center></td></tr>
<input type="hidden" id="status<%=rs2.getString("pid")%>" style="visibility:hidden"/>
<%
		}%>
</table>	
		<%
		}
		}
		
		catch(SQLException se){	
		}
		%>

		

</body>
</html>
