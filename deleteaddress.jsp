<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<html> <head> <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>JSP Page</title> </head> <body>
<%@page  import="java.sql.*"%>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl","tpradhan1","YCsBUo3...uK3Z17");
String AID=request.getParameter("AID");
String BILLAID=request.getParameter("BILLAID");
String user = (String)session.getAttribute("user");
String sql= "Select sum(CNT) CNT from (select AID,count(*) CNT from customer_address where CID=(SELECT cid FROM CUSTOMER WHERE lower(UNAME)=?) and AID not in (select case when aid is null then 0 else aid end aid from card_info where CID =(SELECT cid FROM CUSTOMER WHERE lower(UNAME)=?)))";
PreparedStatement pst = conn.prepareStatement(sql);
pst.setString(1,user);
pst.setString(2,user);
ResultSet rs = pst.executeQuery();
if (BILLAID!=null){
String sql6 = "Update CARD_INFO set AID = null where AID = ?";
PreparedStatement pst6 = conn.prepareStatement(sql6);
String sql5= "Delete from customer_address where AID = ?";
PreparedStatement pst5 = conn.prepareStatement(sql5);
pst6.setString(1,BILLAID);
pst5.setString(1,BILLAID);
pst6.executeUpdate();
pst5.executeUpdate();
}
while(rs.next()){
	if(rs.getInt("CNT")>1){
String sql4= "Delete from customer_address where AID = ?";
PreparedStatement pst4 = conn.prepareStatement(sql4);
pst4.setString(1,AID);
pst4.executeUpdate();
}

String redirectURL = "http://localhost:8010/examples/CS425_project/customerinfo.jsp";
response.sendRedirect(redirectURL);
}
%>