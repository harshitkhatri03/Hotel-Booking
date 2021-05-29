 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ page import="java.sql.*"%>
     <%@ page trimDirectiveWhitespaces="true" %>
     
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

        <%
    	try{
            String username =request.getParameter("username");
            String password =request.getParameter("password");
    		Class.forName("com.mysql.jdbc.Driver");
    		Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp","root","root");
    		
            PreparedStatement p = cn.prepareStatement("select * from signup where username=? and password=?");
             
             p.setString(1,username);
             p.setString(2,password);
        	 ResultSet r = p.executeQuery();
             
             if(r.next())
             {

      			%>
                <jsp:forward page="index2.html"></jsp:forward>
            	<%
             }
             else
             {
            	%>
            	<jsp:include page="abcd.html"></jsp:include>
 				<%
             }
	}
	catch(Exception ex){
	%>
	<%
	out.println("Something went wrong please try again.");
			ex.printStackTrace();
	}
	%>

</body>
</html>