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
			alert("�α����� ���� �� �� �ֽ��ϴ�!!"); 
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
					alert("�̹� ������ ĳ���� �Դϴ�!!"); 
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
						alert("ĳ���Ͱ� ���������� ���ŵǾ����ϴ�!!"); 
						history.go(-1);
					</script>				
<%
			
			}
			stmt.close();
			conn.close();
			
		}catch(SQLException ex){out.println(ex);}
	}

%>
