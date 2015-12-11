<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>

<% request.setCharacterEncoding("euc-kr");%>

<%
	String id1 = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");


if (id1.equals("") || id1 == null || pass.equals("") || pass == null || name.equals("") || name == null || phone.equals("") || phone == null || email.equals("") || email == null){
%>				
			<script>
			alert("전부 입력 해주세요!!");	
			history.go(-1);
			</script>
<%
}	
			

		try{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		}catch(ClassNotFoundException ex){
			out.println("ClassNotFoundException");
		}
		try{
			String url = "jdbc:odbc:dbMember";


			Connection conn = DriverManager.getConnection(url, "", "");
			Statement stmt = conn.createStatement();
			ResultSet rs = null;

			String strSQL = "select * from tblMember where id='"+id1+"'";
			rs = stmt.executeQuery(strSQL);

			if(rs.next()){
%>				
				<script>
				alert("이미 있는 아이디 입니다!!");
				history.go(-1);
				</script>

<%
			}else{		
				strSQL = "INSERT INTO tblMember (id, name, pass, phone, email)";
				strSQL+="VALUES ('"+id1+"', '"+name+"', '"+pass+"','"+phone+"', '"+email+"')";
				stmt.executeUpdate(strSQL);
		
				stmt.close();
				conn.close();
			}
		}catch(SQLException ex){out.println("SQLException");}
	

%>


<%@ include file="top.jsp"%>
<div id="pageContainer">
	<div id="centerBox">
		<div id="headerImage"><img src="images/trans.gif" width="300px" height="80px" style="left:50px; top:30px; position:absolute;"></img></a></div>
		<div id="intromain">
			<div id="content">


<div id="titlefont">회원가입을 축하합니다!! <BR> <font size='5'><%=id1 %>님, 새로 로그인해주세요.</font></div>
<BR>
<BR>
<p align="center"><img src="images/TF2_Group.jpg"></img></p>


</div>
</div>


</div></div>
</div>
		</div>

<%@ include file="bottom.jsp"%>

