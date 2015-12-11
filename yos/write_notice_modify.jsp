<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="top.jsp"%>
<div id="pageContainer">
	<div id="centerBox">
		<div id="headerImage"><div id="headtext">글 수정하기</div></div>
		<div id="intromain">
			<div id="content">
<%
	String num = request.getParameter("num");
	String bn = request.getParameter("bn");
	String name=null;
	String writedate=null;	
	String title=null;
	String readcount=null;
	String contents=null;
	String filename=null;

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

	try{
		String url = "jdbc:odbc:dbMember";

		Connection conn = DriverManager.getConnection(url, "", "");
		Statement stmt = conn.createStatement();
		String strSQL= "SELECT * FROM noticeboard WHERE num="+num+";";
		ResultSet rs = stmt.executeQuery(strSQL);
		rs.next();
		contents=rs.getString("contents");
		writedate=rs.getString("writedate");
		filename=rs.getString("filename");
		title=rs.getString("title");
		stmt.close();
		conn.close();
			
	}catch(SQLException ex){out.println("SQLException");}

%>
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
			var form = document.formModifyOutput;
			form.submit();
		}
	}
</script>


<center>

<FORM Name='formModifyOutput' Method='post' enctype="multipart/form-data" Action='modify_input.jsp'>
<input type='hidden' name='num' value='<%=num%>'>
<input type='hidden' name='bn' value='<%=bn%>'>
<TABLE border='0' cellSpacing=3 cellPadding=5 align=center>
<TR>
		<TD colspan=2><hr size='2' noshade>
		</TD>
 </TR>
<TR>
	<TD colspan=2><hr size='2' noshade>
	</TD>
</TR>
<TR>
	<TD bgcolor='gray'>
		<font size='3'><b>파일</b></font>
	</TD>
	<TD>
	<input type="file" id='file' name="uploadFile">
	</TD>
</TR>
<TR>
	<TD bgcolor='gray'>
		<font size='3'><b>글 제목</b></font>
	</TD>
	<TD>
		<input type='text' maxLength='30' size='70' id='title' name='title' value='<%=title%>'>
		
	</TD>
</TR>
<TR>
	<TD bgcolor='gray'>
		<font size='3'><b>글 내용</b></font>
	</TD>
	<TD>
		<textArea name='contents' id='contents' rows="15" cols="70" ><%=contents%></textArea>
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
		<input type='button' onClick='check()' value='수정완료'>
		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		<input type='button' onClick='history.go(-1)' value='목록'>
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