<% String id2=(String)session.getAttribute("id");
	if (id2 == null){ %>
<script>
alert('�� ���� ������ �α����ϼ���.');
history.go(-1);
</script>

<% } %>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="top.jsp"%>


<% String bn = request.getParameter("bn");
String boardname = null;
if (bn.equals("art")) {
 	boardname = "���� �ø���";
} 
else if(bn.equals("down")) {
	boardname = "�ڷ� �ø���";
}
else {
	boardname = "�� �۾���";
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
			alert('������ �Է����ּ���');
			title.focus(); 
			return false;
		}else if(contents.value == '' || contents.value == null){
			alert('������ �Է����ּ���');
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
		<font size='3'><b>�ۼ���</b></font>
	</TD>
	<TD>
		<% 
			id=(String)session.getAttribute("id"); %>
		<%=id%>
		
	</TD>
</TR>
<TR>
	<TD bgcolor='gray'>
		<font size='3'><b>����</b></font>
	</TD>
	<TD>
		<input type="file" id='file' name="uploadFile"><br>	
	</TD>
</TR>
<TR>
	<TD bgcolor='gray'>
		<font size='3'><b>����</b></font>
	</TD>
	<TD>
		<input type='text' id='title' maxLength='30' size='70' name='title'>
		
	</TD>
</TR>
<TR>
	<TD bgcolor='gray'>
		<font size='3'><b>�� ����</b></font>
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
		<input type='reset'  value='�ٽ� �ۼ�'>
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		<input type='button' onClick='check()'  value='���'>
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