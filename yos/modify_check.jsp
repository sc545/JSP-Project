<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="top.jsp"%>
<div id="pageContainer">
	<div id="centerBox">
		<div id="headerImage"></div>
		<div id="intromain">
			<div id="content">
<script type="text/javascript">
	function check(){
		var pass = "admin";
		if(pass.value == "admin"){
			var form = document.formModifyCheck;
			form.submit();
		}else if(pass.value == '' || pass.value == null){
			alert('��й�ȣ�� �Է����ּ���');
			pass.focus();
			return false;
		}else{
			alert('��й�ȣ�� Ʋ���ϴ�!!');
			pass.focus();
			return false;
		}
	}
</script>
<%	String num = request.getParameter("num");
	String pass=null; %>

<center><h2>������ Ȯ��</h2>

<FORM Name='formModifyCheck' Method='post' Action='modify_output.jsp' onSubmit="return false;">
<input type='hidden' name='num' value='<%=num%>'>
<TABLE border='0' cellSpacing=3 cellPadding=5 align=center>
<TR>
	<TD>
		<font size='3'>��й�ȣ</font>
	</TD>
	<TD>
		<input type='password' maxLength='10' size='10' id='pass'>  <input type='button' onClick='check()' value=' Ȯ�� '>
	</TD>

</TR>
</TABLE>
<a href='main.jsp'>[��Ϻ���]</a>

</div>
</div>


</div></div>
</div>
		</div>

<%@ include file="bottom.jsp"%>