<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<script type="text/javascript">
	function check(){
		if(account.id.value == '' || account.id.value == null){
			alert('���̵� �Է��ϼ���.');
			id.focus(); 
			return false;
		}else if(account.name.value == '' || account.name.value == null){
			alert('�̸��� �Է��ϼ���.');
			name.focus(); 
			return false;
		}else if(account.pass.value == '' || account.pass.value == null){
			alert('��й�ȣ�� �Է��ϼ���.');
			pass.focus(); 
			return false;
		}else if (account.email.value.indexOf("@") + "" == "-1" ||
			account.email.value.indexOf(".") + "" == "-1" ||
			account.email.value == "" )
		{ 
			alert("E-mail�� �ùٸ��� �Է��ϼ���.");
			account.email.focus();
			return false;
		}else if(account.phone.value == '' || account.phone.value == null){
			alert('��ȭ��ȣ�� �Է��ϼ���.');
			account.phone.focus(); 
			return false;
		}else if(isNaN(account.phone.value)) {
  			alert("��ȭ��ȣ������ ���ڸ� �Է��ϼ���.");
			account.phone.focus(); 
			return false;
		}else{
			var form = document.account;
			form.submit();
		}
	}

document.title = "�÷��̼� ȸ������"; 
</script>


<%@ include file="top.jsp"%>
<div id="pageContainer">
	<div id="centerBox">
		<div id="headerImage"><img src="images/trans.gif" width="300px" height="80px" style="left:50px; top:30px; position:absolute;"></img></a></div>
		<div id="intromain">
			<div id="content">
				<div id="titlefont">ȸ������</div>
				
				<p align="right" style="margin-right:150px;"><font color='red'> * </font> <font color='#666' size='2'> �ʼ� �Է»���</font><p>
			
				<form name="account" method="post" action="member_output.jsp">
				<TABLE border='0' width='200' cellpadding='4' cellspacing='2' align="center">
				<tr>
				<td><font size='5'>���̵�</font> <font color='red'> *</font> <font color='#666' size='2'> �ִ� 10�� �̳�</font> </td>
				</tr>
				<tr>
				<td><font size='5'><input type="text" maxlength="10" name="id" style="width:300px; font-size:22pt; height:40px;"></font></td>
				</tr>
				<tr>
				<td><font size='5'>�̸�</font> <font color='red'> *</font></td>
				</tr>
				<tr>
				<td><input type="text" size="8" maxlength="10" name="name" style="width:200px; font-size:22pt; height:40px;"></td>
				</tr>
				<tr>
				<td><font size='5'>��й�ȣ</font> <font color='red'> *</font></td>
				</tr>
				<tr>
				<td><font size='5'><input type="password" maxlength="20"name="pass" style="width:300px; height:40px; font-size:22pt;"></td>
				</tr>
				<tr>
				<td><font size='5'>��ȭ��ȣ</font> <font color='red'> *</font><font color='#666' size='2'> ���ڸ� �Է°���. </font></td>
				</tr>
				<tr>
				<td><font size='5'><input type="text" maxlength="11" name="phone" style="width:300px; height:40px; font-size:22pt;"></td>
				</tr>
				<tr>
				<td><font size='5'>�̸���</font> <font color='red'> *</font></td>
				</tr>
				<tr>
				<td><input type="text" name="email" maxlength="20" style="width:400px; height:40px; font-size:22pt;"></td>
				</tr>
				<tr>
				<TD align='center' colspan='2' width='100%'>
					<table>
			
				<tr height="50px">
				<td align="center"><input type="button" onclick="check()" value="����"></td>
				<td align="center"><input type="reset" valute="�ٽ� �ۼ�"></td>
				</tr>
					</table>
				</tr>
				</table>
				</TD>
				</form>

</div>
</div>


</div></div>
</div>
		</div>

<%@ include file="bottom.jsp"%>