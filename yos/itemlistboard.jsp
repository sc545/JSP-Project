<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<HTML>
<HEAD>

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

int listSize = 27;
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
	strSQL = "SELECT * FROM tblItemboard a inner join tblItem b ON a.itemid = b.itemid WHERE a.charid = "+charID+"and num BETWEEN " + startRow + " and " + endRow;
}else{
	strSQL = "SELECT count(*) FROM tblItemboard a inner join tblItem b ON a.itemid = b.itemid WHERE " + key + " like '%" + keyword + "%'";
}
rs = stmt.executeQuery(strSQL);
try{
	rs.next();
	lastRow = rs.getInt(1);
}catch(SQLException ex){
	lastRow = 0;
}


rs.close();
%>

<center>
                                    
<TABLE border='0' width='800' >
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>    
<input type='hidden' name='charID' value=<%=charID%> />
<TABLE border='0'  width='800'>             
	
<%
if(lastRow > 0) {
	if(key==null || keyword==null){
		strSQL = "SELECT * FROM tblItemboard a inner join tblItem b ON a.itemid = b.itemid WHERE a.charid = "+charID+"and num BETWEEN " + startRow + " and " + endRow;
		rs = stmt.executeQuery(strSQL);
	} else {
		strSQL = "SELECT count(*) FROM tblItemboard a inner join tblItem b ON a.itemid = b.itemid WHERE " + key + " like '%" + keyword + "%'";
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
				String itemImage = rs.getString("itemimage");
				int itemID = rs.getInt("itemid");
%>
<TD>
	<FORM METHOD="POST" action="item_buy.jsp?charID=<%=charID%>&itemID=<%=itemID%>">
	<TABLE border='2'>
		<TR> 
			<TD align=center>
				<!--<a href="item_output.jsp?itemID=<%=itemID %>">-->
				<!--<a href="#" onClick="window.open('item_output.jsp?itemID=<%=itemID %>&charID=<%=charID%>', 'windows', 'width=800, height=700, scrollbars=yes'); popWin.focus(); return false;">-->
				<img src=<%="/yos/images/weapon/"+itemImage%> width="250" height="250">
			</TD> 
		</TR>
		<tr>	
			<td align=center> <input type='submit' value='구매'> </td>
			
		</tr>
	</TABLE> 
	</form>
	
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

<TABLE border='0' width='800' >
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
		<a href="listboard.jsp?pageNum=<%=currentPage-1%>">[이전]</a>	
<%	
	}
	for(i=setPage; i<=lastPage; i++) {
		if (i == Integer.parseInt(pageNum)){
%>
		[<%=i%>]
<%		
		}else{
%>
		<a href="listboard.jsp?pageNum=<%=i%>">[<%=i%>]</a>
<%
		}
	}
	if(lastPage > currentPage) {
%>
		<a href="listboard.jsp?pageNum=<%=currentPage+1%>">[다음]</a>
<%
	}
}
%>  

<TABLE border='0' width='800' >
	<TR>
		<TD><hr size='1' noshade>
		</TD>
 	</TR>
</TABLE>                    

<TABLE border=0 width=800>
	<TR>
		<TD align='center'>	

		</TD>

		<TD align='right'>	
	<!-- 등록자리  -->	 			
		</TD>
	</TR>
</TABLE>
                  
</BODY>                     
</HTML>