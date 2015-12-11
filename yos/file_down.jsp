<%@ page contentType="application; charset=euc-kr" pageEncoding="euc-kr"%>
<%@ page import="java.util.*,java.io.*,java.sql.*,java.text.*"%>

<%
String num = request.getParameter("num"); 
String bn = request.getParameter("bn"); 

Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

String url = "jdbc:odbc:dbMember";
Connection conn = DriverManager.getConnection(url,"","");

Statement stmt = conn.createStatement();
	
ResultSet rs = null;
		if (bn.equals("art")) {
		rs = stmt.executeQuery("SELECT filename FROM artworkboard WHERE num =" + num);
		}
		else if (bn.equals("free")) {
		rs = stmt.executeQuery("SELECT filename FROM freeboard WHERE num =" + num);
		}
		else if (bn.equals("down")) {
		rs = stmt.executeQuery("SELECT filename FROM downboard WHERE num =" + num);
		}
rs.next();

String filename = rs.getString("filename");
String filename2 = new String(filename.getBytes("KSC5601"),"8859_1");
File file = new File("C:\apache-tomcat-7.0.42\apache-tomcat-7.0.42\webapps\yos\fileSave\"+filename);


byte b[] = new byte[(int)file.length()];
response.setHeader("Content-Disposition", "attachment;filename=" + filename2 + ";");
               
if (file.isFile())
{
	BufferedInputStream fin = new BufferedInputStream(new FileInputStream(file));
	BufferedOutputStream outs = new BufferedOutputStream(response.getOutputStream());
	int read = 0;
	while ((read = fin.read(b)) != -1){
		outs.write(b,0,read);
	}
	outs.close();
	fin.close();
}
%>
