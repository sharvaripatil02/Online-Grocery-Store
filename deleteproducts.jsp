<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<html> <head> <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>JSP Page</title> </head> <body>
<%@page  import="java.sql.*"%>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl","tpradhan1","YCsBUo3...uK3Z17");
String PID=request.getParameter("PID");
String STATE = request.getParameter("STATE");
String state_lower = STATE.toLowerCase();
String sql4= "delete from PRODUCT_PRICE where PID=? and STATE_CODE =(select STATE_CODE from states where lower(state_name)=?)";
PreparedStatement pst4 = conn.prepareStatement(sql4);
pst4.setString(1,PID);
pst4.setString(2,state_lower);
pst4.executeUpdate();
String redirectURL = "http://localhost:8010/examples/CS425_project/modifyproducts.jsp";
response.sendRedirect(redirectURL + "?id=" + STATE);
%>