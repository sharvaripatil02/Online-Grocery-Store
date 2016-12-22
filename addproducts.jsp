<html>
<head>
<title> GreenGrocer Welcomes you </title>
 <script type="text/javascript" src="jquery.js"></script>
  <script type="text/javascript" src="javascripts.jsp"></script>
</head>
 <link rel="stylesheet" href="style.css">
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
	
	<center>
	<form action="addproductsdb.jsp" method="GET">
	<table><b>
	<br/><br/><tr><td></td></tr> 
<tr><td><font size="4"><b>Product Name:&nbsp;&nbsp; <input type="text" maxlength="19" onkeypress="return onlyAlphabetssp()" name="PNAME" id="PNAME"></b></font></td></tr>
<tr><td><font size="4"><b>Product Type:&nbsp;&nbsp;&nbsp; <input type="text" maxlength="19" onkeypress="return onlyAlphabetssp()" name="PTYPE" id="PTYPE"></b></font></td></tr>
<tr><td><font size="4"><b>Product Details&nbsp; <textarea rows="4" cols="40" maxlength="990" name="DETAILS" id="DETAILS"></textarea></b></font></td></tr>
<tr><td><font size="4"><b>Product Price:&nbsp;&nbsp;&nbsp;<input type="text" maxlength="10" onkeypress="return myPrice()" id="PRICE" name="PRICE"></b></font></td></tr>
<tr><td><font size="4"><b>Product Size: &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" onkeypress="return onlyNumbers()" maxlength="5" id="PSIZE" name="PSIZE"></b></font></td></tr>
<tr><td><font size="4"><b>Image Path:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="text" onkeypress="return img()" maxlength="199" id="IMG_PATH" name="IMG_PATH"></b></font></td></tr>
<tr><td><b><input type="submit" value="ADD PRODUCT"></b></font></td></tr>
</table></form>	
	</center>
	
</body>
</html>