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
			String strSQL = "select * from tblMemberChar c inner join tblMemberItem i on c.memberid = i.memberid  where c.memberid = '"+userID+"' and charid = "+charID+" and itemid = "+itemID;
			rs = stmt.executeQuery(strSQL);
			if(rs.next()){
%>
				<script> 
					alert("�̹� ������ ������ �Դϴ�!!"); 
					history.go(-1);
				</script>
<%
			}else {
				strSQL = "SELECT * FROM tblMemberChar where memberid='"+userID+"' and charid="+charID;
				rs = stmt.executeQuery(strSQL);	
				if(rs.next()){

					strSQL = "insert into tblMemberItem values ('"+userID+"', "+itemID+")";
					stmt.executeUpdate(strSQL);
%>
					<script> 
						alert("�������� ���������� ���ŵǾ����ϴ�!!"); 
						history.go(-1);
					</script>				
<%

				}else{
%>
					<script> 
						alert("�ش� ĳ���Ͱ� �����ϴ�!!"); 
						history.go(-1);
					</script>
<%
				}
			}
			stmt.close();
			conn.close();
			
		}catch(SQLException ex){out.println(ex);}
	}

%>
