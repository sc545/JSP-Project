<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="top.jsp"%>



<script>
document.title = "스샷 게시판"; 
</script>


<div id="pageContainer">
	<div id="centerBox">
		<div id="headerImage"><a href="main.jsp"><img src="images/trans.gif" width="300px" height="80px" style="left:50px; top:30px; position:absolute;"></img></a><div id="headtext">스샷게시판</div></div>
		<div id="intromain">
			<div id="content">
<SCRIPT language="JavaScript">
function Check()
{
if (Form.keyword.value.length < 1) {
	alert("검색어를 입력하세요.");
	Form.keyword.focus(); 
         return false;
	}
}
</SCRIPT>
</HEAD>
<BODY>

<%
String key = request.getParameter("key");
String keyword = request.getParameter("keyword");

String pageNum = request.getParameter("pageNum");
if(pageNum == null){
	pageNum = "1";	
}

int listSize = 9;
int currentPage = Integer.parseInt(pageNum);
int startRow = (currentPage - 1) * listSize + 1;
int endRow = startRow + listSize - 1;
int lastRow = 0;
int i = 0;
String strSQL = "";

Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

String url = "jdbc:odbc:dbMember";
Connection conn = DriverManager.getConnection(url,"","");

Statement stmt = conn.createStatement();
ResultSet rs = null;

if (key==null || keyword==null){
	strSQL = "SELECT count(*) FROM artworkboard";
}else{
	strSQL = "SELECT count(*) FROM artworkboard WHERE " + key + " like '%" + keyword + "%'";
}
rs = stmt.executeQuery(strSQL);
rs.next();
lastRow = rs.getInt(1);

rs.close();
%>

<center>
                                    
<TABLE border='0' width='600' >
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>    

<TABLE border='0'  width='600'>             
	
<%
if(lastRow > 0) {
	if(key==null || keyword==null){
		strSQL = "SELECT * FROM artworkboard WHERE num BETWEEN " + startRow + " and " + endRow;
		rs = stmt.executeQuery(strSQL);
	} else {
		strSQL = "SELECT * FROM artworkboard WHERE " + key + " like '%" + keyword + "%'";
		rs = stmt.executeQuery(strSQL);
	}

	for (i = 0; i < listSize; i++){	
		int j = 0;
%>
		<TR>
<%
		for(j = 0; j < 3; j++){		
			if(rs.next()){

			int listnum = rs.getInt("num");
			String title = rs.getString("title");
			String writedate = rs.getString("writedate");
			String filename = rs.getString("filename");
%>
			<TD>
	
			<TABLE border='2'>
			<TR>
				<TD align=center width='170'>    
				
                                    <%=title %></a></font> 
				</TD>  
			</TR>
			<TR> 
				<TD align=center>
					<a href="write_output.jsp?num=<%=listnum %>&bn=art">
					<img src=<%="fileSave/" + filename %> width="160" height="160">
				</TD>  
			</TR>
			<TR>
			   <TD align=center>
                                       	<%=writedate %>
                                    	   </TD> 
			</TR>
			</TABLE> 
	
		</TD>   
<% 
			}else{
			break;	
		}
		}
		i = i + j;  
%>
		</TR>
<%  
	}	
%>

<TABLE border='0' width='600' >
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE> 
                  	                   
<%
rs.close();
stmt.close();
conn.close();
}

if(lastRow > 0) {
	int setPage = 1;
	int lastPage = 0;
	if(lastRow % listSize == 0)
		lastPage = lastRow / listSize;
	else
		lastPage = lastRow / listSize + 1;

	if(currentPage > 1) {
%>
		<a href="artwork.jsp?pageNum=<%=currentPage-1%>">[이전]</a>	
<%	
	}
	for(i=setPage; i<=lastPage; i++) {
		if (i == Integer.parseInt(pageNum)){
%>
		[<%=i%>]
<%		
		}else{
%>
		<a href="artwork.jsp?pageNum=<%=i%>">[<%=i%>]</a>
<%
		}
	}
	if(lastPage > currentPage) {
%>
		<a href="artwork.jsp?pageNum=<%=currentPage+1%>">[다음]</a>
<%
	}
}
%>  

<TABLE border='0' width='600' >
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>                    

<TABLE border=0 width=600>
	<TR>
		<TD align='center'>	
			<TABLE border='0' >
			<FORM Name='Form' Method='POST' Action='artwork.jsp' OnSubmit='return Check()'>
			<input type='hidden' name='search' value='1'>
			<TR>
				<TD align='right'>
				<select name='key' ">
				<option value='title' selected><font size='2'>
                                                        글제목</font></option>
				<option value='contents'><font size='2'>
                                                        글내용</font></option>
				<option value='name'><font size='2'>
                                                        작성자</font></option>
				</select>
				</TD>
				<TD align='left'>
					<input type='text' name='keyword' 
                                                   value='' size='20' maxlength='30'>
					<input type='submit' value='검색'>
				</td>
			  </TR>
			  </FORM>
			  </TABLE> 
		</TD>

		<TD align='right'>		
		<a href='write.jsp?bn=art'>[등록]</a>				
		</TD>
	</TR>
</TABLE>

</div>
</div>


</div></div>
</div>
		</div>

<%@ include file="bottom.jsp"%>