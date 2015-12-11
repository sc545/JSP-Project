<%@ page language="java" contentType="text/html;charset=euc-kr"%>
<%@ page import="java.sql.*, java.util.*"%>
<% request.setCharacterEncoding("euc-kr");%>
<head>

</head>
<%
	String num = request.getParameter("num");
	String bn = request.getParameter("bn");
	
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

	try{
		String url = "jdbc:odbc:dbMember";

		Connection conn = DriverManager.getConnection(url, "", "");
		Statement stmt = conn.createStatement();
		
		if (bn.equals("art")) {
		stmt.executeUpdate("DELETE FROM artworkboard WHERE num="+num+";");
		response.sendRedirect("artwork.jsp");
		}
		else if (bn.equals("free")) {
		stmt.executeUpdate("DELETE FROM freeboard WHERE num="+num+";");
		response.sendRedirect("freeboard.jsp");
		}
		else if (bn.equals("down")) {
		stmt.executeUpdate("DELETE FROM downboard WHERE num="+num+";");
		response.sendRedirect("downboard.jsp");
		}
		else if (bn.equals("notice")) {
		stmt.executeUpdate("DELETE FROM noticeboard WHERE num="+num+";");
		response.sendRedirect("main.jsp");
		}


		stmt.close();
		conn.close();
			
	}catch(SQLException ex){out.println("SQLException");}

%>