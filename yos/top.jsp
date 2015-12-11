<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="bean.DB"%>
<% 
	String id="";
	id=(String)session.getAttribute("id");
%>

<HTML>
<HEAD>

<TITLE>팀 포트리스2 플레이샵</TITLE>


<LINK rel="stylesheet" type="text/css" href="webstyle.css">
<script language="javascript">

	function charOn( cname )
	{
		el = document.getElementById( 'char' + cname );
		el.style.display="block";
	}
	function charOff( cname )
	{
		el = document.getElementById( 'char' + cname );
		el.style.display="none";
		document.getElementById("selectChar").innerHTML = "클래스를 선택하세요!";
	}
	function charMove( cname )
	{
		var c = (cname + ".jsp");
		document.write("<a href='c')</a>");
	}
function loginCheck(){
	var id = document.getElementById('id');
	var pass = document.getElementById('pass');
}

</Script>

</HEAD>



<BODY>

<div id="navBarBGRepeat">
<div id="navBarBG">
<div id="navBar">
<a class="navBarItem" href="main.jsp">
<img border="0" src="images/en_teamfortress_over.png">
</a>
<a class="navBarItem" href="info.jsp">
<img border="0" class="top" src="images/info_over.png">
</a>
<a class="navBarItem" href="inventory.jsp">
<img border="0" class="top" src="images/inventory_over.png">
</a>
<a class="navBarlogIn">

<% 
	if(!((id == null) || id.equals(""))) {
		try{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		}catch(ClassNotFoundException ex){
			out.println("ClassNotFoundException");
		}
		try{
			String url = "jdbc:odbc:dbMember";


			Connection conn = DriverManager.getConnection(url, "", "");
			Statement stmt = conn.createStatement();


			String strSQL = "SELECT id from tblMember WHERE id='"+id+"'";
			ResultSet rs = stmt.executeQuery(strSQL);
			rs.next();
			id = rs.getString("id");
			stmt.close();
			conn.close();
			
		}catch(SQLException ex){out.println(ex);}
		
%>
<FORM METHOD="POST" action="logout.jsp">
	<table>
		<td><font size='4' color="#b35215"><%=id%>님 환영합니다!!</font> </td>
		<td><input type="submit" value="로그아웃"></td>
	</table>	
</form>
		
<% 
	} else {
%>

<FORM METHOD="POST" action="Result.jsp">
	<table>
		<td><font size='4' color="#b35215"> 아이디 </font> </td>
		<td><input type="text" size="8" name="id" id="id"> <td>
		<td><font size='4' color="#b35215"> 비밀번호  </font></td>
		<td><input type="password" size="8" name="pass" id="pass"></td>
		<td><input type="submit" value="로그인" ></td>
	</table>	
</form>

<% 
	}
%>
</a>
</div>
</div>
</div>
