<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*"%>
<%@ page trimDirectiveWhitespaces="true"%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
	try {
		String username = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String rooms = request.getParameter("rooms");
		String guest = request.getParameter("guest");
		String checkin = request.getParameter("checkin");
		String checkout = request.getParameter("checkout");
		String bar =request.getParameter("bar");
		Class.forName("com.mysql.jdbc.Driver");
		Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp", "root", "root");
		String s = "insert into book values(?,?,?,?,?,?,?,?)";

		PreparedStatement p = cn.prepareStatement(s);

		p.setString(1, username);
		p.setString(2, email);
		p.setString(3, phone);
		p.setString(4, rooms);
		p.setString(5, guest);
		p.setString(6, checkin);
		p.setString(7, checkout);
		p.setString(8,bar);
		
		int i = p.executeUpdate();

		if (i > 0) {
			request.setAttribute("name",username);
			System.out.println(username);
	%>
	<jsp:forward page="home.jsp"></jsp:forward>
	<%
	} else {
	%>
	out.println("Something went wrong.");
	<jsp:include page="book.html"></jsp:include>
	<%
	}
	} catch (Exception ex) {
	%>
	<%
	ex.printStackTrace();
	out.println("Something went wrong please try again.");
	}
	%>

</body>
</html>