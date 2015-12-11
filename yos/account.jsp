<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<script type="text/javascript">
	function check(){
		if(account.id.value == '' || account.id.value == null){
			alert('아이디를 입력하세요.');
			id.focus(); 
			return false;
		}else if(account.name.value == '' || account.name.value == null){
			alert('이름을 입력하세요.');
			name.focus(); 
			return false;
		}else if(account.pass.value == '' || account.pass.value == null){
			alert('비밀번호를 입력하세요.');
			pass.focus(); 
			return false;
		}else if (account.email.value.indexOf("@") + "" == "-1" ||
			account.email.value.indexOf(".") + "" == "-1" ||
			account.email.value == "" )
		{ 
			alert("E-mail을 올바르게 입력하세요.");
			account.email.focus();
			return false;
		}else if(account.phone.value == '' || account.phone.value == null){
			alert('전화번호를 입력하세요.');
			account.phone.focus(); 
			return false;
		}else if(isNaN(account.phone.value)) {
  			alert("전화번호란에는 숫자만 입력하세요.");
			account.phone.focus(); 
			return false;
		}else{
			var form = document.account;
			form.submit();
		}
	}

document.title = "플레이샵 회원가입"; 
</script>


<%@ include file="top.jsp"%>
<div id="pageContainer">
	<div id="centerBox">
		<div id="headerImage"><img src="images/trans.gif" width="300px" height="80px" style="left:50px; top:30px; position:absolute;"></img></a></div>
		<div id="intromain">
			<div id="content">
				<div id="titlefont">회원가입</div>
				
				<p align="right" style="margin-right:150px;"><font color='red'> * </font> <font color='#666' size='2'> 필수 입력사항</font><p>
			
				<form name="account" method="post" action="member_output.jsp">
				<TABLE border='0' width='200' cellpadding='4' cellspacing='2' align="center">
				<tr>
				<td><font size='5'>아이디</font> <font color='red'> *</font> <font color='#666' size='2'> 최대 10자 이내</font> </td>
				</tr>
				<tr>
				<td><font size='5'><input type="text" maxlength="10" name="id" style="width:300px; font-size:22pt; height:40px;"></font></td>
				</tr>
				<tr>
				<td><font size='5'>이름</font> <font color='red'> *</font></td>
				</tr>
				<tr>
				<td><input type="text" size="8" maxlength="10" name="name" style="width:200px; font-size:22pt; height:40px;"></td>
				</tr>
				<tr>
				<td><font size='5'>비밀번호</font> <font color='red'> *</font></td>
				</tr>
				<tr>
				<td><font size='5'><input type="password" maxlength="20"name="pass" style="width:300px; height:40px; font-size:22pt;"></td>
				</tr>
				<tr>
				<td><font size='5'>전화번호</font> <font color='red'> *</font><font color='#666' size='2'> 숫자만 입력가능. </font></td>
				</tr>
				<tr>
				<td><font size='5'><input type="text" maxlength="11" name="phone" style="width:300px; height:40px; font-size:22pt;"></td>
				</tr>
				<tr>
				<td><font size='5'>이메일</font> <font color='red'> *</font></td>
				</tr>
				<tr>
				<td><input type="text" name="email" maxlength="20" style="width:400px; height:40px; font-size:22pt;"></td>
				</tr>
				<tr>
				<TD align='center' colspan='2' width='100%'>
					<table>
			
				<tr height="50px">
				<td align="center"><input type="button" onclick="check()" value="가입"></td>
				<td align="center"><input type="reset" valute="다시 작성"></td>
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