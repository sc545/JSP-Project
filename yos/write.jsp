<% String id2=(String)session.getAttribute("id");
	if (id2 == null){ %>
<script>
alert('새 글을 쓰려면 로그인하세요.');
history.go(-1);
</script>

<% } %>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="top.jsp"%>


<% String bn = request.getParameter("bn");
String boardname = null;
if (bn.equals("art")) {
 	boardname = "스샷 올리기";
} 
else if(bn.equals("down")) {
	boardname = "자료 올리기";
}
else {
	boardname = "새 글쓰기";
}
%>



<div id="pageContainer">
	<div id="centerBox">
		<div id="headerImage"><div id="headtext"><%=boardname %></div></div>
		<div id="intromain">
			<div id="content">
<script type="text/javascript">
	function check(){
		var title = document.getElementById('title');
		var contents = document.getElementById('contents');
		var file = document.getElementById('file');
		
		if(title.value == '' || title.value == null){
			alert('제목을 입력해주세요');
			title.focus(); 
			return false;
		}else if(contents.value == '' || contents.value == null){
			alert('내용을 입력해주세요');
			contents.focus();
			return false;
		}else{
			var form = document.formWriteData;
 			form.submit();
		}
	}
</script>

<center><FORM Name='formWriteData' Method='post' enctype="multipart/form-data" Action='write_input.jsp'>

<TABLE border='0' cellSpacing=3 cellPadding=5 align=center>
<TR>
		<TD colspan=2><hr size='2' noshade>
		</TD>
 </TR>
<TR>
	<TD bgcolor='gray'>
		<font size='3'><b>작성자</b></font>
	</TD>
	<TD>
		<% 
			id=(String)session.getAttribute("id"); %>
		<%=id%>
		
	</TD>
</TR>
<TR>
	<TD bgcolor='gray'>
		<font size='3'><b>파일</b></font>
	</TD>
	<TD>
		<input type="file" id='file' name="uploadFile"><br>	
	</TD>
</TR>
<TR>
	<TD bgcolor='gray'>
		<font size='3'><b>제목</b></font>
	</TD>
	<TD>
		<input type='text' id='title' maxLength='30' size='70' name='title'>
		
	</TD>
</TR>
<TR>
	<TD bgcolor='gray'>
		<font size='3'><b>글 내용</b></font>
	</TD>
	<TD>
		<textArea name='contents' id='contents' rows="15" cols="70"></textArea>
	</TD>
</TR>
<TR>
	<TD colspan=2><hr size='2' noshade>
	</TD>
</TR>

<TR>
	<TD colspan='2' align='center' >
		<input type='reset'  value='다시 작성'>
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		<input type='button' onClick='check()'  value='등록'>
	</TD>
</TR>
<%
if (bn.equals("art")) { %>
	<input type='hidden' name='bn' value='art'>
<% } 
else if(bn.equals("down")) { %>
	<input type='hidden' name='bn' value='down'>
<% }
else { %>
	<input type='hidden' name='bn' value='free'>
<% } %>
</TABLE>

</FORM>
	
</div>
</div>


</div></div>
</div>
		</div>

<%@ include file="bottom.jsp"%>