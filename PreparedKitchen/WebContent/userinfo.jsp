<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prepared Kitchen</title>
<link rel="stylesheet" href="/PreparedKitchen/static/base.css"/>
<link rel="stylesheet" href="/PreparedKitchen/css/my_userinfo.css"/>
</head>
<%
	MemberDto dto = (MemberDto)session.getAttribute("memberDto");
%>
<body>
	
	<header>
		<!-- 가장 위 header.jsp 링크 들어 갈 곳 -->
		<%@ include file="static/header.jsp" %>
	</header>
	
	<section>
		<!-- 본문 내용 소분류는 article 태그 이용 -->
		<%@ include file="mypage_menu.jsp" %>
		<h2>회원 정보</h2>
		<form action="login.do?command=updateinfo&id=<%=dto.getId() %>" method="post" >

		<table id="mytable">
			<tr class="userinfo_tr">
				<th>아이디</th>
				<td><input type="text" value="<%=dto.getId() %>" readonly="readonly" name="id"></td>
			</tr>
			<tr class="userinfo_tr">
				<th>비밀번호</th>
				<td><input class="userinfo_chg" type="password" value="<%=dto.getPw()%>" name="pw"></td>
			</tr>
			<tr class="userinfo_tr">
				<th>이름</th>
				<td><input type="text" value="<%=dto.getName()%>" name="name"></td>
			</tr>
			<tr class="userinfo_tr">
				<th>이메일</th>
				<td><input type="text" value="<%=dto.getEmail()%>" readonly="readonly" name="email"></td>
			</tr>
			<tr class="userinfo_tr">
				<th>전화번호</th>
				<td><input type="text" value="<%=dto.getPhone()%>" name="phone"></td>
			</tr>
			<tr class="userinfo_tr">
				<th>주소</th>
				<td><input type="text" value="<%=dto.getAddr()%>" name="addr"></td>
			</tr>
			<tr class="userinfo_tr">
				<th>생년월일</th>
				<td><input type="text" value="<%=dto.getBirth()%>" readonly="readonly" name="birth"></td>
			</tr>
		</table>
		<input type="submit" value="수정">
		</form>
		
	</section>
	
	<footer>
		<!-- 가장 밑 footer.jsp 링크 들어 갈 곳 -->
		<%@ include file="static/footer.jsp" %>
	</footer>
</body>
