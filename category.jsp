<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<title> GreenGrocer Welcomes you </title>
 <script type="text/javascript" src="jquery.js"></script>
  <script type="text/javascript" src="javascripts.jsp"></script>
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
	<a href="category.jsp"><img src = "images/logos.png" align = "left" width="200" height = "150" style="margin-left:30px;margin-top:30px"  /></a>
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
	</form>
<%
String searched = request.getParameter("prodsearch");
%>
<center><input type="text"  placeholder="Search product" onkeypress="return AlphaNumeric()" id="productsearch" name="productsearch" maxlength="10" />
<font size="4"><a href= "javascript:if(
 document.getElementById('productsearch').value!='') {
window.location.href='category.jsp?prodsearch=' + document.getElementById('productsearch').value }">Search</a></font></center>

		<%@page  import="java.sql.*"%>
<% 

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl","tpradhan1","YCsBUo3...uK3Z17");
if(searched!=null && searched!="")
{
String sel2=request.getParameter("sel");
String states = "";
String sel = "";
String sql3 = "select pname,img_path,Price,p.pid PID from products p,product_price pp,states s where p.pid=pp.pid and pp.state_code=s.state_code and lower(state_name)=? and lower(PNAME) like ?";
PreparedStatement pst = conn.prepareStatement(sql3);
PreparedStatement pst4 = conn.prepareStatement(sql3);
if (sel2!=null){
sel=sel2.toLowerCase();
session.setAttribute("state",sel);
 pst.setString(1,sel);
 pst4.setString(1,sel);
 out.print(sel);
}else {
	states=(String)session.getAttribute("state");
	pst.setString(1,states);
	pst4.setString(1,states);
	}
searched = searched.toLowerCase();
pst.setString(2, "%" +searched+ "%");
pst4.setString(2, "%" +searched+ "%");
ResultSet rs2 = pst.executeQuery();
ResultSet rs3 = pst4.executeQuery();
	if(!rs2.next())
		  out.print("No such product available");
	  else
	while(rs3.next()){
		%>
		<form action="prod_detail.jsp" id="searchProd" method="post">
<div class="floated_img"><a href="prod_detail.jsp?id=<%=rs3.getString("pname")%>" onclick="document.forms.searchProd.submit();">
<img src=<%=rs3.getString("img_path")%> width="300" height = "200" style="margin-left:50px;margin-top:50px"/></a>
<center><p style="margin-left:50px;margin-top:50px"> <%out.print(rs3.getString("pname"));%></p>
<p style="margin-left:50px"> Price: $<%=rs3.getString("Price")%></p></center></div>
</form>
          <%   }
		  
searched="";
}

else{

String sel2=request.getParameter("sel");
String states = "";
String sel = "";
String sql3 = "select pname,img_path,Price,p.pid PID from products p,product_price pp,states s where p.pid=pp.pid and pp.state_code=s.state_code and lower(state_name)=?";
PreparedStatement pst = conn.prepareStatement(sql3);
if (sel2!=null){
sel=sel2.toLowerCase();
session.setAttribute("state",sel);
 pst.setString(1,sel);
}else {
	states=(String)session.getAttribute("state");
	pst.setString(1,states);
}
 ResultSet rs2 = pst.executeQuery();
try{
	
	while(rs2.next()){
	out.print(
			"<form action=\"prod_detail.jsp\" id=\"searchProd\" method=\"post\"><div class=\"floated_img\"><a href=\"prod_detail.jsp?id=" +rs2.getString("pname")+ "\"onclick=\"document.forms.searchProd.submit();\" name=\"prod" + rs2.getInt("PID") + "\" id=\"prod" + rs2.getString("PID") + "\"><img src=\"" + rs2.getString("img_path") + "\"width=\"300\" height = \"200\" style=\"margin-left:50px;margin-top:50px\"/></a><center><p style=\"margin-left:50px;margin-top:50px\">" + rs2.getString("pname") + "</p><p style=\"margin-left:50px\"> Price: $" + rs2.getString("Price") + "</p></center></div>");

			}
}catch (SQLException e){
}
}

%>
</body>
</html>
		