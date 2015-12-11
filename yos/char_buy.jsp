<%@ page language="java" contentType="text/html;charset=euc-kr"%>
<%@ page import="java.sql.*, java.util.*"%>
<% request.setCharacterEncoding("euc-kr");%>


<%
	String itemID = request.getParameter("itemID");
	String charID = request.getParameter("charID");
	String userID = (String)session.getAttribute("id");

	if(userID == null){
%>
		<script> 
			alert("로그인후 구매 할 수 있습니다!!"); 
			history.go(-1);
		</script>	
<%
	}else{

		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	
		try{
			String url = "jdbc:odbc:dbMember";

			Connection conn = DriverManager.getConnection(url, "", "");
			Statement stmt = conn.createStatement();
			ResultSet rs = null;
			String strSQL = "select * from tblMemberChar where memberid = '"+userID+"' and charid = "+charID;
			rs = stmt.executeQuery(strSQL);
			if(rs.next()){
%>
				<script> 
					alert("이미 구매한 캐릭터 입니다!!"); 
					history.go(-1);
				</script>
<%
			}else {
					strSQL = "insert into tblMemberChar values ('"+userID+"', "+charID+")";
					int num = 1 + (Integer.parseInt(charID)-1)*6;
					stmt.executeUpdate(strSQL);
					strSQL = "insert into tblMemberItem values ('"+userID+"', "+num+")";
					stmt.executeUpdate(strSQL);
					strSQL = "insert into tblMemberItem values ('"+userID+"', "+(num+1)+")";
					stmt.executeUpdate(strSQL);
					strSQL = "insert into tblMemberItem values ('"+userID+"', "+(num+2)+")";
					stmt.executeUpdate(strSQL);
%>
					<script> 
						alert("캐릭터가 정상적으로 구매되었습니다!!"); 
						history.go(-1);
					</script>				
<%
			
			}
			stmt.close();
			conn.close();
			
		}catch(SQLException ex){out.println(ex);}
	}

%>
