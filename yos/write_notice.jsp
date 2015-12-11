<% String id2=(String)session.getAttribute("id");
	if (((id2 == (null)) || !(id2.equals("admin")))) { %>
<script>
alert('관리자만 새 글을 등록 할 수 있습니다.');
history.go(-1);
</script>


<% } %>



<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="top.jsp"%>
<div id="pageContainer">
	<div id="centerBox">
		<div id="headerImage"><div id="headtext">공지 등록</div></div>
		<div id="intromain">
			<div id="content">
<script type="text/javascript">
	function check(){
		var title = document.getElementById('title');
		var contents = document.getElementById('contents');
		
		if(title.value == '' || title.value == null){
			alert('제목을 입력해주세요');
			title.focus(); 
			return false;
		}else if(contents.value == '' || contents.value == null){
			alert('내용을 입력해주세요');
			contents.focus();
			return false;
		}else{
			var form = document.formWriteNotice;
			form.submit();
		}
	}
</script>

<center>
<FORM Name='formWriteNotice' Method='post' enctype="multipart/form-data" Action='write_notice_input.jsp'>

<TABLE border='0' cellSpacing=3 cellPadding=5 align=center>
<TR>
		<TD colspan=2><hr size='2' noshade>
		</TD>
 </TR>
<TR>
	<TD bgcolor='gray'>
		<font size='3'><b>파일</b></font>
	</TD>
	<TD>
		<input type="file" name="userFile"><br>	
	</TD>
</TR>
<TR>
	<TD bgcolor='gray'>
		<font size='3'><b>제목</b></font>
	</TD>
	<TD>
		<input type='text' id="title" maxLength='30' size='70' name='title'>
		
	</TD>
</TR>
<TR>
	<TD bgcolor='gray'>
		<font size='3'><b>글 내용</b></font>
	</TD>
	<TD>
		<textArea name='contents' id="contents" rows="15" cols="70"></textArea>
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
</TABLE>

</FORM>


</div>
</div>


</div></div>
</div>
		</div>

<%@ include file="bottom.jsp"%>