<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="top.jsp"%>

<script>
function select(char) {
	el = document.getElementById("selectChar");
	el.innerHTML = char;
}


</script>


<!-- 클래스 선택 버튼 마우스온오버 -->

<!-- 이껏 이미지 영역 좌표 땄는데 에러나서 못씀 마우스 오버 용도로만 -->

<map id="characterMap" name="characterMap">

<area shape="poly" coords="47,11,24,32,21,58,6,74,8,111,2,177,44,228,57,287,120,295,130,176,109,145,104,117,125,98,135,65,114,3,84,4,89,23,46,10" onmouseover="charOn('Demoman')&select('<데모맨>')"; alt="Demoman" title="Demoman">

<area shape="poly" coords="140,35,142,9,151,2,172,1,187,14,191,36,200,61,210,104,223,114,214,154,237,179,229,189,203,184,206,242,208,280,182,318,141,311,148,269,155,245,144,218,137,179,129,151,118,140,123,115,135,95,144,86,135,52,141,34" onmouseover="charOn('Sniper')&select('<스나이퍼>');" alt="Sniper" title="Sniper">

<area shape="poly" coords="198,14,220,107,235,111,232,173,240,187,221,241,223,313,315,311,321,261,322,133,293,114,294,76,320,40,271,15,241,27" onmouseover="charOn('Medic')&select('<메딕>');" alt="Medic" title="Medic">


<area shape="poly" coords="342,46,341,46,346,26,352,12,370,10,392,13,398,31,405,54,407,79,404,101,393,130,402,188,394,268,384,286,390,313,374,332,344,323,322,320,322,287,332,255,323,170,326,144,315,109,298,115,304,82,314,59,326,38,343,48" onmouseover="charOn('Scout')&select('<스카웃>')"; alt="Scout" title="Scout">

<area shape="poly" coords="436,230,437,232,438,320,492,328,542,327,556,271,549,221,588,216,595,159,585,64,529,16,508,1,473,4,462,24,430,3,412,20,422,41,411,86,410,100,402,122,436,231" onmouseover="charOn('Heavy')&select('<헤비>');" alt="Heavy" title="Heavy">

<area shape="poly" coords="597,54,610,44,618,44,634,24,657,35,667,71,695,129,687,147,724,166,733,196,711,218,682,216,674,185,666,249,655,275,653,301,633,325,600,313,602,251,597,218,600,144,590,78,595,53" onmouseover="charOn('Pyro')&select('<파이로>');" alt="Pyro" title="Pyro">

<area shape="poly" coords="670,44,672,44,696,13,719,10,726,21,754,12,771,32,766,58,772,70,788,76,812,166,804,195,791,195,779,247,774,295,781,310,752,317,734,303,707,312,690,266,699,242,700,228,715,223,741,193,732,163,698,144,700,117,675,77,671,44" onmouseover="charOn('Engineer')&select('<엔지니어>');" alt="Engineer" title="Engineer">

<area shape="poly" coords="783,41,796,2,831,14,828,44,842,52,854,77,843,97,851,151,824,231,833,298,806,314,783,282,786,245,792,212,801,203,817,185,822,160,792,59,774,51,780,38,784,37" onmouseover="charOn('Spy')&select('<스파이>');" alt="Spy" title="Spy">

<area shape="poly" coords="851,24,884,2,936,30,981,48,982,93,972,119,960,140,934,125,934,175,924,197,925,248,913,269,923,296,896,305,858,289,838,274,838,244,841,209,862,147,854,94,864,65,851,23" onmouseover="charOn('Soldier')&select('<솔져>');" alt="Soldier" title="Soldier">

</map>

<!-- 메인 컨테이너 시작 -->


<div id="pageContainer">

<!-- 회원가입 페이지 링크 -->
<% 
//	String id="";
//	id=(String)session.getAttribute("id");
	if(id==null || id.equals("")){
%>
<map name="account map">
    <area shape="rect" coords="28,224,183,360" href="" target="" alt="" />
</map>
<div id="accountNow"><p style="margin-top:140px;">가입을<BR> 하시려면 <BR><p style="margin-top:-5px;"><a href="account.jsp">지금가입하기</a></p></p></div>
<%
	}
%>


<!-- 센터박스 시작 -->


	<div id="centerBox">

		<div id="classSel">
			<div id="transparentMapper"><img usemap="#characterMap" src="images/trans.gif" width="984" height="334" border="0" /></div>
			<div class="charOnImage" id="charDemoman" onmouseout="charOff('Demoman')"><a href="class.jsp?class=demoman"><img src="images/classDemoman.png" width="140" height="284" border="0"/></a></div>
			<div class="charOnImage" id="charSniper" onmouseout="charOff('Sniper')"><a href="class.jsp?class=sniper"><img src="images/classSniper.png" width="153" height="306" border="0" /></a></div>
			<div class="charOnImage" id="charMedic" onmouseout="charOff('Medic')"><a href="class.jsp?class=medic"><img src="images/classMedic.png" width="154" height="290" border="0" /></a></div>
			<div class="charOnImage" id="charScout" onmouseout="charOff('Scout')"><a href="class.jsp?class=scout"><img src="images/classScout.png" width="121" height="297" border="0" /></a></div>
			<div class="charOnImage" id="charHeavy" onmouseout="charOff('Heavy')"><a href="class.jsp?class=heavy"><img src="images/classHeavy.png" width="212" height="330" border="0" /></a></div>
			<div class="charOnImage" id="charPyro" onmouseout="charOff('Pyro')"><a href="class.jsp?class=pyro"><img src="images/classPyro.png" width="176" height="306" border="0" /></a></div>
			<div class="charOnImage" id="charEngineer" onmouseout="charOff('Engineer')")"><a href="class.jsp?class=engineer"><img src="images/classEngineer.png" width="158" height="305" border="0" /></a></div>
			<div class="charOnImage" id="charSpy" onmouseout="charOff('Spy')"><a href="class.jsp?class=spy"><img src="images/classSpy.png" width="111" height="298" border="0" /></a></div>
			<div class="charOnImage" id="charSoldier" onmouseout="charOff('Soldier')"><a href="class.jsp?class=soldier"><img src="images/classSoilder.png" width="155" height="285" border="0" /></a></div>
			<div id="headerCharsBGImg"><img usemap="#characterMap" src="images/classAll.png" width="984" height="334" border="0" /></div>
		</div>
		<div class="classfont"><a href="" id="selectChar" class="classfonts">클래스를 선택하세요!</a></div>
		<div id="headerImage"> <a href="main.jsp"><img src="images/trans.gif" width="300px" height="80px" style="left:50px; top:30px; position:absolute;"></img></a>
			<div id="menu">
				<a href="main.jsp" class="notice">홈</a> 
				<a href="downboard.jsp" class="notice">자료실</a>
				<a href="artwork.jsp" class="notice">스크린샷</a>
				<a href="freeboard.jsp" class="notice">게시판</a>
			</div>
		</div>
		<div id="contentMain">
			<div id="leftContent">
<div id="titlefont2"><img src="images/notice.jpg"></div>
<%

	int num = 0;
	String post = request.getParameter("post");
	if (post == null) {
	post = "new"; } else {}
	String writedate=null;	
	String title=null;
	String contents=null;
	String filename=null;
	String tmp=null;
	String strSQL = null;

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");

	try{
		String url = "jdbc:odbc:dbMember";

		Connection conn = DriverManager.getConnection(url, "", "");
		Statement stmt = conn.createStatement();
if(post=="new") {
		strSQL = "SELECT TOP 3 * FROM noticeboard order by num desc";
} else {
		strSQL = "SELECT * FROM noticeboard order by num desc";
}
		ResultSet rs = stmt.executeQuery(strSQL);
		while(rs.next()) {
		num=rs.getInt("num");
		writedate=rs.getString("writedate");
		title=rs.getString("title");
		contents=rs.getString("contents");
		filename=rs.getString("filename");
		tmp = "/yos/fileSave/"+filename;
%>
<FORM Name='write' Method='post' Action='write_input.jsp'>
<TABLE border='0' cellSpacing=1 cellPadding=5 align="center">
<TR>
	<TD>
		<div id="titlefont3"><%=title%></div>
	</TD>
</TR>
<TR>
	<TD>
		<font size='2'>작성시간 :<%=writedate%></font>
		<div id="navNewer">

<% if ((!(id == (null))) && (session.getAttribute("id").equals("admin"))) { %>
		<a href="write_notice_modify.jsp?num=<%=num%>&bn=notice">[수정]</a>
		<a href="delete_check.jsp?num=<%=num%>&bn=notice">[삭제]</a>
<% } else  { %><% } %>
		</div>
	</TD>
</TR>
<% if(!(filename==null)) {%>

<TR>
	<TD>
	<img src="<%=tmp%>" width="540" style="margin-bottom:15px;"></img>
	</TD>
	</TR>

<% }
%>




<TR>
		<TD>
<%=contents%>
		</TD>
</TR>
<TR>
	<TD><hr size='2' noshade>
	</TD>
</TR>
</TABLE>
</FORM>

<%
}
		stmt.close();
		conn.close();
			
	}catch(SQLException ex){out.println("SQLException");}

%>


<div id="navLink">
<% if(!(post=="new")) { %>
<div id="navNewer"><a href="main.jsp"> 최근 공지사항 보기>></a> </div>
<%} else { %>
<a href="main.jsp?post=all"><<전체 공지사항 보기</a><div id="navNewer"><a href="write_notice.jsp">[등록]</a> </div>
<% } %>


<BR>
<BR>
</div>





</div> 
<!-- 좌측컨텐츠 끝-->




<!-- 우측컨텐츠 시작 -->



			<div id="rightContent">
<BR>
<TABLE>
<TR>
	<TD colspan=2 bgcolor='gray' width="320px">
		<font size='5'><b> 팀 포트리스 현재상태 :</b></font>
	</TD>
</TR>
</TABLE>
<BR>
<div id="banner3"><a href="http://store.steampowered.com/app/440/"><img src="images/f2p.png" width="298px" height="155px"></img></a>
<p style="font-size:9pt;">팀 포트리스 2 는 <b>"프리미엄"</b>과 <b>"무료"</b>로 두개의 주요 계정 유형을 제공합니다. 2011년 6월 23일,  밸브는 게임을 무료화로 채택하였습니다. 무료와 프리미엄 계정은 아이템 제한만 다르고, 게임플레이에 영향을 끼치거나 특정 플레이어에게 어떠한 이점이 주어지는 등의 차이점은 없습니다.</p>
</div>
<TABLE>
<TR>
	<TD colspan=2 bgcolor='gray' width="320px">
		<font size='5'><b> 유용한 사이트 링크 :</b></font>
	</TD>
</TR>
</TABLE>
<BR>
<div id="banner"><a href="http://steamcommunity.com/app/440/workshop/"><img src="images/trans.gif" width="298px" height="155px"></a>
</div>
<div id="banner2"><a href="https://wiki.teamfortress.com/wiki/Main_Page"><img src="images/trans.gif" width="298px" height="155px"></a>
</div>

</div>


</div>

			
		</div>
	</div>
</div>
<%@ include file="bottom.jsp"%>