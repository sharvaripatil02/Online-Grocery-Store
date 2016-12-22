<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<html> <head> <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>JSP Page</title> </head> <body>
<%@page  import="java.sql.*"%>
     <%
	 String First=request.getParameter("First");
	 String Last=request.getParameter("Last");
	  String Email=request.getParameter("EmailID");
	   String EmailID=Email.toLowerCase();
	 String USER=request.getParameter("username");
	 	 String Uname=USER.toLowerCase();
	  String Pswd=request.getParameter("password");
	 String AL1=request.getParameter("AL1");
	  String AL2=request.getParameter("AL2");
	 String City=request.getParameter("City");
	  String State=request.getParameter("State");
	   String Zip=request.getParameter("Zip");
	   String Phone=request.getParameter("Phone");
	   String ALPhone=request.getParameter("ALPhone");
	   try{
	 Class.forName("oracle.jdbc.driver.OracleDriver");
	 Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@fourier.cs.iit.edu:1521:orcl","tpradhan1","YCsBUo3...uK3Z17");
	 //Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","scott","Atos123");
	 Statement st = conn.createStatement();
	 Statement st2 = conn.createStatement();
	  Statement st3 = conn.createStatement();
	  Statement st4 = conn.createStatement();
	  String sql = "SELECT PHONE_NO FROM PHONE where PHONE_NO=?";
	 PreparedStatement pst = conn.prepareStatement(sql);
	 pst.setString(1,Phone);
	 ResultSet rs4 = pst.executeQuery();
	 ResultSet rs = st.executeQuery("select CID from CUSTOMER order by cid");
	  ResultSet rs1 = st2.executeQuery("select AID from CUSTOMER_ADDRESS order by AID");
	 int i=0,j=0;
	 while(rs.next()){
		i= rs.getInt("CID");
	 }	 
	while(rs1.next()){
		j= rs1.getInt("AID");
	 }
	if(!rs4.next()){
	st.executeUpdate("Insert into CUSTOMER values(" + (i+1) +","+"'"+First+"'"+","+"'"+Last+"'"+","+"'"+EmailID+"'"+","+"'"+Uname+"'"+","+"'"+Pswd+"'"+",0)" );
	st2.executeUpdate("Insert into CUSTOMER_ADDRESS values(" +(j+1) +","+ (i+1) +","+"'"+AL1+"'"+","+"'"+AL2+"'"+","+"'"+City+"'"+","+"'"+State+"'"+","+"'"+Zip+"'"+")" );
	st3.executeUpdate("Insert into PHONE values(" + Phone + ","+(i+1)+")") ;
	if(ALPhone!="")
	st4.executeUpdate("Insert into PHONE values(" + ALPhone + ","+(i+1)+")");
	out.println("<font color=green>");
		out.print("Registration Successfull....Redirecting to login page");%>
		<meta http-equiv="refresh" content="2; url=login.jsp" />
		<% out.println("</font>");
	}else out.print("Username/Password/Phone already exist");
		  }catch (SQLException se){
	out.print("Username/email already exist");
}	 catch (Exception e){
	out.print("Erroe...Please try again");
}	 
	
	%> 
</body> </html>