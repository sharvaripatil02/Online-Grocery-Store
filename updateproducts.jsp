<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<html> <head> <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>JSP Page</title> </head> <body>
<%@page  import="java.sql.*"%>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl","tpradhan1","YCsBUo3...uK3Z17");
String DETAILS=request.getParameter("DETAILS");
String PTYPE=request.getParameter("PTYPE");
String PID=request.getParameter("PID");
String PNAME=request.getParameter("PNAME");
String price=request.getParameter("price");
String PSIZE=request.getParameter("PSIZE");
String STATE=request.getParameter("STATE");
String state_lower = STATE.toLowerCase();
session.setAttribute("statename",state_lower);
String IMG_PATH=request.getParameter("img_path");

//String user = (String)session.getAttribute("user");
String sql4= "UPDATE PRODUCTS set PNAME=?,PTYPE=?,DETAILS=?,PSIZE=?,IMG_PATH=? where PID=?";
PreparedStatement pst4 = conn.prepareStatement(sql4);
pst4.setString(1,PNAME);
pst4.setString(2,PTYPE);
pst4.setString(3,DETAILS);
pst4.setString(4,PSIZE);
pst4.setString(5,IMG_PATH);
pst4.setString(6,PID);
pst4.executeUpdate();
String sqlprice= "UPDATE PRODUCT_PRICE set PRICE=? where PID=? and STATE_CODE =(select STATE_CODE from states where lower(state_name)=?)";
PreparedStatement pstprice = conn.prepareStatement(sqlprice);
pstprice.setString(1,price);
pstprice.setString(2,PID);
pstprice.setString(3,state_lower);
pstprice.executeUpdate();
String redirectURL = "http://localhost:8010/examples/CS425_project/modifyproducts.jsp";
response.sendRedirect(redirectURL + "?id=" + STATE);
%>