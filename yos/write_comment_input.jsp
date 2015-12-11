<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<%
String num = request.getParameter("num");
String id=(String)session.getAttribute("id");  
String contents = request.getParameter("comment");

Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

String url = "jdbc:odbc:dbMember";
Connection conn = DriverManager.getConnection(url,"","");

Statement stmt = conn.createStatement();

Calendar dateIn = Calendar.getInstance();
String indate = Integer.toString(dateIn.get(Calendar.YEAR)) + "-";
indate = indate + Integer.toString(dateIn.get(Calendar.MONTH)+1) + "-";
indate = indate + Integer.toString(dateIn.get(Calendar.DATE)) + " ";
indate = indate + Integer.toString(dateIn.get(Calendar.HOUR_OF_DAY)) + ":";
indate = indate + Integer.toString(dateIn.get(Calendar.MINUTE)) + ":";
indate = indate + Integer.toString(dateIn.get(Calendar.SECOND));

String strSQL ="INSERT INTO tblplus (num, id, contents, writedate)";
strSQL = strSQL +  "VALUES('" + num + "', '" + id + "',";
strSQL = strSQL +  "'" + contents + "', '" + indate + "')";
stmt.executeUpdate(strSQL);

stmt.close();
conn.close();

response.sendRedirect("write_output.jsp?bn=free&num=" + num); 
%>
