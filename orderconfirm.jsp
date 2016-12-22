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
	</form>
<%@page  import="java.sql.*"%>
<% 
//try{
String user=(String) session.getAttribute("user");
String pname=(String)session.getAttribute("pname");
String state=(String)session.getAttribute("state");
String Zip=request.getParameter("Zip");
String card=request.getParameter("card");
String exp_dt=request.getParameter("exp_dt");
String AL1=request.getParameter("AL1");
String AL2=request.getParameter("AL2");
String City=request.getParameter("City");
String check_card=request.getParameter("check_card");
String aid=request.getParameter("check_add");
String save_card=request.getParameter("check");
String BILLAL1=request.getParameter("BILLAL1");
String BILLAL2=request.getParameter("BILLAL2");
String BILLZip=request.getParameter("BILLZip");
String BILLCity=request.getParameter("BILLCity");
Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl","tpradhan1","YCsBUo3...uK3Z17");
String cid="select distinct customer.cid cid,customer_address.state_code state_code from customer,states, customer_address where customer.cid = customer_address.cid and customer_address.state_code=states.state_code and lower(UNAME)=?";
PreparedStatement pstcid = conn.prepareStatement(cid);
pstcid.setString(1,user);
ResultSet rscid = pstcid.executeQuery();
String rescid="";
String rsstate="";
if(rscid.next()){
	rescid=rscid.getString("cid");
	rsstate=rscid.getString("state_code");
}

if(aid==null){
	int j=0;
	 Statement st2 = conn.createStatement();
	 Statement st3 = conn.createStatement();
	  ResultSet rs1 = st2.executeQuery("select AID from CUSTOMER_ADDRESS order by AID");
	  while(rs1.next()){
			j= rs1.getInt("AID");
		 }
	  aid=Integer.toString(j+1);
	  st2.executeUpdate("Insert into CUSTOMER_ADDRESS values(" + "'" + aid +"'" +","+ "'" + rescid +"'" +","+"'"+AL1+"'"+","+"'"+AL2+"'"+","+"'"+City+"'"+","+"'"+ rsstate +"'"+","+"'"+Zip+"'"+")" );
	 
	  }
	  if(save_card!=null){
		  int j=0;
	 Statement st4 = conn.createStatement();
	  ResultSet rs1 = st4.executeQuery("select AID from CUSTOMER_ADDRESS order by AID");
	  while(rs1.next()){
			j= rs1.getInt("AID");
		 }
	String billaid=Integer.toString(j+2);
	Statement st2 = conn.createStatement();
	 st2.executeUpdate("Insert into CUSTOMER_ADDRESS values(" + "'" + billaid +"'" +","+ "'" + rescid +"'" +","+"'"+BILLAL1+"'"+","+"'"+BILLAL2+"'"+","+"'"+BILLCity+"'"+","+"'"+ rsstate +"'"+","+"'"+BILLZip+"'"+")" );
	String savecard="Insert into card_info values(?,?,?,?)";
	PreparedStatement savecardpst = conn.prepareStatement(savecard);
	savecardpst.setString(1,card);
	savecardpst.setString(2,exp_dt);
	savecardpst.setString(3,rescid);
	savecardpst.setString(4,billaid);
	savecardpst.executeUpdate();
	}
String cartsql = "Select PID,CID from CART where CID = (select CID from Customer where lower(UNAME)=?)";
PreparedStatement cartsqlpst = conn.prepareStatement(cartsql);
cartsqlpst.setString(1, user);
ResultSet rscartsqlpst = cartsqlpst.executeQuery();
Statement ordst = conn.createStatement();
String ordsql = "SELECT ORDER_ID FROM ORDERS order by ORDER_ID";
ResultSet rsordst = ordst.executeQuery(ordsql);
int x=0;
while(rsordst.next()){
	x = rsordst.getInt("ORDER_ID");
 }	 
String sqlorder = "Insert into Orders values (?,?,?,0,?,CURRENT_TIMESTAMP,Current_date,null,'P')";
PreparedStatement sqlorderpst = conn.prepareStatement(sqlorder);
sqlorderpst.setInt(1,x+1);
sqlorderpst.setString(2, rescid);
if(card!=""){
sqlorderpst.setString(3, card);
}else {
	sqlorderpst.setString(3, check_card);
}
sqlorderpst.setString(4, aid);
sqlorderpst.executeUpdate();
String prodorder="Insert into prod_orders Select ?,PID,quantity from CART where CID = (select CID from Customer where lower(UNAME)=?)";
PreparedStatement prodorderpst = conn.prepareStatement(prodorder);
prodorderpst.setInt(1,x+1);
prodorderpst.setString(2, user);
prodorderpst.executeUpdate();
String selcart = "Select PID,CID from CART where CID = (select CID from Customer where lower(UNAME)=?)";
PreparedStatement selcartpst = conn.prepareStatement(selcart);
selcartpst.setString(1,user);
ResultSet rsselcart = selcartpst.executeQuery();
while(rsselcart.next()){
String redstock = "Update stock set quantity=(quantity-(select quantity from CART where pid=? and cid=? )) where pid = ? and WID =(select wid from warehouse where state_code=(select state_code from states where lower(state_name)=?))";
PreparedStatement redstockpst = conn.prepareStatement(redstock);
redstockpst.setString(1,rsselcart.getString("PID"));
redstockpst.setString(2,rsselcart.getString("CID"));
redstockpst.setString(3,rsselcart.getString("PID"));
redstockpst.setString(4,state);
redstockpst.executeUpdate();
}
String deletecart="delete from CART where CID = (select CID from Customer where lower(UNAME)=?)";
PreparedStatement deletecartpst = conn.prepareStatement(deletecart);
deletecartpst.setString(1, user);
deletecartpst.executeUpdate();



%>
<center><h1> Your order has been placed</h1><br/><br/><br/>
<button type="button" onclick="window.location.href='http://localhost:8010/examples/CS425_project/orders.jsp'"> View Orders </button>
</center>
<%
//}catch(SQLException se){
	//out.print("Card details are already present...Please checkout again");
//}
%>


</body>
</html>	
	
	
	
	
	