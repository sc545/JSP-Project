<%@ page language="java" contentType="text/html;charset=euc-kr"%>
<%@ page import="java.sql.*, java.util.*"%>
<% request.setCharacterEncoding("euc-kr");%>
<head>
<script>
function close(){
	window.close();
}
</script>
</head>
<%
	String itemID = request.getParameter("itemID");
	String charID = request.getParameter("charID");
	String itemName = null;
	String itemImage = null;
	String itemStat1 = null;
	String itemStat2 = null;
	String itemStat3 = null;
	String itemStat4 = null;
	String tmp = null;
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

	try{
		String url = "jdbc:odbc:dbMember";

		Connection conn = DriverManager.getConnection(url, "", "");
		Statement stmt = conn.createStatement();
		String strSQL = "SELECT * FROM tblItem WHERE itemid="+itemID;
		ResultSet rs = stmt.executeQuery(strSQL);
		rs.next();
		itemName = rs.getString("itemname");
		itemImage = rs.getString("itemimage");
		itemStat1=rs.getString("itemstat1");
		itemStat2=rs.getString("itemstat2");
		itemStat3=rs.getString("itemstat3");
		itemStat4=rs.getString("itemstat4");
		tmp = "/yos/images/weapon/"+itemName;
		stmt.close();
		conn.close();
			
	}catch(SQLException ex){out.println("SQLException");}

%>
<BODY>
<input type='hidden' name='charID' value=<%=charID%> />
<center><h2><%=itemName%></h2>

<FORM Method='post' Action='item_buy.jsp?itemID=<%=itemID%>&charID=<%=charID%>' >
<TABLE border='1' cellSpacing=3 cellPadding=5 align=center>

<TR>
	<Th>
		<font size='3'>무기</font>
	</Th>
	<Th>
		<font size='3'>장탄수</font>
	</Th>
	<Th>
		<font size='3'>소지탄약수</font>
	</Th>
	<Th>
		<font size='3'>피해 범위</font>
	</Th>
	<Th>
		<font size='3'>주석/특수능력</font>
	</Th>

</TR>
<TR>
	<TD>
		<img src=<%="/yos/images/weapon/"+itemImage%> width="160" height="160">
	</TD>
	<TD>
		<%=itemStat1%>
	</TD>
	<TD>
		<%=itemStat2%>
	</TD>
	<TD>
		<%=itemStat3%>
	</TD>
	<TD>
		<%=itemStat4%>
	</TD>
</TR>

</table>
<input type="submit" value="구매"/>
<input type="button" value="닫기" onClick='javascript:window.close();'/>
</form>





	

</BODY>
</HTML>