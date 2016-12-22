<html>
<head>
<title> GreenGrocer Welcomes you </title>
 <script type="text/javascript" src="jquery.js"></script>
  <script type="text/javascript" src="javascripts.jsp"></script>
</head>
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
	</form> 
	<form action="orderconfirm.jsp" id="order" method="post"><table>
	<%@page  import="java.sql.*"%>
	<%
	try{
		String user= (String) session.getAttribute("user");
		Class.forName("oracle.jdbc.driver.OracleDriver");
 		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl","tpradhan1","YCsBUo3...uK3Z17");
		String sql = "select Card_no from card_info where CID=(select CID from Customer where lower(UNAME)=?)";
		String sql3 = "select AID,(ADD_LINE1||' '||ADD_LINE2||' '||CITY||' '||STATE_CODE||' '||ZIP ) Address from customer_address where CID=(SELECT cid FROM CUSTOMER WHERE lower(UNAME)=?) and AID not in (select case when aid is null then 0 else aid end aid from card_info where CID =(SELECT cid FROM CUSTOMER WHERE lower(UNAME)=?))";
		String sql2 = "select case when total is null then 0 else total end total from (select sum(total_amount) total from(select distinct img_path,p.pname pname,quantity,(pp.price*sc.quantity) total_amount,sc.pid pid  from products p, product_price pp,customer c, customer_address ca, cart sc where c.cid= ca.cid and p.pid=pp.pid and ca.state_code= pp.state_code and sc.cid = c.cid and sc.pid= p.pid and sc.cid=c.cid and lower(UNAME)=?))";
		PreparedStatement pst = conn.prepareStatement(sql);
		PreparedStatement pst2 = conn.prepareStatement(sql2);
		PreparedStatement pst3 = conn.prepareStatement(sql3);
		pst.setString(1,user);
		pst2.setString(1,user);
		pst3.setString(1,user);
		pst3.setString(2,user);
		ResultSet rs = pst.executeQuery();
		ResultSet rs2 = pst2.executeQuery();
		ResultSet rs3 = pst3.executeQuery();
	while(rs2.next()){
	%>
	<div align="right" style="margin-right:60px"> <h1> Total Amount: $<%out.print(rs2.getString("total"));}%></h1></div>
	<tr><td><input type="text"required placeholder="Card No"  name="card" id="card" pattern=".{16,}" title="Invalid Card No" onkeypress="return onlyNumbers()" maxlength="16" >
	<input type="text"required id="exp_dt" name="exp_dt" placeholder="Expiry Date MMYYYY" onkeypress="return onlyNumbers()" maxlength="6" >
	<input type="text"required id="cvv" name="cvv" placeholder="CVV" pattern=".{3,}" title="Invalid CVV" onkeypress="return onlyNumbers()" maxlength="3" ><input type="checkbox" id="check" name="check"><b> Save this card </b></td></tr>
	<tr><td><input type="text"required placeholder="Address Line1" onkeypress="return AlphaNumericSp()"  name="AL1" id="AL1" maxlength="49">
<input type="text"required  placeholder="Address Line2" onkeypress="return AlphaNumericSp()"  name="AL2" id="AL2" maxlength="49">  
<input type="text"required onkeypress="return onlyAlphabets()"  placeholder="City" name="City" id="City" maxlength="19">
<input type="text"required placeholder="Zip" id="Zip" name="Zip"  pattern=".{5,}" title="XXXXX - Invalid Zip" onkeypress="return onlyNumbers()" maxlength="5" ></td></tr> 

<tr><td><br/><b>BILLING ADDRESS</b></tr></td>
<tr><td><input type="text"required placeholder="Address Line1" onkeypress="return AlphaNumericSp()"  name="BILLAL1" id="BILLAL1" maxlength="49">
<input type="text"required  placeholder="Address Line2" onkeypress="return AlphaNumericSp()"  name="BILLAL2" id="BILLAL2" maxlength="49">  
<input type="text"required onkeypress="return onlyAlphabets()"  placeholder="City" name="BILLCity" id="BILLCity" maxlength="19">
<input type="text"required placeholder="Zip" id="BILLZip" name="BILLZip"  pattern=".{5,}" title="XXXXX - Invalid Zip" onkeypress="return onlyNumbers()" maxlength="5" ></td></tr> 


	<tr><td><a><b><font size="4">Saved Cards</font></b></a><br/></td></tr>
	<%
	while(rs.next()){
		%>
	<tr><td><input type="radio" id="check_card" name="check_card" value="<%out.print(rs.getString("card_no"));%>" /><b> <%out.print(rs.getString("card_no"));}%> </b>
	</td></tr><tr><td><input type="text"required placeholder="CVV" pattern=".{3,}" title="Invalid CVV" onkeypress="return onlyNumbers()" maxlength="3" name="cvv_saved" id="cvv_saved" ></td></tr>
	<tr><td><br/><br/><a><b><font size="4">Select Shipping Address</font></b></a><br/><br/></td></tr>
	<%
	
	while (rs3.next()){
		%>
		<tr><td><input type="radio" id="check_add" name="check_add" value="<%out.print(rs3.getString("AID"));%>" /> <b><%out.print(rs3.getString("Address"));%></b> </td></tr>
	<%
	}
	}catch(SQLException se){
		
	}
	%>

	<tr><td><input type="button" value="Place Order" onclick="myFunction()" style="margin-top:50px" />
	<input type="button" value="View/Update Order" onclick="window.location.href='cart_view.jsp'" style="margin-top:50px" />
	<input type="button" value="Reset" onclick="window.location.href='checkout.jsp'" style="margin-top:50px" />
	</td><div id="error"></div></tr>
	</form>
</body>
</html>
 