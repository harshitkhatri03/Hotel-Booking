<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*"%>
     <%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
  <% 
String username=request.getParameter("username");
String password=request.getParameter("password");
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp","root","root");
	PreparedStatement ps=con.prepareStatement("update signup set password=? where username=?");
	ps.setString(1,password);
	ps.setString(2,username);
	int i=ps.executeUpdate();
	if(i>0)
	{
		%>
        <jsp:forward page="abcd.html"></jsp:forward>
    	<%
	}
	else{
		%>
        <jsp:forward page="forget.html"></jsp:forward>
    	<%
	}
}
catch(Exception e)
{
	e.printStackTrace();
}
	%>

</body>
</html>