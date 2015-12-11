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



	String bn = multi.getParameter("bn");
	String num = multi.getParameter("num");
	String title = multi.getParameter("title");
	String contents = multi.getParameter("contents");


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

		String strSQL = null;;
		if (bn.equals("art")) {
		strSQL = "UPDATE artworkboard SET title = '"+title+"'";
		strSQL+=", contents = '"+contents+"', writedate = '"+date+"', filename = '"+original+"' WHERE num = "+num;
		}
		else if (bn.equals("free")) {
		strSQL = "UPDATE freeboard SET title = '"+title+"'";
		strSQL+=", contents = '"+contents+"', writedate = '"+date+"', filename = '"+original+"' WHERE num = "+num;
		}
		else if (bn.equals("down")) {
		strSQL = "UPDATE downboard SET title = '"+title+"'";
		strSQL+=", contents = '"+contents+"', writedate = '"+date+"', filename = '"+original+"' WHERE num = "+num;
		}
		else if (bn.equals("notice")) {
		strSQL = "UPDATE noticeboard SET title = '"+title+"'";
		strSQL+=", contents = '"+contents+"', writedate = '"+date+"', filename = '"+original+"' WHERE num = "+num;
		}
		stmt.executeUpdate(strSQL);
		
		stmt.close();
		conn.close();
			
	}catch(SQLException ex){out.println("SQLException");}	

		if (bn.equals("art")) {
		response.sendRedirect("artwork.jsp");
		}
		else if (bn.equals("free")) {
		response.sendRedirect("freeboard.jsp");
		}
		else if (bn.equals("down")) {
		response.sendRedirect("downboard.jsp");
		}
		else if (bn.equals("notice")) {
		response.sendRedirect("main.jsp");
		}

%>
