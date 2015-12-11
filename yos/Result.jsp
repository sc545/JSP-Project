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
			alert("회원 ID가 아닙니다.");
			history.go(-1);
		</script>
<%
	}else if(result ==1){
%>
		<script> 
			alert("비밀번호가 일치하지 않습니다.");
			history.go(-1);
		</script>
<%
	}else{

		session.setAttribute("id", id);
		session.setAttribute("pass", pass);
		response.sendRedirect("main.jsp");

	}



%>


