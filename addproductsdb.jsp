<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<html> <head> <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>JSP Page</title> </head> <body>
<%@page  import="java.sql.*"%>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl","tpradhan1","YCsBUo3...uK3Z17");
String DETAILS=request.getParameter("DETAILS");
String PTYPE=request.getParameter("PTYPE");
String PNAME=request.getParameter("PNAME");
String PRICE=request.getParameter("PRICE");
String PSIZE=request.getParameter("PSIZE");
String IMG_PATH=request.getParameter("IMG_PATH");
Statement st = conn.createStatement();
String sql = "SELECT MAX(PID) PID FROM PRODUCTS";
ResultSet rs = st.executeQuery(sql);
int j=0;
if(rs.next())
	j=rs.getInt("PID");
String sql4= "Insert into products values(?,?,?,?,?,?)";
PreparedStatement pst4 = conn.prepareStatement(sql4);
pst4.setInt(1,j+1);
pst4.setString(2,PNAME);
pst4.setString(3,PTYPE);
pst4.setString(4,DETAILS);
pst4.setString(5,PSIZE);
pst4.setString(6,IMG_PATH);
pst4.executeUpdate();
String insertprice= "Insert into product_price select ?,?,State_code from states where state_code not in ('XX')";
PreparedStatement pstinsertprice = conn.prepareStatement(insertprice);
pstinsertprice.setString(1,PRICE);
pstinsertprice.setInt(2,j+1);
pstinsertprice.executeUpdate();
out.print("Product added success fully...Redirecting");
%>
</body>
<meta http-equiv="refresh" content="2; url=addproducts.jsp" />
</html>