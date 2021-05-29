<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<%@ page import="java.sql.*"%>
	<%@ page import="java.io.*"%>
<title>Book Room</title>
<style>
table, td, th {  
  border: 1px solid #000066;
  text-align: left;
   color:black;
  font-weight: bold;
font-size: 18px;
}

table {
  border-collapse: collapse;
  width: 70%;
   color:black;
}
body {
  background-image: url("abcd.jpg");
  background-repeat: no-repeat;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}

th, td {
  padding: 10px;
  color:black;
  background-color:white;
}
#abcdefg{
border : 1px solid black;
padding:10px;
color: yellow;
background-color:blue;
}
</style>
</head>
<body>
<center style = "padding=50px , margin=200px"><h1>Click On Buy Now To Confirm Your Booking
<br>Enjoy Your Stay<br>
<br> HERE ARE YOUR DETAILS</h1>

<br>
<br>
<table>
					<%
					try {
						Class.forName("com.mysql.jdbc.Driver");
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/webapp", "root", "root");
						PreparedStatement ps = con.prepareStatement("Select * from book where name=?");
						String name1=request.getAttribute("name").toString();
						ps.setString(1,name1);
						ResultSet rs = ps.executeQuery();
						out.print("<table border='collapse' class='abcd'>");
						out.print("<tr><th>Name NO</th><th>Email</th><th>Phone</th><th>Rooms</th><th>Guest</th><th>CheckIN</th><th>CheckOUT</th><th>Bar</th></tr>");
						while (rs.next()) 
						{

										out.print("<tr>");
										out.print("<td>" + rs.getString(1) + "</td>");
										out.print("<td>" + rs.getString(2) + "</td>");
										out.print("<td>" + rs.getString(3) + "</td>");
										out.print("<td>" + rs.getString(4) + "</td>");
										out.print("<td>" + rs.getString(5) + "</td>");
										out.print("<td>" + rs.getString(6) + "</td>");
										out.print("<td>" + rs.getString(7) + "</td>");
										out.print("<td>" + rs.getString(8) + "</td>");
										out.print("</tr>");
						}
						out.print("</table>");

					}

					catch (SQLException e) {
						e.printStackTrace();
					}
					%>
				</table> <%

 %>
 <br>
 <a href = "index2.html" id="abcdefg">RETURN TO HOMEPAGE</a><br><br><br>
 <a href="buy.html" id="abcdefg">BUY NOW</a>
 </center>
</body>
</html>