<%@page import="in.UtilMgr"%>
<%@page import="in.AnswerBean"%>
<%@page import="java.util.Vector"%>
<%@page import="in.QuestionBean"%>
<%@ page  contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%> 
<jsp:useBean id="mgr" class="in.QuestionMgr" />
<jsp:useBean id="amgr" class="in.AnswerMgr" />
<%
    int qnum = Integer.parseInt(request.getParameter("qnum"));
	mgr.hitsAdd(qnum);
	QuestionBean bean = mgr.boardRead(qnum);
	String id = "";
	if(session.getAttribute("id")!=null){
	id = (String)session.getAttribute("id");
	}
	//�о�� �Խù��� ���� �� ������ ���� ���ǿ� ����
	session.setAttribute("bean", bean);
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խñ�</title>
<link href="header.css" rel="stylesheet" type="text/css">
<style>
#body{
background-color: #eee;
padding-bottom: 30px;
height: 100%;
}
#board{
width: 900px;
height: 100%;
background-color: white;
margin:20px auto;
border: 1px solid #ddd;
}
#qTable{
width:800px;
height:90%;
padding-top:50px;
margin: 0px auto;
border-spacing: 0px;
}
#answer{
width: 900px;
height: 100%;
background-color: white;
margin: 20px auto;
border: 1px solid #ddd;
}
#aTable{
width:800px;
height:90%;
padding-top:50px;
margin: 0px auto;
}
.answerList{
width: 900px;
height: 100%;
background-color: white;
margin: 20px auto;
border: 1px solid #ddd;
}
#ta{
background-color: aliceblue;
border: 2px solid #888;
}
#ta:focus{
border: 2px solid #40c700;
outline: none;
}
#abtn{
width: 100px;
height: 50px;
background-color: #40c700;
border: 0px;
color:white;
outline: none;
cursor: pointer;
font-size: 20px;
font-weight: bold;
border-radius: 10px;
}
#tag:link{
color:#888;
text-align: right;
font-size: 15px;
text-decoration: none
}
#tag:visited{
color:#888;
}
#tag:hover{
color:#40c700;
}
.upbtn{
display:none;
margin-top:20px;
margin-left:570px;
margin-bottom:10px;
 width: 100px;
height: 50px;
background-color: #40c700;
border: 0px;
color:white;
outline: none;
cursor: pointer;
font-size: 20px;
font-weight: bold;
border-radius: 10px;
}
.cbtn{
display:none;
margin-top:20px;
margin-left:10px;
margin-bottom:10px;
width: 100px;
height: 50px;
background-color: #40c700;
border: 0px;
color:white;
outline: none;
cursor: pointer;
font-size: 20px;
font-weight: bold;
border-radius: 10px;
}
#btnspan{
float:left;
}
</style>

<script>
function imgcal(con) {
	var e = con;
	return e;
}
function update(aid) {
	var e = document.getElementById(aid);
	
	if(e.style.display=='block'){
	e.style.display='none';
	document.getElementById(1000+aid).style.display='block';
	document.getElementById(10000+aid).style.display='block';
	document.getElementById(11000+aid).style.display='block';
	}else if(e.style.display='none'){
		e.style.display='block';
		document.getElementById(1000+aid).style.display='none';
		document.getElementById(10000+aid).style.display='none';
		document.getElementById(11000+aid).style.display='none';
	}
	
}
function down(filename) {
	document.downFrm.filename.value=filename;
	document.downFrm.submit();
}

function Cal(boardDate) {
	 let today = new Date();   
	 let year = today.getFullYear(); // ����⵵
	 let month = today.getMonth() + 1;  // �����
	 let date = today.getDate();  // ���糯¥
	 let hours = today.getHours(); // �����
	 let minutes = today.getMinutes();  // �����
	 let seconds = today.getSeconds();  // ������
	 
	 let y = boardDate.substring(0,4); //�Խñ� �⵵
	 let mon ="";                     //�Խñ� ��
	 let d ="";                     //�Խñ� ��
	 
	 if(boardDate.substring(5,6)==0){     //���ڸ� ����� 0 ����
		 mon = boardDate.substring(6,7);
	 }else{
		 mon = boardDate.substring(5,7);
	 }
	 
	 if(boardDate.substring(8,9)==0){     //���ڸ� ����� 0 ����
		 d = boardDate.substring(9,10);
	 }else{
		 d = boardDate.substring(8,10);
	 }

	 let h = boardDate.substring(10,13);//�Խù� ��
	 let m = boardDate.substring(14,16);//�Խù� ��
	 let s = boardDate.substring(17,19);//�Խù� ��
	 
	 if(s.substring(0,1)==0)  //���ڸ������ ���� 0�ڸ���
		 s=s.substring(1,2);
	 
	 var nymd = year+"-"+month+"-"+date;  //���� �����
	 var bymd = y+"-"+mon+"-"+d;  //�Խñ� �����
	 
	 if(nymd!=bymd){
	    return bymd;
	 }else if(hours-h>=2){
		return hours-h+"�ð���";
	 }else if(hours-h==1){
		 return m-minutes<=0?"1�ð���":minutes+60-m+"����";
	 }else if(hours==h){
		 return minutes==m?seconds-s+"����":minutes-m+"����";
	 }
}
</script> 
</head>
<body>
<%@ include file="header.jsp" %>
<div id="body">
<hr style="margin-top:0px;margin-bottom: 20px;"> 
<div id="board">
<table id = "qTable">
	<tr><td colspan="4">
	<img  src="img/question.png" style="width: 40px;height: 40px;border-radius: 10px;">
	<a style="font-size: 25px;font-weight: bold;color:#444;"><%=bean.getTitle() %>
	<span style="color:#40c700;"> [ <%=bean.getPoint() %> ]</span></a>
	</td></tr>
		<%if(bean.getFilename()!=null&&!bean.getFilename().equals("")){ %>
	<tr><td colspan="4" align="right">
	<img  src="img/down.png" style="width: 30px;height: 25px;">
	<a href="javascript:down('<%=bean.getFilename() %>')">
	<%=bean.getFilename() %></a>
	<font color="blue">(<%=UtilMgr.intFormat(bean.getFilesize()) %>bytes)</font>
	</td></tr>
	<%} %>
	<tr><td colspan="4" style="padding-top: 50px;padding-bottom: 30px;border-bottom: 2px solid #40c700;"><pre>
	<%if(bean.getFilename()!=null){%>
	<img src="fileupload/<%=bean.getFilename()%>" style="width: 200px;height: 200px;">
	<%} %>
	<%=bean.getContent() %>
	<script>
	//document.write(imgcal('32'));
	</script>
	<pre></td></tr>
<tr>
	<td width="100px" style="padding-bottom: 50px; font-weight: bold;" >
		<%=bean.getId() %>
	</td>
	<td width="100px" style="padding-bottom: 50px;">
		��ȸ�� <%=bean.getHits()%>
	</td>
	<td width="100px" style="padding-bottom: 50px;">
		�亯 <%=bean.getAnswer_count()%>
	</td>
	<td width="500px" align="right" style="padding-bottom: 50px;">
	<%if(id.equals(bean.getId())){ %>
	<a id="tag" href="naver_question_up.jsp?qnum=<%=qnum%>">[����]</a>
	<a id="tag" href="delete_q.jsp?qnum=<%=qnum%>">[����]</a>
	<%} %>
		<script>
			document.write(Cal('<%=bean.getDate()%>'));  //��¥����Լ�
		</script>
	</td>
</tr>
</table>
</div>
<div id="answer">
<form method="post" name="aFrm" action="answerProc.jsp">
<input type="hidden" name="id" value="<%=id %>">
<table id="aTable">
<tr><td>
<img  src="img/question.png" style="width: 40px;height: 40px;border-radius: 10px;">
	<a style="font-size: 25px;font-weight: bold;color:#444;"><%=id%> �� �亯���ּ���.</a>
</td></tr>
<tr>
<td style="padding-top: 30px;"><textarea id="ta" cols="99" rows="20" name="content"></textarea></td>
</tr>
<tr>
<td align="right" style="padding-right: 80px;padding-bottom: 60px;">
<input type="hidden" name ="qnum" value="<%=qnum%>">
<input type="submit" value="�亯�ϱ�" id="abtn"></td>
</tr>
</table>
</form>
</div>
<%Vector<AnswerBean> vlist = amgr.getAnswerList(qnum); 
	for(int i=0;i<vlist.size();i++){ 
	AnswerBean abean = vlist.get(i);
	int aid = 100+i;
	%>
	
<div class="answerList">
<table id="aTable">
<tr><td><img  src="img/question.png" style="width: 40px;height: 40px;border-radius: 10px;">
	<a style="font-size: 25px;font-weight: bold;color:#444;"><%=abean.getId()%>�� �亯</a><a style="margin-left: 480px;">[<%=abean.getGrade() %> ���]</a></td></tr>
<tr><td id="<%=aid%>" width="800px"style="display:block;
padding-top: 50px;padding-bottom: 50px;border-bottom: 2px solid #40c700;"><pre><%=abean.getContent() %></pre></td></tr>


<form method="post" action="naver_answer_up.jsp">
<tr><td style="padding-top: 20px;"><textarea cols="110" rows="15" id="<%=1000+aid%>"
 style="display:none;background-color: aliceblue;" name="content"><%=abean.getContent()%></textarea>
 </td></tr>
 <tr><td>
<span id="btnspan"><input type="submit" value="�����ϱ�" id="<%=10000+aid%>" class="upbtn"></span>
 <span id="btnspan">
 <input type="button" value="����ϱ�" id="<%=11000+aid%>" class="cbtn" onclick="update(<%=aid%>)"></span>
 <input type="hidden" value="<%=abean.getAnum()%>" name="anum">
 <input type="hidden" value="<%=qnum%>" name="qnum">
 </td></tr>
 </form>
 
 
<tr><td  align="right" style="padding-bottom:50px;">

<%if(id.equals(abean.getId())){ %>
	<a id="tag" href="javascript:update(<%=aid%>)">[����]</a>
	<a id="tag" href="delete_a.jsp?anum=<%=abean.getAnum()%>&qnum=<%=qnum%>">[����]</a>
	<%} %>
		<script>
		document.write(Cal('<%=abean.getDate()%>'));  //��¥����Լ�
		</script>
		</td></tr>
</table>
</div>
<%} %>
</div>

<form method="post" name="downFrm" action="download.jsp">
	<input type="hidden" name="filename">
</form>

<!-- my menu -->
<span id="menutable" style="display:none" >
	<table>
	<tr>
	<th colspan="4" align="left" height="10px" width="280px">
	My Menu</th>
	</tr>
		<tr>
			<td>ī��</td>
			<td>���α�</td>
			<td>����</td>
			<td>����</td>
		</tr>
		<tr>
			<td>����</td>
			<td>����</td>
			<td>����Ʈ</td>
			<td>����</td>
		</tr>
		<tr>
			<td>����</td>
			<td>��ȭ</td>
			<td>����</td>
			<td>�ε���</td>
		</tr>
		<tr>
			<td>����</td>
			<td>����</td>
			<td>å</td>
			<td>������</td>
		</tr>
			<tr>
		<td colspan="4" align="center" style="border-top: 1px solid #888;" onclick="location.href='logout.jsp'">�α׾ƿ�</td>
		</tr>
	</table>
</span>
<%@ include file="footer.jsp" %>
</body>
</html>