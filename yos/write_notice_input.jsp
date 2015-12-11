<%@ page language="java" contentType="text/html;charset=euc-kr"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.sql.*, java.util.*"%>
<%@ page import="java.io.*"%>
<% request.setCharacterEncoding("euc-kr");%>
<head>

</head>
<%
	String realFolder = "";
	String saveFolder = "fileSave";
	String encType = "euc-kr";
	int maxSize = 1024*1024*1024;
	ServletContext context = getServletContext();
	realFolder = context.getRealPath(saveFolder);

	MultipartRequest multi = null;
	multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	String fileName = multi.getFilesystemName("userFile");
	String originalFileName = multi.getOriginalFileName("userFile");
	File file = multi.getFile("userFile");

	
	String title = multi.getParameter("title");
	String contents = multi.getParameter("contents");

	Calendar c = Calendar.getInstance();
	String date = Integer.toString(c.get(Calendar.YEAR))+"-";
	date += Integer.toString(c.get(Calendar.MONTH)+1)+"-";
	date += Integer.toString(c.get(Calendar.DATE))+" ";
	date += Integer.toString(c.get(Calendar.HOUR_OF_DAY))+":";
	date += Integer.toString(c.get(Calendar.MINUTE)+1)+":";
	date += Integer.toString(c.get(Calendar.SECOND));
	
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

	try{
		String url = "jdbc:odbc:dbMember";

		Connection conn = DriverManager.getConnection(url, "", "");
		Statement stmt = conn.createStatement();
		
		PreparedStatement pstmt = null;		

		String strSQL = "INSERT INTO noticeboard (title, contents, writedate, filename)";
		strSQL+="VALUES (?, ?, ?, ?)";
		pstmt = conn.prepareStatement(strSQL);
		pstmt.setString(1, title);
		pstmt.setString(2, contents);
		pstmt.setString(3, date);
		pstmt.setString(4, fileName);
		pstmt.executeUpdate();
		
		stmt.close();
		conn.close();
			
	}catch(SQLException ex){
		out.println("SQLException");
	}
	response.sendRedirect("main.jsp");


%>