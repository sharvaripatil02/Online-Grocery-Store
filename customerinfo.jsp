<html>
<head>
<title> GreenGrocer Welcomes you </title>
 <script type="text/javascript" src="jquery.js"></script>
  <script type="text/javascript" src="javascripts.jsp"></script>
</head>
 <link rel="stylesheet" href="customer.css">
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
String user = (String)session.getAttribute("user");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl","tpradhan1","YCsBUo3...uK3Z17");
String FNAME= request.getParameter("FNAME");
String LNAME= request.getParameter("LNAME");
String EMAIL_ID= request.getParameter("EMAIL_ID");
String PSWD= request.getParameter("PSWD");
String AL1= request.getParameter("AL1");
String AL2= request.getParameter("AL2");
String CITY= request.getParameter("CITY");
String STATE= request.getParameter("STATE");
String ZIP= request.getParameter("ZIP");
String BILLAL1= request.getParameter("BILLAL1");
String BILLAL2= request.getParameter("BILLAL2");
String BILLCITY= request.getParameter("BILLCITY");
String BILLZIP= request.getParameter("BILLZIP");
String PHONE= request.getParameter("PHONE");
String CARD= request.getParameter("CARD");
String EXP_DT= request.getParameter("EXP_DT");
String AID= request.getParameter("AID");
String BILLAID= request.getParameter("BILLAID");
if(FNAME!=null)
		{
			String name= request.getParameter("name");
			String sql4= "Update CUSTOMER set FNAME=? where lower(UNAME)=?";
			PreparedStatement pst4 = conn.prepareStatement(sql4);
			pst4.setString(1,FNAME);
			pst4.setString(2,user);
			pst4.executeUpdate();
		}
		if(LNAME!=null)
		{
			String name= request.getParameter("name");
			String sql4= "Update CUSTOMER set LNAME=? where lower(UNAME)=?";
			PreparedStatement pst4 = conn.prepareStatement(sql4);
			pst4.setString(1,LNAME);
			pst4.setString(2,user);
			pst4.executeUpdate();
		}
		if(EMAIL_ID!=null)
		{
			String name= request.getParameter("name");
			String sql4= "Update CUSTOMER set EMAIL_ID=? where lower(UNAME)=?";
			PreparedStatement pst4 = conn.prepareStatement(sql4);
			pst4.setString(1,EMAIL_ID);
			pst4.setString(2,user);
			pst4.executeUpdate();
		}
		if(PSWD!=null)
		{
			String name= request.getParameter("name");
			String sql4= "Update CUSTOMER set PSWD=? where lower(UNAME)=?";
			PreparedStatement pst4 = conn.prepareStatement(sql4);
			pst4.setString(1,PSWD);
			pst4.setString(2,user);
			pst4.executeUpdate();
		}
		if(AL1!=null)
		{
			String name= request.getParameter("name");
			String sql4= "Update CUSTOMER_ADDRESS set ADD_LINE1=? where CID=(SELECT cid FROM CUSTOMER WHERE lower(UNAME)=?) and AID=?";
			PreparedStatement pst4 = conn.prepareStatement(sql4);
			pst4.setString(1,AL1);
			pst4.setString(2,user);
			pst4.setString(3,AID);
			pst4.executeUpdate();
		}
		if(AL2!=null)
		{
			String name= request.getParameter("name");
			String sql4= "Update CUSTOMER_ADDRESS set ADD_LINE2=? where CID=(SELECT cid FROM CUSTOMER WHERE lower(UNAME)=?) and AID=?";
			PreparedStatement pst4 = conn.prepareStatement(sql4);
			pst4.setString(1,AL2);
			pst4.setString(2,user);
			pst4.setString(3,AID);
			pst4.executeUpdate();
		}
		if(CITY!=null)
		{
			String name= request.getParameter("name");
			String sql4= "Update CUSTOMER_ADDRESS set CITY=? where CID=(SELECT cid FROM CUSTOMER WHERE lower(UNAME)=?) and AID=?";
			PreparedStatement pst4 = conn.prepareStatement(sql4);
			pst4.setString(1,CITY);
			pst4.setString(2,user);
			pst4.setString(3,AID);
			pst4.executeUpdate();
		}
		if(ZIP!=null)
		{
			String name= request.getParameter("name");
			String sql4= "Update CUSTOMER_ADDRESS set ZIP=? where CID=(SELECT cid FROM CUSTOMER WHERE lower(UNAME)=?) and AID=?";
			PreparedStatement pst4 = conn.prepareStatement(sql4);
			pst4.setString(1,ZIP);
			pst4.setString(2,user);
			pst4.setString(3,AID);
			pst4.executeUpdate();
		}
		if(PHONE!=null)
		{
			String name= request.getParameter("name");
			String sql4= "Update phone set phone_no=? where CID=(SELECT cid FROM CUSTOMER WHERE lower(UNAME)=?)";
			PreparedStatement pst4 = conn.prepareStatement(sql4);
			pst4.setString(1,PHONE);
			pst4.setString(2,user);
			pst4.executeUpdate();
		}
		if(CARD!=null)
		{
			String name= request.getParameter("name");
			String sql4= "Update card_info set CARD_NO=? where CID=(SELECT cid FROM CUSTOMER WHERE lower(UNAME)=?)";
			PreparedStatement pst4 = conn.prepareStatement(sql4);
			pst4.setString(1,CARD);
			pst4.setString(2,user);
			pst4.executeUpdate();
		}
		if(EXP_DT!=null)
		{
			String name= request.getParameter("name");
			String sql4= "Update card_info set EXP_DATE=? where CID=(SELECT cid FROM CUSTOMER WHERE lower(UNAME)=?)";
			PreparedStatement pst4 = conn.prepareStatement(sql4);
			pst4.setString(1,EXP_DT);
			pst4.setString(2,user);
			pst4.executeUpdate();
		}
		if(BILLAL1!=null)
		{
			String name= request.getParameter("name");
			String sql4= "Update CUSTOMER_ADDRESS set ADD_LINE1=? where CID=(SELECT cid FROM CUSTOMER WHERE lower(UNAME)=?) and AID=?";
			PreparedStatement pst4 = conn.prepareStatement(sql4);
			pst4.setString(1,BILLAL1);
			pst4.setString(2,user);
			pst4.setString(3,BILLAID);
			pst4.executeUpdate();
		}
		if(BILLAL2!=null)
		{
			String name= request.getParameter("name");
			String sql4= "Update CUSTOMER_ADDRESS set ADD_LINE2=? where CID=(SELECT cid FROM CUSTOMER WHERE lower(UNAME)=?) and AID=?";
			PreparedStatement pst4 = conn.prepareStatement(sql4);
			pst4.setString(1,BILLAL2);
			pst4.setString(2,user);
			pst4.setString(3,BILLAID);
			pst4.executeUpdate();
		}
		if(BILLCITY!=null)
		{
			String name= request.getParameter("name");
			String sql4= "Update CUSTOMER_ADDRESS set CITY=? where CID=(SELECT cid FROM CUSTOMER WHERE lower(UNAME)=?) and AID=?";
			PreparedStatement pst4 = conn.prepareStatement(sql4);
			pst4.setString(1,BILLCITY);
			pst4.setString(2,user);
			pst4.setString(3,BILLAID);
			pst4.executeUpdate();
		}
		if(BILLZIP!=null)
		{
			String name= request.getParameter("name");
			String sql4= "Update CUSTOMER_ADDRESS set ZIP=? where CID=(SELECT cid FROM CUSTOMER WHERE lower(UNAME)=?) and AID=?";
			PreparedStatement pst4 = conn.prepareStatement(sql4);
			pst4.setString(1,BILLZIP);
			pst4.setString(2,user);
			pst4.setString(3,BILLAID);
			pst4.executeUpdate();
		}
String sqlcard = "Select card_no,exp_date,cid from card_info where CID=(SELECT cid FROM CUSTOMER WHERE lower(UNAME)=?)";
String sqlphone = "Select phone_no from phone where CID=(SELECT cid FROM CUSTOMER WHERE lower(UNAME)=?)";
String sqladd = "Select ADD_LINE1,ADD_LINE2,CITY,ZIP,AID from customer_address where CID=(SELECT cid FROM CUSTOMER WHERE lower(UNAME)=?) and AID not in (select case when aid is null then 0 else aid end aid from card_info where CID =(SELECT cid FROM CUSTOMER WHERE lower(UNAME)=?))";
String sqlbill = "Select ADD_LINE1,ADD_LINE2,CITY,ZIP,AID from customer_address where CID=(SELECT cid FROM CUSTOMER WHERE lower(UNAME)=?) and AID in (select aid from card_info where CID =(SELECT cid FROM CUSTOMER WHERE lower(UNAME)=?) )";
String sqlcust = "Select FNAME,LNAME,EMAIL_ID,UNAME,PSWD, WALLET_AMT from CUSTOMER where lower(UNAME)=?";
String sqlstate = "Select STATE_CODE from states where state_code not in ('XX')";
PreparedStatement pstsqlcust = conn.prepareStatement(sqlcust);
PreparedStatement pstsqlcard = conn.prepareStatement(sqlcard);
PreparedStatement pstsqlphone = conn.prepareStatement(sqlphone);
PreparedStatement pstsqladd = conn.prepareStatement(sqladd);
PreparedStatement pstsqlstate = conn.prepareStatement(sqlstate);
PreparedStatement pstsqlbill = conn.prepareStatement(sqlbill);
pstsqlcust.setString(1,user);
pstsqlcard.setString(1,user);
pstsqlphone.setString(1,user);
pstsqladd.setString(1,user);
pstsqladd.setString(2,user);
pstsqlbill.setString(1,user);
pstsqlbill.setString(2,user);
ResultSet rspstsqlcust = pstsqlcust.executeQuery();
ResultSet rspstsqlcard = pstsqlcard.executeQuery();
ResultSet rspstsqlphone = pstsqlphone.executeQuery();
ResultSet rspstsqladd = pstsqladd.executeQuery();
ResultSet rstpstsqlbill = pstsqlbill.executeQuery();
while(rspstsqlcust.next()){%>
		<table><tr>
<td><font size="4"><b>First Name: <input type="text"required onkeypress="return onlyAlphabets()" maxlength="19" onkeypress="return onlyAlphabets()" value="<%=rspstsqlcust.getString("FNAME")%>" id="qty<%=rspstsqlcust.getString("FNAME")%>" /></b></font></center></td>

<td><font size="4"><b>Last Name : <input  type="text"required  onkeypress="return onlyAlphabets()" maxlength="19" value="<%=rspstsqlcust.getString("LNAME")%>" id="qty<%=rspstsqlcust.getString("LNAME")%>" /></b></font></center></td>

<td><font size="4"><b>Email Id  : <input type="email"required  pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" title="abc@xyz.com" maxlength="49" value="<%=rspstsqlcust.getString("EMAIL_ID")%>" id="qty<%=rspstsqlcust.getString("EMAIL_ID")%>" /></b></font></center></td>

<td><font size="4"><b>Password  : <input type="password"required pattern=".{6,}" title="Password must have atleast 6 characters" onkeypress="return PasswordChk()" name="password"  maxlength="32" value="<%=rspstsqlcust.getString("PSWD")%>" id="qty<%=rspstsqlcust.getString("PSWD")%>" /></b></font></center></td>
<td><font size="4"><b>Wallet Amt  : <%=rspstsqlcust.getString("WALLET_AMT")%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b></font></center></td>
<td><center><a href="javascript:if(document.getElementById('qty<%=rspstsqlcust.getString("PSWD")%>').value!='' || document.getElementById('qty<%=rspstsqlcust.getString("FNAME")%>').value!='' || document.getElementById('qty<%=rspstsqlcust.getString("LNAME")%>').value!='' || document.getElementById('qty<%=rspstsqlcust.getString("EMAIL_ID")%>').value!='' )
{window.location.href='customerinfo.jsp?PSWD=' + document.getElementById('qty<%=rspstsqlcust.getString("PSWD")%>').value 
+ '&FNAME=' + document.getElementById('qty<%=rspstsqlcust.getString("FNAME")%>').value  + '&LNAME=' + document.getElementById('qty<%=rspstsqlcust.getString("LNAME")%>').value 
+ '&EMAIL_ID=' + document.getElementById('qty<%=rspstsqlcust.getString("EMAIL_ID")%>').value }">Update</a></center></td></tr>
</table><br/><br/>

<table>
<tr><td/>
<b>ADDRESS:</b><br/>
<%} 
while(rspstsqladd.next()){
%>
<font size="4"><b>Address Line 1: <input type="text"required onkeypress="return AlphaNumericSp()" maxlength="49" value="<%=rspstsqladd.getString("ADD_LINE1")%>" id="qty<%=rspstsqladd.getString("ADD_LINE1")%>" /></b></font>
<font size="4"><b>Address Line 2: <input type="text"required  onkeypress="return AlphaNumericSp()"  maxlength="49" value="<%=rspstsqladd.getString("ADD_LINE2")%>" id="qty<%=rspstsqladd.getString("ADD_LINE2")%>" /></b></font></center>
<font size="4"><b>City   : <input  type="text"required onkeypress="return onlyAlphabets()" name="City" maxlength="19" value="<%=rspstsqladd.getString("CITY")%>" id="qty<%=rspstsqladd.getString("CITY")%>" /></b></font></center>
<font size="4"><b>ZIP   : <input type="text"required  name="Zip"  pattern=".{5,}" title="XXXXX - Invalid Zip" onkeypress="return onlyNumbers()" maxlength="5" value="<%=rspstsqladd.getString("ZIP")%>" id="qty<%=rspstsqladd.getString("ZIP")%>" /></b></font></center>
<a href="javascript:if(document.getElementById('qty<%=rspstsqladd.getString("ADD_LINE1")%>').value!='' || document.getElementById('qty<%=rspstsqladd.getString("ADD_LINE2")%>').value!='' ||
 document.getElementById('qty<%=rspstsqladd.getString("CITY")%>').value!='' || document.getElementById('qty<%=rspstsqladd.getString("ZIP")%>').value!='' && document.getElementById('qty<%=rspstsqladd.getString("ZIP")%>').value.length==5 )
{window.location.href='customerinfo.jsp?ZIP=' + document.getElementById('qty<%=rspstsqladd.getString("ZIP")%>').value 
+ '&CITY=' + document.getElementById('qty<%=rspstsqladd.getString("CITY")%>').value  + '&AL1=' + document.getElementById('qty<%=rspstsqladd.getString("ADD_LINE1")%>').value 
+ '&AL2=' + document.getElementById('qty<%=rspstsqladd.getString("ADD_LINE2")%>').value + '&AID=' + document.getElementById('<%=rspstsqladd.getString("AID")%>').value }">Update</a>
<input type="hidden" id="<%=rspstsqladd.getString("AID")%>" value="<%=rspstsqladd.getString("AID")%>" style="visibility:hidden"/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="deleteaddress.jsp?AID=<%=rspstsqladd.getString("AID")%>"> Delete </a></table>
<br/>
<%} 
while(rspstsqlphone.next()){
%>

<table>
<td><font size="4"><b>Phone: <input type="text"required pattern=".{10,}" title="XXXXXXXXXX - Phone must be 10 Digit"  maxlength="10" onkeypress="return onlyNumbers()" value="<%=rspstsqlphone.getString("phone_no")%>" id="qty<%=rspstsqlphone.getString("phone_no")%>" /></b></font></center></td>
<td><center><a href="javascript:if(document.getElementById('qty<%=rspstsqlphone.getString("phone_no")%>').value!='' &&
document.getElementById('qty<%=rspstsqlphone.getString("phone_no")%>').value.length==10
){window.location.href='customerinfo.jsp?PHONE=' + document.getElementById('qty<%=rspstsqlphone.getString("phone_no")%>').value}" >Update</a></center></td></tr>
</table><br/><br/>
<%} 
while(rstpstsqlbill.next()){%>
<tr><td/>
BILLING ADDRESS:<br/>
<font size="4"><b>Address Line 1: <input type="text"required onkeypress="return AlphaNumericSp()" maxlength="49" value="<%=rstpstsqlbill.getString("ADD_LINE1")%>" id="qty<%=rstpstsqlbill.getString("ADD_LINE1")%>" /></b></font>
<font size="4"><b>Address Line 2: <input type="text"required  onkeypress="return AlphaNumericSp()"  maxlength="49" value="<%=rstpstsqlbill.getString("ADD_LINE2")%>" id="qty<%=rstpstsqlbill.getString("ADD_LINE2")%>" /></b></font></center>
<font size="4"><b>City   : <input  type="text"required onkeypress="return onlyAlphabets()" name="City" maxlength="19" value="<%=rstpstsqlbill.getString("CITY")%>" id="qty<%=rstpstsqlbill.getString("CITY")%>" /></b></font></center>
<font size="4"><b>ZIP   : <input type="text"required  name="Zip"  pattern=".{5,}" title="XXXXX - Invalid Zip" onkeypress="return onlyNumbers()" maxlength="5" value="<%=rstpstsqlbill.getString("ZIP")%>" id="qty<%=rstpstsqlbill.getString("ZIP")%>" /></b></font></center>
<a href="javascript:if(document.getElementById('qty<%=rstpstsqlbill.getString("ADD_LINE1")%>').value!='' || document.getElementById('qty<%=rstpstsqlbill.getString("ADD_LINE2")%>').value!='' ||
 document.getElementById('qty<%=rstpstsqlbill.getString("CITY")%>').value!='' || document.getElementById('qty<%=rstpstsqlbill.getString("ZIP")%>').value!='' && document.getElementById('qty<%=rstpstsqlbill.getString("ZIP")%>').value.length==5 )
{window.location.href='customerinfo.jsp?BILLZIP=' + document.getElementById('qty<%=rstpstsqlbill.getString("ZIP")%>').value 
+ '&BILLCITY=' + document.getElementById('qty<%=rstpstsqlbill.getString("CITY")%>').value  + '&BILLAL1=' + document.getElementById('qty<%=rstpstsqlbill.getString("ADD_LINE1")%>').value 
+ '&BILLAL2=' + document.getElementById('qty<%=rstpstsqlbill.getString("ADD_LINE2")%>').value + '&BILLAID=' + document.getElementById('<%=rstpstsqlbill.getString("AID")%>').value }">Update</a>
<input type="hidden" id="<%=rstpstsqlbill.getString("AID")%>" value="<%=rstpstsqlbill.getString("AID")%>" style="visibility:hidden"/><br/><br/><br/>
<%} 
while(rspstsqlcard.next()){
%>
<table>
<tr>
<td><font size="4"><b>Card No: <input type="text"required pattern=".{16,}" title="Invalid Card No" onkeypress="return onlyNumbers()" maxlength="16" value="<%=rspstsqlcard.getString("CARD_NO")%>" id="qty<%=rspstsqlcard.getString("CARD_NO")%>" /></b></font></center></td>
<td><font size="4"><b>Exp Date - mmyyyy: <input type="text"required onkeypress="return onlyNumbers()" maxlength="6" value="<%=rspstsqlcard.getString("EXP_DATE")%>" id="qty<%=rspstsqlcard.getString("EXP_DATE")%>" /></b></font></center></td>
<td><center><a href="javascript:if(document.getElementById('qty<%=rspstsqlcard.getString("CARD_NO")%>').value!='' || document.getElementById('qty<%=rspstsqlcard.getString("EXP_DATE")%>').value!=''
&& document.getElementById('qty<%=rspstsqlcard.getString("CARD_NO")%>').value.length==16 && document.getElementById('qty<%=rspstsqlcard.getString("EXP_DATE")%>').value.length==6
){window.location.href='customerinfo.jsp?CARD=' + document.getElementById('qty<%=rspstsqlcard.getString("CARD_NO")%>').value + '&EXP_DT=' + document.getElementById('qty<%=rspstsqlcard.getString("EXP_DATE")%>').value }">Update</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="deletecard.jsp?CARD_NO=<%=rspstsqlcard.getString("CARD_NO")%>"> Delete </a></table></center></tr>
</table>
<%}%>
<br/><br/>
<%/*}catch (SQLException se){
	out.print("Phone/Card/Email already exists");
}*/ %>

<button type="button" onclick="window.location.href='http://localhost:8010/examples/CS425_project/orders.jsp'"> Orders History </button>
	
</body>
<html>
