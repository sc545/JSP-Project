<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*, java.util.*" %>
<% request.setCharacterEncoding("euc-kr"); %>

<HTML>
<HEAD>

<SCRIPT language="JavaScript">
	function Check(){
		if (Form.keyword.value.length < 1) {
			alert("검색어를 입력하세요.");
			Form.keyword.focus(); 
			return false;
		}
	}
</SCRIPT>
</HEAD>
<%
	if(id == null){
%>
		<center> 로그인 해야만 인벤토리를 확인하실 수 있습니다.
<%
	}else{
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

		strSQL = "SELECT mc.charid, charname, charimage FROM tblMemberChar mc inner join tblChar c on mc.charid = c.charid where memberid= '"+id+"' order by mc.charid";

		rs = stmt.executeQuery(strSQL);


%>
<body>
	<center>           
	<img src="images/inven1.jpg" width="804px"></img>
	<TABLE border='0' width='600' >
		<TR>
			<TD><hr size='1' noshade>
			</TD>
	 	</TR>
	</TABLE>    

	<TABLE border='0'  width='600'>             
	
<%
		for (i = 0; i < 9; i++){	
			int j = 0;
%>
			<TR>
<%
			for(j = 0; j < 3; j++){

				if(rs.next()){
					String charName = rs.getString("charname");
					String charImage = rs.getString("charimage");
%>
				<TD>
					<TABLE border='2'>
						<TR>
							<TD align=center width='170'>    
								<%=charName%></a></font> 
							</TD>  
						</TR>

						<TR> 	
							<TD align=center>
								<img src=<%="/yos/images/character/"+charImage%> width="160" height="160">
							</TD>  
						</TR>
					</TABLE>
				</td>
	
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
<center>           
	<img src="images/inven2.jpg" width="804px"></img>
	<TABLE border='0' width='600' >
		<TR>
			<TD><hr size='1' noshade>
			</TD>
	 	</TR>
	</TABLE>
<%
		strSQL = "SELECT mi.itemid, itemimage FROM tblMemberItem mi inner join tblItem i on mi.itemid = i.itemid where memberid= '"+id+"' order by mi.itemid";
		rs = stmt.executeQuery(strSQL);

		for (i = 0; i < 9; i++){	
			int j = 0;
%>
			<TR>
<%
			for(j = 0; j < 3; j++){

				if(rs.next()){
					String itemImage = rs.getString("itemimage");
%>
				<TD>

						<TR> 	
							<TD align=center>
								<img src=<%="/yos/images/weapon/"+itemImage%> width="160" height="160">
							</TD>  
						</TR>
					</TABLE>
				</td>
	
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
%>
</BODY>           

</HTML>