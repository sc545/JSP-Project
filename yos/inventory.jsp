<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<script>
document.title = "인벤토리 & 구매내역"; 
</script>


<%@ include file="top.jsp"%>

<div id="pageContainer">
	<div id="centerBox">
		<div id="headerImage"><a href="main.jsp"><img src="images/trans.gif" width="300px" height="80px" style="left:50px; top:30px; position:absolute;"></img></a><div id="headtext">인벤토리</div></div>
		<div id="intromain">
			<div id="content">
					<%@ include file="inventoryboard.jsp"%>
	
</div>
</div>


</div></div>
</div>
		</div>

<%@ include file="bottom.jsp"%>