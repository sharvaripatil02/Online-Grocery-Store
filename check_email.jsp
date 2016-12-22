
<%@page  import="java.sql.*"%>
     <%
	 Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl","tpradhan1","YCsBUo3...uK3Z17");
	//Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","Atos123");
	 String sql = "SELECT lower(email_id) email_id FROM CUSTOMER where lower(email_id)=?";
	 String EmailID=request.getParameter("EmailID");
	 String Email=EmailID.toLowerCase();
	 String Em="";
	 PreparedStatement st = conn.prepareStatement(sql);
	  st.setString(1,Email);
     ResultSet rs = st.executeQuery();
	 while(rs.next()){
		  Em=rs.getString("email_id");
	 }
	 if(Email.equals(Em)){	 
		  out.println("<font color=red>Email id is already used</font>");
	 }
	else 
	{
		  out.println("");
	}
	%> 