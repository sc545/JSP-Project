<%@ page language="java" contentType="text/html;charset=euc-kr"%>
<%@ page import="java.sql.*"%>
<%@ page import="bean.DB"%>

<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");


	DB db = DB.getInstance();
	int result = db.loginCheck(id, pass);

	if(result == 0){
%>
		<script> 
			alert("ȸ�� ID�� �ƴմϴ�.");
			history.go(-1);
		</script>
<%
	}else if(result ==1){
%>
		<script> 
			alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			history.go(-1);
		</script>
<%
	}else{

		session.setAttribute("id", id);
		session.setAttribute("pass", pass);
		response.sendRedirect("main.jsp");

	}



%>


