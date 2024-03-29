<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Prepared Kitchen</title>
<link rel="stylesheet" href="/PreparedKitchen/static/base.css"/>
<style type="text/css">
td{text-align: center;}
input, select, option {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;  
     font-size: 11px;
}
input, select {
    width:80px;
    height:20px;
    border : 1px #ccc solid;
    vertical-align:top;
}
.usertable{
	  width: 100%;
    border-collapse: separate;
    border-spacing: 0px;
    border-top: 2px solid #b2b83b;
}
.usertable th{
	border-bottom: 1px solid #eaeaea;
	text-align: center;
}
.usertable td {
    font-weight: normal;
    color: #5a5a5a;
    text-align: center;
    line-height: 130%;
    vertical-align: middle;
    padding: 10px 0;
    font-size: 13px;
    border-bottom: 1px solid #eaeaea;
}

</style>

<script type="text/javascript">
	function selectMember(arg){
		
		location.href="member.do?command="+arg
	}
</script>

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
		<%@ include file="manager_menu.jsp" %>
		<h2>회원 정보</h2>
		<table>
			<tr>
				<td>
					<select name="member" onchange="selectMember(this.value)">
						<option value="usermanagement">전체보기</option>
						<option value="hiuser">가입된 회원</option>
						<option value="byeuser">탈퇴한 회원</option>
					</select>
				</td>
			</tr>
		</table>
		<div>
		<table class="usertable">
		<col width="8%">
		<col width="8%">
		<col width="12%">
		<col width="12%">
		<col width="20%">
		<col width="5%">
		<col width="10%">
		<col width="*%">
		<col width="10%">
			<tr>
				<th>I    D</th>
				<th>이      름</th>
				<th>E-mail</th>
				<th>전화번호</th>
				<th>주      소</th>
				<th>가입여부</th>
				<th>생년월일</th>
				<th>가  입  일</th>
				<th>회원등급</th>
			</tr>
			<c:choose>
			<c:when test="${empty list }">
				<tr>
					<td colspan="9"> ----- 와 이게 회원이 없네 ---- </td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">
					<tr>
						<td>${dto.id }</td>
						<td>${dto.name }</td>
						<td>${dto.email }</td>
						<td>${dto.phone }</td>
						<td>${dto.addr }</td>
						<td>
						${dto.enabled }
							<c:if test="${dto.role eq 'USER' and dto.enabled eq 'Y'}">
								<input type="button" value="탈퇴시키기" onclick="location.href='member.do?command=goodbyeuser&id=${dto.id}'">
							</c:if>
						</td>
						<td>${dto.birth }</td>
						<td>${dto.regdate }</td>
						<td>
						${dto.role }
							<c:choose>
								<c:when test="${dto.role eq 'USER' }">
									<input type="button" value="관리자권한 부여" onclick="location.href='member.do?command=managergrant&id=${dto.id}'">
								</c:when>
								<c:when test="${dto.role eq 'MANAGER' }">
									<input type="button" value="관리자권한 회수" onclick="location.href='member.do?command=managercollect&id=${dto.id}'">
								</c:when>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		
		</table>
		</div>
		
		
	</section>
	
	<footer>
		<!-- 가장 밑 footer.jsp 링크 들어 갈 곳 -->
		<%@ include file="static/footer.jsp" %>
	</footer>
</body>
