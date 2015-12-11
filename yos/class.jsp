<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="top.jsp"%>
<script>
document.title = "캐릭터 & 아이템 구매 페이지"; 
</script>
<%
String classpage = request.getParameter("class");
String say = null;
String origin = null;
String role = null;
String tooltip1 = null;
String tooltip2 = null;
int charID=0;

if ( classpage.equals("demoman"))
{
charID = 1;
say = "\"꼬인 선 한 개, 변덕스런 염소산칼륨 째끔, 멍청한 놈 한 명 섞으면... 쾅!\"";
origin = "얼러풀, 스코틀랜드, 대영 제국";
role = "방어";
tooltip1 = "데모맨의 무기는 다루기 힘들지만, 예측할 수 없을 정도로 강력하며 어느 상황에서도 잘 적응하는 팀원이 될 수도 있습니다. ";
tooltip2 = "그는 폭발물 전문가로서 비근접 전투와 중거리 전투에 능합니다.유탄 발사기와 점착 폭탄 발사기로 무장한 데모맨은 하나밖에 없는 좋은 눈과 주변 환경에 대한 지식을 이용하여 대부분의 적들을 조각낸 채로 하늘에 날려 보낼 수 있는 폭발을 일으킬 수 있습니다.";
}

if ( classpage.equals("sniper")) {
charID = 2;
say = "\"저격질이란 참 좋은 직업이지, 친구! 까다로운 일이야, 야외에서 쏘다니고 말이야. 내 보장하건대 절대 굶진 않을 거야.\"";
origin = "오스트레일리아";
role = "서포트";
tooltip1 = "멸망한 국가인 뉴질랜드에서 태어나 혹독한 호주의 오지에서 자란 거칠고 준비된 명사수인 스나이퍼는 멀리서 목표를 제거하는 것을 선호합니다.";
tooltip2 = "높은 곳이나 포착하기 어려운 곳에서 스나이퍼는 헤비같이 느린 클래스들을 손쉽게 제거할 수 있습니다. 스나이퍼는 적의 메딕을 제거하여 자신의 팀에게 전진할 수 있는 기회를 주는 것에도 이상적입니다." ;
}


if ( classpage.equals("medic")) {
charID = 3;
say = "\"...같이 진료를 개시하러 가지.\"";
origin = "독일, 로텐부르크";
role = "서포트";
tooltip1 = "메딕은 독일인 의사입니다. 의학 윤리 의식은 미약할지도 모르지만, 그럼에도 그는 팀의 중요한 치료 병과입니다.";
tooltip2 = "메딕이 아군에게 메디 건을 사용하고 있으면 아군의 체력이 회복됩니다. 이미 체력이 가득 차 있는 아군은 기본 체력을 넘어 최대 150%까지 과치료를 받게 됩니다. 부상을 당한 뒤 오랜 시간이 지난 아군은 더욱 빠른 속도로 회복되어 부상당했을 때의 효율적인 후퇴를 도와줄 수 있게 해줍니다.";
}
if ( classpage.equals("scout")) {
charID = 4;
say = "\"풀은 자라고, 새는 날고, 태양은 빛나고, 그리고 난, 사람을 패.\"";
origin = "미국, 매사추세츠 주, 보스턴";
role = "공격";
tooltip1 = "스카웃은 보스턴 매사추세츠 주에서 태어났으며, 달리기가 빠르고 야구 방망이로 싸우는 것을 좋아합니다. ";
tooltip2 = "그는 전장에서 가장 빠른 병과이며, 2단 도약으로 그를 쫓아가는 느려터진 적들을 따돌리며 지형을 탐색할 수 있고 빠르게 다가오는 발사체들을 피할 수 있습니다. 스카웃은 스캐터건과 권총, 야구방망이를 들고 다니며 공격적으로 치고 빠지는 전술에 아주 적합합니다. ";
}

if ( classpage.equals("heavy")) {
charID = 5;
say = "\"사람들이 나를 속일수있다고 생각 하나봐. 설마, [훌쩍] 아마도. 근대 지금까지 총알을 속일수 있는자들은 못만났어.\"";
origin = "소비에트 연방, 하바롭스크 지방, 주그주르 산맥";
role = "방어";
tooltip1 = "소비에트 사회주의 연방 공화국에서 찾아온 우람한 헐크같은 헤비, 즉 헤비 웨폰 가이는 팀 포트리스2에서 가장 크고 위험한 클래스입니다.";
tooltip2 = "헤비는 게임에서 가장 높은 체력과 큰 총을 과시합니다. 물론 느린 속도 또한 헤비의 특징입니다. 헤비의 화력은 엄청나서 적을 순식간에 벌집으로 만들 수 있습니다. 그러나 미니건을 돌리거나 쏘는 도중에는 헤비의 이동속도는 달팽이와 다름없습니다. ";
}

if ( classpage.equals("pyro")) {
charID = 6;
say = "\"무앙무앙 하바하바 무앙무앙\"";
origin = "불명";
role = "공격";
tooltip1 = "파이로는 출신 불명의 방화광입니다. 그는 불과 관련된 것이라면 무엇이든 불타오르는 애정을 담고 있습니다. ";
tooltip2 = "파이로는 손수 만든 화염 방사기로 불을 뿜어 적을 불태울 수 있고, 불을 이용하여 적의 체력을 갉아먹을 수 있으므로 공격 후 도주 전술에 능합니다. 화염 방사기는 사정거리가 짧기 때문에 파이로는 장거리에서 약하므로, 기습 공격과 우회로를 통해 상대가 방심한 틈을 잡는 전략에 크게 의존하게 됩니다.";

}

if ( classpage.equals("engineer")) {
charID = 7;
say = "\"이봐, 친구, 난 엔지니어야. 그건 내가 문제를 해결한다는 뜻이지.\"";
origin = "미국, 텍사스, 비 케이브";
role = "방어";
tooltip1 = "부드러운 목소리와 쾌활한 성격의 기계 다루는 데 재능이 있는 엔지니어는 직접 싸우는 것보다 팀원에게 도움을 주는 구조물을 건설하고 유지하는 일을 합니다. ";
tooltip2 = "알과 로켓을 발사하는 센트리 건, 근처에 있는 팀원에게 탄약과 체력을 보충해주는 디스펜서와 팀원들을 좀 더 빠르게 전장으로 이동시켜주는 텔레포터가 있습니다.";

}



if ( classpage.equals("spy")) {
charID = 8;
say = "\"그리고 최악의 사실은...그는 우리들 중 한명이 될 수 있다는 거네.\"";
origin = "프랑스";
role = "서포트";
tooltip1 = "프랑스 출신인 것으로 추정되는 스파이는 은신과 속임수로 팀을 돕는 날카로운 양복과 그보다 더 날카로운 칼의 팬입니다. ";
tooltip2 = "그 만의 은폐 시계들을 이용하여 그 자신을 투명하게 할 수 있고, 심지어는 죽은 척으로 눈치없는 적군을 무방비 상태로 만듭니다. 그의 변장 도구는 그를 어떤 형태의 병과이든 모두 변장시킬 수 있으며, 자신을 의심하지 않는 '팀원'들을 뒤에서 찌르기 전에 적군들의 뒤에 위치시킬 수 있습니다. 사실, 적군의 뒤에서 그의 믿음직한 칼을 이용한 재빠른 백스탭은 적군들을 단 한번에 쓰러뜨립니다.";

}

if ( classpage.equals("soldier")) {
charID = 9;
say = "\"싸워서 확실히 이길 수 있다면, 싸워야 한다!\"";
origin = "미국, 중서부";
role = "공격";
tooltip1 = "공격과 방어가 동시에 가능한 다재다능한 솔저는, 처음 게임을 접하는 사람들이 게임과 친해지기좋은 캐릭터입니다.";
tooltip2 = "솔저는 로켓 점프로 유명합니다. 모든 판별력과 판단력을 무시하고 하늘을 등지고 아래를 조준하면서 발사하면 체력을 조금 소모하는(솔저 가라사대 \"고통은 나약함이 떠나가는 것이다\") 대신에 자신을 위로 나아가게 할 수 있습니다. 이 기술로 뜻 밖의 장소에 가거나 스카웃의 이단-점프 기술로도 갈 수 없는 출입금지 구역에 갈 수 있습니다.";
}

%>



<div id="pageContainer">
<a name="top"></a>
	<div id="centerBox">
		<div id="classBanner">
			<img src="images/class_header.png"><a href="main.jsp"><img src="images/trans.gif" width="300px" height="80px" style="left:50px; top:30px; position:absolute;"></img></a>
				<div id="selector">
									<div id="selector2">
					<% if ( classpage.equals("demoman")) { %>
					<img class="classSelectorSelected" src="images/select/Demoman_emblem_BLU.png" width="44 " border="0" alt="데모맨" title="데모맨"> <% }
					else 
					{ %>
					<a class="classSelectorLink" href="?class=demoman" alt="데모맨"><img src="images/trans.gif" width="46" height="60" border="0" alt="데모맨" title="데모맨"></a>
					<% } %>
					<% if ( classpage.equals("sniper")) { %>
					<img class="classSelectorSelected" src="images/select/Sniper_emblem_BLU.png" width="44" border="0" alt="스나이퍼" title="스나이퍼"> <% }
					else 
					{ %>
					<a class="classSelectorLink" href="?class=sniper"><img src="images/trans.gif" width="46" height="60" border="0" alt="스나이퍼" title="스나이퍼"></a>
					<% } %>
					<% if ( classpage.equals("medic")) { %>
					<img class="classSelectorSelected" src="images/select/Medic_emblem_BLU.png" width="44" border="0" alt="메딕" title="메딕"> <% }
					else 
					{ %>
					<a class="classSelectorLink" href="?class=medic"><img src="images/trans.gif" width="46" height="60" border="0" alt="메딕" title="메딕"></a>
					<% } %>
					<% if ( classpage.equals("scout")) { %>
					<img class="classSelectorSelected" src="images/select/Scout_emblem_BLU.png" width="44" border="0" alt="스카웃"  title="스카웃"> <% }
					else 
					{ %>
					<a class="classSelectorLink" href="?class=scout"><img src="images/trans.gif" width="46" height="60" border="0" alt="스카웃" title="스카웃"></a>
					<% } %>
					<% if ( classpage.equals("heavy")) { %>
					<img class="classSelectorSelected" src="images/select/Heavy_emblem_BLU.png" width="44" border="0" alt="헤비" title="헤비"> <% }
					else 
					{ %>
					<a class="classSelectorLink" href="?class=heavy"><img src="images/trans.gif" width="46" height="60" border="0" alt="헤비" title="헤비"></a>
					<% } %>
					<% if ( classpage.equals("pyro")) { %>
					<img class="classSelectorSelected" src="images/select/Pyro_emblem_BLU.png" width="44" border="0" alt="파이로" title="파이로"> <% }
					else 
					{ %>
					<a class="classSelectorLink" href="?class=pyro"><img src="images/trans.gif" width="46" height="60" border="0" alt="파이로" title="파이로"></a>
					<% } %>
					<% if ( classpage.equals("engineer")) { %>
					<img class="classSelectorSelected" src="images/select/Engineer_emblem_BLU.png" width="44" border="0" alt="엔지니어"  title="엔지니어"> <% }
					else 
					{ %>
					<a class="classSelectorLink" href="?class=engineer"><img src="images/trans.gif" width="46" height="60" border="0" alt="엔지니어" title="엔지니어"></a>
					<% } %>
					<% if ( classpage.equals("spy")) { %>
					<img class="classSelectorSelected" src="images/select/Spy_emblem_BLU.png" width="44" border="0" alt="스파이" title="스파이"> <% }
					else 
					{ %>
					<a class="classSelectorLink" href="?class=spy"><img src="images/trans.gif" width="46" height="60" border="0" alt="스파이" title="스파이"></a>
					<% } %>
					<% if ( classpage.equals("soldier")) { %>
					<img class="classSelectorSelected" src="images/select/Soldier_emblem_BLU.png" width="44" border="0" alt="솔져" title="솔져"> <% }
					else 
					{ %>
					<a class="classSelectorLink" href="?class=soldier"><img src="images/trans.gif" width="46" height="60" border="0" alt="솔져" title="솔져"></a>
					<% } %>
				 	</div>
				</div></img>
		</div>
		<div id="class<%=classpage%>">
			<div id="classCard">
				<div id="classSay">
					<h2><%=say%></h2>
				</div>
			  	<div id="classBioText">
					출신 : <%=origin%><BR>
					역할 : <%=role%><BR><BR>
					<div id="fontsizeB">
					<%=tooltip1%> <BR>
					</div>
					<div id="fontsize1"><p><%=tooltip2%><BR></p>
					</div>
				<div id="classBuyButton">
				<a href="char_buy.jsp?charID=<%=charID%>" class="buyout">구매\0</a>	
				</div>
				</div>
			</div>
		</div>
		<div id="classArsenal" <% if ( classpage.equals("engineer")) { %> style="height:648px" <%}; %>>
			<div id="classArsenalCard" <% if ( classpage.equals("engineer")) { %> style="height:684px" <%}; %>>
				<img src="images/arsenal_<%=classpage %>.jpg" width="888"border="0">
				
			</div>
		</div>
		<div id="classItemBuy">
			<div id="classItemBuyCard">
				<div id = "defaultitemlist"> 아이템 구매 </div>
				
				<%@ include file="itemlistboard.jsp"%>
			</div>
		</div>

	</div>
</div>

<%@ include file="bottom.jsp"%>