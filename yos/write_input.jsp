<%@ page language="java" contentType="text/html;charset=euc-kr"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="java.sql.*, java.util.*"%>
<%@ page import="java.io.*"%>
<% request.setCharacterEncoding("euc-kr");%>
<%
	

	String realFolder = "";
	String saveFolder = "fileSave";
	String encType = "euc-kr";
//	String encType = "utf-8";
	int maxSize = 100*1024*1024;
	String original=null;

	ServletContext context = getServletContext();
	realFolder = context.getRealPath(saveFolder);
	
	MultipartRequest multi = null;;
	

	try{
		// 전송할 담당할 컴포넌트를 생성하고 파일을 전송한다.
		// 전송할 파일명을 가지고 있는 객체, 서버상의 절대경로, 최대 업로드될 파일 크기, 문자코드, 기본 보안 적용
		multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

		Enumeration files = multi.getFileNames();

		while(files.hasMoreElements()){
			String name = (String)files.nextElement();
			original = multi.getOriginalFileName(name);
		}

		
	}catch(IOException ioe){
		out.println("IOException");
	}catch(Exception ex){
		out.println("Exception");
	}

	String id = (String)session.getAttribute("id"); 
	String title = multi.getParameter("title");
	String contents = multi.getParameter("contents");
	String strSQL = null;
	String bn = multi.getParameter("bn");


//	파일 업로드 부분

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
	
		if (bn.equals("down")) {
		strSQL = "INSERT INTO downboard (id, title, contents, writedate, readcount, filename)";
		}
		else if (bn.equals("free")) {
		strSQL = "INSERT INTO freeboard (id, title, contents, writedate, readcount, filename)";
		}
		else if (bn.equals("art")) {
		strSQL = "INSERT INTO artworkboard (id, title, contents, writedate, readcount, filename)";
		}
		else {
			response.sendRedirect("main.jsp"); 
		}

		strSQL+="VALUES (?, ?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(strSQL);
		pstmt.setString(1, id);
		pstmt.setString(2, title);
		pstmt.setString(3, contents);
		pstmt.setString(4, date);
		pstmt.setInt(5, 0);
		pstmt.setString(6, original);
		pstmt.executeUpdate();
		
		stmt.close();
		conn.close();
			
	}catch(SQLException ex){
		out.println("SQLException");
	}
	if (bn.equals("down")) {
		response.sendRedirect("downboard.jsp"); 
	}
	else if (bn.equals("free")) {
		response.sendRedirect("freeboard.jsp");
	}else {
		response.sendRedirect("artwork.jsp");
	}


%>