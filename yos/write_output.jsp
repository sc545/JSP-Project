<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="top.jsp"%>
<% 	String bn = request.getParameter("bn");  %>
<div id="pageContainer">
	<div id="centerBox">
		<div id="headerImage">
		<%if (bn.equals("art")) { %>
		<div id="headtext">스샷게시판</div>
<script>
document.title = "스샷 게시판"; 
</script>
		<%
		}
		else if (bn.equals("free")) { %>
		<div id="headtext">자유게시판</div>

<script>
document.title = "자유 게시판"; 
</script>

		<% }
		else if (bn.equals("down")) { %>
		<div id="headtext">자료실</div>
<script>
document.title = "자료실"; 
</script>


		<% } %>

</div>
		<div id="intromain">
			<div id="content">
<%
	String num = request.getParameter("num");
	String name=null;
	String writedate=null;	
	String title=null;
	String readcount=null;
	String contents=null;
	String filename=null;
	String tmp=null;
	String strSQL = null;
	String id2 = null;
	if ((String)session.getAttribute("id") == null) {
	id2 = "no";
}
	else {
	id2 =  (String)session.getAttribute("id");
}
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

	try{
		String url = "jdbc:odbc:dbMember";

		Connection conn = DriverManager.getConnection(url, "", "");
		Statement stmt = conn.createStatement();
		if (bn.equals("art")) {
		stmt.executeUpdate("UPDATE artworkboard SET readcount=readcount+1 WHERE num="+num+";");
		strSQL = "SELECT * FROM artworkboard WHERE num="+num+";";
		}
		else if (bn.equals("free")) {
		stmt.executeUpdate("UPDATE freeboard SET readcount=readcount+1 WHERE num="+num+";");
		strSQL = "SELECT * FROM freeboard WHERE num="+num+";";
		}
		else if (bn.equals("down")) {
		stmt.executeUpdate("UPDATE downboard SET readcount=readcount+1 WHERE num="+num+";");
		strSQL = "SELECT * FROM downboard WHERE num="+num+";";
		}
		ResultSet rs = stmt.executeQuery(strSQL);
		rs.next();
		name=rs.getString("id");
		writedate=rs.getString("writedate");
		title=rs.getString("title");
		readcount=rs.getString("readcount");
		contents=rs.getString("contents");
		filename=rs.getString("filename");
		tmp = "/yos/fileSave/"+filename;
		stmt.close();
		conn.close();
			
	}catch(SQLException ex){out.println("SQLException");}
	finally{ 
} 
%>

<center><FORM Name='fomrWriteOutput' Method='post' Action='write_comment_input.jsp'>

<TABLE border='0' cellSpacing=3 cellPadding=5 align=center>
<TR>
	<TD colspan=2><hr size='2' noshade>
	</TD>
</TR>
<TR>
	<TD width=350>
		<font size='3'>작성자 : <%=name%></font>
	</TD>
	<TD>
		<font size='3'>작성일 : <%=writedate%>, 조회수 : <%=readcount%></font>
	</TD>

</TR>
<% if(!(filename==null || bn.equals("art"))) { %>
<TR>
	<TD width=350 colspan=2>
		<font size='3'>파일이름 : <a href='file_down.jsp?bn=<%=bn %>&num=<%=num%>'><%=filename%></a></font>
	</TD>
</TR>
<% } %>
<TR>
	<TD colspan=2 bgcolor='gray'>
		<center><font size='3'><b><%=title%></b></font>
	</TD>
</TR>

<% if(!(filename==null)) { %>
<TR>
	<TD colspan=2 bgcolor='#DCDCDC'>
		<center><img src='<%=tmp%>' width='600'>
	</TD>
</TR>
<% } %>

<TR>
	<TD colspan=2>
		<font size='3'><%=contents%></b></font>
	</TD>
</TR>
<TR>
	<TD colspan=2><hr size='2' noshade>
	</TD>
</TR>
<TR>
	<TD> <%  if ((id2.equals(name)) || (id2.equals("admin"))) {  %>
		<a href="modify_output.jsp?num=<%=num%>&bn=<%=bn%>">[수정하기]</a>
		<a href="delete_check.jsp?num=<%=num%>&bn=<%=bn%>">[삭제하기]</a>
		<% } %>
	</TD>
	<TD align=right>
	<%
		if (bn.equals("art")) { %>
		<a href="write.jsp?bn=art">[파일업로드]</a>
		<a href="artwork.jsp">[목록보기]</a>
		<%
		}
		else if (bn.equals("free")) { %>
		<a href="write.jsp?bn=free">[파일업로드]</a>
		<a href="freeboard.jsp">[목록보기]</a>
		<% }
		else if (bn.equals("down")) { %>
		<a href="write.jsp?bn=down">[파일업로드]</a>
		<a href="downboard.jsp">[목록보기]</a>
		<% } %>
	</TD>
</TR>
</table>
<% if (bn.equals("free") && !((String)session.getAttribute("id")==null)) {  %>
<table border='0' cellSpacing=3 cellPadding=5 align=center>
<input type='hidden' name='num' value='<%=num %>'>
<tr>
	<TD bgcolor='#DCDCDC' >
		<b>작성자</b>
	</TD>
	<td>
		<%=id %>
	</td>

</tr>
<tr>
	<TD bgcolor='#DCDCDC' width='70'>
		<b>한줄댓글</b>
	</TD>
	<td>
		<input type='text' size='50' name='comment'>
	</td>
	<td>
		<input type='button' onClick='submit()' value='댓글등록'>
	</td>
</tr>
<%	
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		
		try{
			String url = "jdbc:odbc:dbMember";
			
			Connection conn = DriverManager.getConnection(url, "", "");
			Statement stmt = conn.createStatement();
			
			strSQL = "SELECT * FROM tblplus WHERE num="+num+" ORDER BY writedate DESC" ;

			stmt.executeQuery(strSQL);
			ResultSet rs = stmt.executeQuery(strSQL);
			
			while(rs.next()){
				String coname = rs.getString("id");
				String comment = rs.getString("contents");
				String date = rs.getString("writedate");
						
%>
			<tr>
				<td bgcolor='#DCDCDC' width='70'>
					<%=coname%>
				</td>
				<td bgcolor='#DCDCDC' width='70'>
					<%=comment%> (<%=date%>)
				</td>
			</tr>
<% 
			} 
		}catch(SQLException e){out.println("error");}
	finally{ 
} 
%>

</table>
<% } %>
</FORM>


<% 
if(bn.equals("free") && ((String)session.getAttribute("id")==null)) { %>
<center> 로그인시 댓글 작성 가능 <% } %>

</div>
</div>


</div></div>
</div>
		</div>

<%@ include file="bottom.jsp"%>