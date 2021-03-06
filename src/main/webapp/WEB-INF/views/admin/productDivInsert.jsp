<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html style="height:100%; overflow:auto;">
<head>
<c:import url='${pageContext.request.contextPath}/WEB-INF/views/templates/head.jsp'>
	<c:param name="title" value="-ADMIN"></c:param>
</c:import>
<meta charset="UTF-8">
<style>
	#collab{
		width: 30%;
	}
	#duplCheck{
		margin-left:1%;
	}
	#frm{
		margin-top:3%;
	}
	#addBtn{
		margin-top: 0.5%;
	}
	#divCheckText{
		padding: 1%;
	}
</style>
</head>
<body style="width: 100%; height:100%; display: grid; grid-template-columns: 15% 85%; grid-template-rows:11% auto;">
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/adminHeader.jsp"></c:import>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/adminNav.jsp"></c:import>
<div style="padding:10% 10%; overflow: auto; text-align: center;">
	<h1>Division Insert</h1>
	<form action="/product/divInsert" method="post" id="frm">
		<input type="text" name="collab" id="collab"><input type="button" id="duplCheck" value="중복 확인"/>
		<p id="divCheckText"></p>
	</form>
	<button id="addBtn">추가</button>
</div>
<c:import url="${pageContext.request.contextPath}/WEB-INF/views/templates/adminFooter.jsp"></c:import>
<script type="text/javascript" src="/js/product/divisionInsert.js"></script>
</body>
</html>