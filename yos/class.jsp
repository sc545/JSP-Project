<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="top.jsp"%>
<script>
document.title = "ĳ���� & ������ ���� ������"; 
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
say = "\"���� �� �� ��, �������� ���һ�Į�� °��, ��û�� �� �� �� ������... ��!\"";
origin = "��Ǯ, ����Ʋ����, �뿵 ����";
role = "���";
tooltip1 = "������� ����� �ٷ�� ��������, ������ �� ���� ������ �����ϸ� ��� ��Ȳ������ �� �����ϴ� ������ �� ���� �ֽ��ϴ�. ";
tooltip2 = "�״� ���߹� �������μ� ����� ������ �߰Ÿ� ������ ���մϴ�.��ź �߻��� ���� ��ź �߻��� ������ ������� �ϳ��ۿ� ���� ���� ���� �ֺ� ȯ�濡 ���� ������ �̿��Ͽ� ��κ��� ������ ������ ä�� �ϴÿ� ���� ���� �� �ִ� ������ ����ų �� �ֽ��ϴ�.";
}

if ( classpage.equals("sniper")) {
charID = 2;
say = "\"�������̶� �� ���� ��������, ģ��! ��ٷο� ���̾�, �߿ܿ��� ��ٴϰ� ���̾�. �� �����ϰǴ� ���� ���� ���� �ž�.\"";
origin = "����Ʈ���ϸ���";
role = "����Ʈ";
tooltip1 = "����� ������ �������忡�� �¾ Ȥ���� ȣ���� �������� �ڶ� ��ĥ�� �غ�� ������ �������۴� �ָ��� ��ǥ�� �����ϴ� ���� ��ȣ�մϴ�.";
tooltip2 = "���� ���̳� �����ϱ� ����� ������ �������۴� ����� ���� Ŭ�������� �ս��� ������ �� �ֽ��ϴ�. �������۴� ���� �޵��� �����Ͽ� �ڽ��� ������ ������ �� �ִ� ��ȸ�� �ִ� �Ϳ��� �̻����Դϴ�." ;
}


if ( classpage.equals("medic")) {
charID = 3;
say = "\"...���� ���Ḧ �����Ϸ� ����.\"";
origin = "����, ���ٺθ�ũ";
role = "����Ʈ";
tooltip1 = "�޵��� ������ �ǻ��Դϴ�. ���� ���� �ǽ��� �̾������� ������, �׷����� �״� ���� �߿��� ġ�� �����Դϴ�.";
tooltip2 = "�޵��� �Ʊ����� �޵� ���� ����ϰ� ������ �Ʊ��� ü���� ȸ���˴ϴ�. �̹� ü���� ���� �� �ִ� �Ʊ��� �⺻ ü���� �Ѿ� �ִ� 150%���� ��ġ�Ḧ �ް� �˴ϴ�. �λ��� ���� �� ���� �ð��� ���� �Ʊ��� ���� ���� �ӵ��� ȸ���Ǿ� �λ������ ���� ȿ������ ���� ������ �� �ְ� ���ݴϴ�.";
}
if ( classpage.equals("scout")) {
charID = 4;
say = "\"Ǯ�� �ڶ��, ���� ����, �¾��� ������, �׸��� ��, ����� ��.\"";
origin = "�̱�, �Ż��߼��� ��, ������";
role = "����";
tooltip1 = "��ī���� ������ �Ż��߼��� �ֿ��� �¾����, �޸��Ⱑ ������ �߱� ����̷� �ο�� ���� �����մϴ�. ";
tooltip2 = "�״� ���忡�� ���� ���� �����̸�, 2�� �������� �׸� �Ѿư��� �������� ������ �������� ������ Ž���� �� �ְ� ������ �ٰ����� �߻�ü���� ���� �� �ֽ��ϴ�. ��ī���� ��ĳ�Ͱǰ� ����, �߱�����̸� ��� �ٴϸ� ���������� ġ�� ������ ������ ���� �����մϴ�. ";
}

if ( classpage.equals("heavy")) {
charID = 5;
say = "\"������� ���� ���ϼ��ִٰ� ���� �ϳ���. ����, [��½] �Ƹ���. �ٴ� ���ݱ��� �Ѿ��� ���ϼ� �ִ��ڵ��� ��������.\"";
origin = "�Һ�Ʈ ����, �Ϲٷӽ�ũ ����, �ֱ��ָ� ���";
role = "���";
tooltip1 = "�Һ�Ʈ ��ȸ���� ���� ��ȭ������ ã�ƿ� ����� ��ũ���� ���, �� ��� ���� ���̴� �� ��Ʈ����2���� ���� ũ�� ������ Ŭ�����Դϴ�.";
tooltip2 = "���� ���ӿ��� ���� ���� ü�°� ū ���� �����մϴ�. ���� ���� �ӵ� ���� ����� Ư¡�Դϴ�. ����� ȭ���� ��û���� ���� ���İ��� �������� ���� �� �ֽ��ϴ�. �׷��� �̴ϰ��� �����ų� ��� ���߿��� ����� �̵��ӵ��� �����̿� �ٸ������ϴ�. ";
}

if ( classpage.equals("pyro")) {
charID = 6;
say = "\"���ӹ��� �Ϲ��Ϲ� ���ӹ���\"";
origin = "�Ҹ�";
role = "����";
tooltip1 = "���̷δ� ��� �Ҹ��� ��ȭ���Դϴ�. �״� �Ұ� ���õ� ���̶�� �����̵� ��Ÿ������ ������ ��� �ֽ��ϴ�. ";
tooltip2 = "���̷δ� �ռ� ���� ȭ�� ����� ���� �վ� ���� ���¿� �� �ְ�, ���� �̿��Ͽ� ���� ü���� ���Ƹ��� �� �����Ƿ� ���� �� ���� ������ ���մϴ�. ȭ�� ����� �����Ÿ��� ª�� ������ ���̷δ� ��Ÿ����� ���ϹǷ�, ��� ���ݰ� ��ȸ�θ� ���� ��밡 ����� ƴ�� ��� ������ ũ�� �����ϰ� �˴ϴ�.";

}

if ( classpage.equals("engineer")) {
charID = 7;
say = "\"�̺�, ģ��, �� �����Ͼ��. �װ� ���� ������ �ذ��Ѵٴ� ������.\"";
origin = "�̱�, �ػ罺, �� ���̺�";
role = "���";
tooltip1 = "�ε巯�� ��Ҹ��� ��Ȱ�� ������ ��� �ٷ�� �� ����� �ִ� �����Ͼ�� ���� �ο�� �ͺ��� �������� ������ �ִ� �������� �Ǽ��ϰ� �����ϴ� ���� �մϴ�. ";
tooltip2 = "�˰� ������ �߻��ϴ� ��Ʈ�� ��, ��ó�� �ִ� �������� ź��� ü���� �������ִ� ���漭�� �������� �� �� ������ �������� �̵������ִ� �ڷ����Ͱ� �ֽ��ϴ�.";

}



if ( classpage.equals("spy")) {
charID = 8;
say = "\"�׸��� �־��� �����...�״� �츮�� �� �Ѹ��� �� �� �ִٴ� �ų�.\"";
origin = "������";
role = "����Ʈ";
tooltip1 = "������ ����� ������ �����Ǵ� �����̴� ���Ű� ���Ӽ��� ���� ���� ��ī�ο� �纹�� �׺��� �� ��ī�ο� Į�� ���Դϴ�. ";
tooltip2 = "�� ���� ���� �ð���� �̿��Ͽ� �� �ڽ��� �����ϰ� �� �� �ְ�, ������� ���� ô���� ��ġ���� ������ ����� ���·� ����ϴ�. ���� ���� ������ �׸� � ������ �����̵� ��� �����ų �� ������, �ڽ��� �ǽ����� �ʴ� '����'���� �ڿ��� ��� ���� �������� �ڿ� ��ġ��ų �� �ֽ��ϴ�. ���, ������ �ڿ��� ���� �������� Į�� �̿��� ����� �齺���� �������� �� �ѹ��� �����߸��ϴ�.";

}

if ( classpage.equals("soldier")) {
charID = 9;
say = "\"�ο��� Ȯ���� �̱� �� �ִٸ�, �ο��� �Ѵ�!\"";
origin = "�̱�, �߼���";
role = "����";
tooltip1 = "���ݰ� �� ���ÿ� ������ ����ٴ��� ������, ó�� ������ ���ϴ� ������� ���Ӱ� ģ���������� ĳ�����Դϴ�.";
tooltip2 = "������ ���� ������ �����մϴ�. ��� �Ǻ��°� �Ǵܷ��� �����ϰ� �ϴ��� ������ �Ʒ��� �����ϸ鼭 �߻��ϸ� ü���� ���� �Ҹ��ϴ�(���� ������ \"������ �������� �������� ���̴�\") ��ſ� �ڽ��� ���� ���ư��� �� �� �ֽ��ϴ�. �� ����� �� ���� ��ҿ� ���ų� ��ī���� �̴�-���� ����ε� �� �� ���� ���Ա��� ������ �� �� �ֽ��ϴ�.";
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
					<img class="classSelectorSelected" src="images/select/Demoman_emblem_BLU.png" width="44 " border="0" alt="�����" title="�����"> <% }
					else 
					{ %>
					<a class="classSelectorLink" href="?class=demoman" alt="�����"><img src="images/trans.gif" width="46" height="60" border="0" alt="�����" title="�����"></a>
					<% } %>
					<% if ( classpage.equals("sniper")) { %>
					<img class="classSelectorSelected" src="images/select/Sniper_emblem_BLU.png" width="44" border="0" alt="��������" title="��������"> <% }
					else 
					{ %>
					<a class="classSelectorLink" href="?class=sniper"><img src="images/trans.gif" width="46" height="60" border="0" alt="��������" title="��������"></a>
					<% } %>
					<% if ( classpage.equals("medic")) { %>
					<img class="classSelectorSelected" src="images/select/Medic_emblem_BLU.png" width="44" border="0" alt="�޵�" title="�޵�"> <% }
					else 
					{ %>
					<a class="classSelectorLink" href="?class=medic"><img src="images/trans.gif" width="46" height="60" border="0" alt="�޵�" title="�޵�"></a>
					<% } %>
					<% if ( classpage.equals("scout")) { %>
					<img class="classSelectorSelected" src="images/select/Scout_emblem_BLU.png" width="44" border="0" alt="��ī��"  title="��ī��"> <% }
					else 
					{ %>
					<a class="classSelectorLink" href="?class=scout"><img src="images/trans.gif" width="46" height="60" border="0" alt="��ī��" title="��ī��"></a>
					<% } %>
					<% if ( classpage.equals("heavy")) { %>
					<img class="classSelectorSelected" src="images/select/Heavy_emblem_BLU.png" width="44" border="0" alt="���" title="���"> <% }
					else 
					{ %>
					<a class="classSelectorLink" href="?class=heavy"><img src="images/trans.gif" width="46" height="60" border="0" alt="���" title="���"></a>
					<% } %>
					<% if ( classpage.equals("pyro")) { %>
					<img class="classSelectorSelected" src="images/select/Pyro_emblem_BLU.png" width="44" border="0" alt="���̷�" title="���̷�"> <% }
					else 
					{ %>
					<a class="classSelectorLink" href="?class=pyro"><img src="images/trans.gif" width="46" height="60" border="0" alt="���̷�" title="���̷�"></a>
					<% } %>
					<% if ( classpage.equals("engineer")) { %>
					<img class="classSelectorSelected" src="images/select/Engineer_emblem_BLU.png" width="44" border="0" alt="�����Ͼ�"  title="�����Ͼ�"> <% }
					else 
					{ %>
					<a class="classSelectorLink" href="?class=engineer"><img src="images/trans.gif" width="46" height="60" border="0" alt="�����Ͼ�" title="�����Ͼ�"></a>
					<% } %>
					<% if ( classpage.equals("spy")) { %>
					<img class="classSelectorSelected" src="images/select/Spy_emblem_BLU.png" width="44" border="0" alt="������" title="������"> <% }
					else 
					{ %>
					<a class="classSelectorLink" href="?class=spy"><img src="images/trans.gif" width="46" height="60" border="0" alt="������" title="������"></a>
					<% } %>
					<% if ( classpage.equals("soldier")) { %>
					<img class="classSelectorSelected" src="images/select/Soldier_emblem_BLU.png" width="44" border="0" alt="����" title="����"> <% }
					else 
					{ %>
					<a class="classSelectorLink" href="?class=soldier"><img src="images/trans.gif" width="46" height="60" border="0" alt="����" title="����"></a>
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
					��� : <%=origin%><BR>
					���� : <%=role%><BR><BR>
					<div id="fontsizeB">
					<%=tooltip1%> <BR>
					</div>
					<div id="fontsize1"><p><%=tooltip2%><BR></p>
					</div>
				<div id="classBuyButton">
				<a href="char_buy.jsp?charID=<%=charID%>" class="buyout">����\0</a>	
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
				<div id = "defaultitemlist"> ������ ���� </div>
				
				<%@ include file="itemlistboard.jsp"%>
			</div>
		</div>

	</div>
</div>

<%@ include file="bottom.jsp"%>