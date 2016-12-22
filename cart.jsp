
<%@page  import="java.sql.*"%>
 <%
	String req = request.getParameter("quantity");
	if (req.equals("0") || req.equals("00") || req.equals("000")){
		out.print("<font color=\"red\">");
		out.print("Please enter valid quantity");
		out.print("</font>");
	}
	else{
	String pname=(String)session.getAttribute("pname");
	String price=(String)session.getAttribute("price");
	String user=(String)session.getAttribute("user");
	String state=(String)session.getAttribute("state");
try{
	 Class.forName("oracle.jdbc.driver.OracleDriver");
	 Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl","tpradhan1","YCsBUo3...uK3Z17");
	String pname_lower=pname.toLowerCase();
	Statement st = conn.createStatement();
	String sql2 = "SELECT distinct PID FROM PRODUCTS where lower(PNAME)=?";
	String sqlqty = "SELECT Quantity FROM stock s,products p where lower(PNAME)=? and p.pid=s.pid and wid=(select wid from warehouse where state_code=(select state_code from states where lower(state_name)=?))";
	String sql3 = "SELECT CID FROM CUSTOMER where lower(UNAME)=?";
	PreparedStatement pst2 = conn.prepareStatement(sql2);
	PreparedStatement pst3 = conn.prepareStatement(sql3);
	PreparedStatement pstsqlqty = conn.prepareStatement(sqlqty);
	pstsqlqty.setString(1,pname_lower);
	pstsqlqty.setString(2,state);
	ResultSet rspstsqlqty = pstsqlqty.executeQuery();
	while(rspstsqlqty.next()){
		int qty1 = Integer.parseInt(req);
		int qty2 = rspstsqlqty.getInt("Quantity");
		if(qty1>qty2){
			out.print("Entered quantity exceeds stock");
		}
		else{
	pst2.setString(1,pname_lower);
	pst3.setString(1,user);	
	ResultSet rs2 = pst2.executeQuery();
	ResultSet rs3 = pst3.executeQuery();
	int CID=0,PID=0;
	if(rs2.next())
		PID = rs2.getInt("PID");
	if(rs3.next())
	CID = rs3.getInt("CID");	
	st.executeUpdate("Insert into CART values(" + req + "," + CID +","+ PID + ")");
	out.print("Products added to cart successfully");
		}
}
}
	catch (SQLException se){
		out.print("<font color=\"red\">");
	out.print("Product already added to cart....Visit cart to edit order");
	out.print("</font>");
}	 catch (Exception e){
	out.print("Error...Please try again");
}	 
	}
	%> 