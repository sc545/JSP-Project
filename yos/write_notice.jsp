<% String id2=(String)session.getAttribute("id");
	if (((id2 == (null)) || !(id2.equals("admin")))) { %>
<script>
alert('�����ڸ� �� ���� ��� �� �� �ֽ��ϴ�.');
history.go(-1);
</script>


<% } %>



<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="top.jsp"%>
<div id="pageContainer">
	<div id="centerBox">
		<div id="headerImage"><div id="headtext">���� ���</div></div>
		<div id="intromain">
			<div id="content">
<script type="text/javascript">
	function check(){
		var title = document.getElementById('title');
		var contents = document.getElementById('contents');
		
		if(title.value == '' || title.value == null){
			alert('������ �Է����ּ���');
			title.focus(); 
			return false;
		}else if(contents.value == '' || contents.value == null){
			alert('������ �Է����ּ���');
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
		<font size='3'><b>����</b></font>
	</TD>
	<TD>
		<input type="file" name="userFile"><br>	
	</TD>
</TR>
<TR>
	<TD bgcolor='gray'>
		<font size='3'><b>����</b></font>
	</TD>
	<TD>
		<input type='text' id="title" maxLength='30' size='70' name='title'>
		
	</TD>
</TR>
<TR>
	<TD bgcolor='gray'>
		<font size='3'><b>�� ����</b></font>
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
		<input type='reset'  value='�ٽ� �ۼ�'>
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		<input type='button' onClick='check()'  value='���'>
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