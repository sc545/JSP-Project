<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="top.jsp"%>



<% String bn=request.getParameter("bn");
String num=request.getParameter("num"); 
String rt = request.getHeader("referer");%>

<div id="pageContainer">
	<div id="centerBox">
		<div id="headerImage"></div>
		<div id="intromain">
			<div id="content">
<div id="titlefont2"> <h2>정말로 삭제하시겠습니까?<h2> </div>
<center>
<form>
<input type="button" value="삭제" onclick="location.href='delete.jsp?num=<%=num%>&bn=<%=bn%>'">
<input type="button" value="뒤로가기" onclick="history.go(-1)">

</form>



</div>
</div>


</div></div>
</div>
		</div>

<%@ include file="bottom.jsp"%>