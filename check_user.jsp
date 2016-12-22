
<%@page  import="java.sql.*"%>
     <%
	 Class.forName("oracle.jdbc.driver.OracleDriver");
	 Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl","tpradhan1","YCsBUo3...uK3Z17");
	 //Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","Atos123");
	 String sql = "SELECT lower(UNAME) UNAME FROM CUSTOMER where lower(UNAME)=?";
	 String USERNAME=request.getParameter("username");
	 String User=USERNAME.toLowerCase();
	 PreparedStatement st = conn.prepareStatement(sql);
	  st.setString(1,User);
     ResultSet rs = st.executeQuery();
     String Uname="";
	 while(rs.next()){
		  Uname=rs.getString("UNAME");
	 }
	 if(User.equals(Uname)){	 
	 
		  out.println("<font color=red>");
	  out.print("User already exists");
	  out.println("</font>");
	 }
	else 
	{
		  out.println("<font color=green>");
		out.print("Username Available");
		 out.println("</font>");
	}
	%> 