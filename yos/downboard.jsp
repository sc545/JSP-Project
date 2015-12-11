<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<script>
document.title = "자료실"; 
</script>


<%@ include file="top.jsp"%>
<div id="pageContainer">
	<div id="centerBox">
		<div id="headerImage"><a href="main.jsp"><img src="images/trans.gif" width="300px" height="80px" style="left:50px; top:30px; position:absolute;"></img></a><div id="headtext">자료실</div></div>
		<div id="intromain">
			<div id="content">
	<TABLE border='0' cellSpacing=3 cellPadding=5 align=center>
		<TR>
			<TD colspan=5><hr size='2' noshade>
			</TD>
 		</TR>
		<tr bgcolor='gray'>
			<Th width=70>번호</Th>
			<Th width=250>글 제목</Th>
			<Th width=80>작성자</Th>
			<Th width=250>작성일</Th>
			<Th width=70>조회</Th>


			
		</tr>
	<%	
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		
		try{
			String url = "jdbc:odbc:dbMember";
			
			Connection conn = DriverManager.getConnection(url, "", "");
			Statement stmt = conn.createStatement();
			
			String strSQL = "SELECT * FROM downboard ORDER BY num DESC";
			stmt.executeQuery(strSQL);
			ResultSet rs = stmt.executeQuery(strSQL);

			while(rs.next()){
				int num = rs.getInt("num");
				String name = rs.getString("id");
				String title = rs.getString("title");
				String writedate = rs.getString("writedate");
				int readcount = rs.getInt("readcount");
	%>
		<tr bgcolor='#DCDCDC'>
			<td align=center><font size=3 color='#3f4140'><%=num%></font></td>
			<td> <a href="write_output.jsp?&bn=down&num=<%=num%>"><font size=2 color='black'><%=title%></font></a></td>
			<td> <%=name%> </td>
			<td> <%=writedate%> </td>
			<td> <%=readcount%> </td>
		</tr>
	<%
			}
			rs.close();
			stmt.close();
			conn.close();
		}catch(SQLException ex){}
	%>
		<TR>
			<TD colspan=5><hr size='2' noshade>
			</TD>
 		</TR>
		<tr align='right'>
			<td colspan=5><a href="write.jsp?bn=down">[파일업로드]</a></td>		
		</tr>

	</table>

</div>
</div>


</div></div>
</div>
		</div>

<%@ include file="bottom.jsp"%>