<html>
<head>
<title> GreenGrocer Welcomes you </title>
 <script type="text/javascript" src="jquery.js"></script>
  <script type="text/javascript" src="javascripts.jsp"></script>
<%
%>
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
</head>
 

 <link rel="stylesheet" href="style.css">
<body>
<style>
.floated_img
{
    float: left;
}
</style>
<%if(session.getAttribute("state")==null){
			String redirectURL = "http://localhost:8010/examples/CS425_project/main.jsp";
response.sendRedirect(redirectURL);}
			%>
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
	<tr><td>
	<%@page  import="java.sql.*"%>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl","tpradhan1","YCsBUo3...uK3Z17");
String state=(String)session.getAttribute("state");
String pname= request.getParameter("id");
String sql3 = "select pname,img_path,Price,p.pid PID,details from products p,product_price pp,states s where p.pid=pp.pid and pp.state_code=s.state_code and lower(state_name)=? and pname=?";
PreparedStatement pst = conn.prepareStatement(sql3);
pst.setString(1,state);
pst.setString(2,pname);
ResultSet rs2 = pst.executeQuery();
String checkavail = "select quantity from stock st,products p, product_price pp,states s,warehouse w where st.pid= p.pid and pp.pid= p.pid and pp.state_code= s.state_code and w.state_code=s.state_code and w.wid=st.wid and pname=? and lower(state_name)=?";
PreparedStatement availpst=conn.prepareStatement(checkavail);
availpst.setString(1,pname);
availpst.setString(2,state);
ResultSet rsavail = availpst.executeQuery();
try{	
	while(rs2.next()){
		%>
		<div class="floated_img">
	<img src=<%=rs2.getString("img_path")%> width="500" height = "300" style="margin-left:50px;margin-top:50px"/>
</div>
<div style="margin-top:100px;display:inline-block;margin-left:30px">
<font size="6"><%out.print(rs2.getString("pname"));%></font><br/><br/>
<a ><font size="5"> Details:</font></a><br/><br/>
<%
String details=rs2.getString("details");
details=details.replaceAll(",", "<p>");
out.print(details);%></div>
<div style="margin-left:100px:margin-top:100px;display:inline-block"><center>

<h2>In stock : <%if(rsavail.next()) out.print(rsavail.getString("quantity"));%><h2><br/>
<h1><%out.print("Price: $");
session.setAttribute("pname",pname);
session.setAttribute("price",rs2.getString("Price"));
	out.print(rs2.getString("Price"));%></h1><a class="floated_img" style="margin-left:100px"> Type in Quantity: </a><br/>
	<input type="number"required maxlength="3" name="quantity" id="quantity" onkeypress="return onlyNumbers()" style="margin-left:100px">
<% if(session.getAttribute("user")==null) { %>
<input type="button" id="cart" name="cart" value="Add to Cart" onclick="window.location.href='login.jsp'">
<%
}
else{
%>
<input type="button" id="cart" name="cart" value="Add to Cart" ><div id = "statuse"></div>
 <script type="text/javascript" src="chk_cart.js"></script>  
	<%}%>
</div>
</center>
</td></tr>
</table>
		<%
	}
}
catch (SQLException e){
}
%>
</body>
</html>

	