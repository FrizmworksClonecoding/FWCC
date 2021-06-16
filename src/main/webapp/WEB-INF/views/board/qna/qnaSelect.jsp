<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import
	url="${pageContext.request.contextPath}/WEB-INF/views/templates/head.jsp"></c:import>
</head>
<body>
	<c:import
		url="${pageContext.request.contextPath}/WEB-INF/views/templates/navbar.jsp">
		<c:param name="isCommon" value="true"></c:param>
	</c:import>
	<div id="container">
		<div style="padding: 68px 34px 0;">
			<div class="title" style="margin: 60px 0 40px; text-align: center;">
				<p>Qna</p>
			</div>
			<div>
				<table class="table"
					style="border-collapse: separate; border-spacing: 1px; text-align: left; line-height: 1.5;">
					<tbody>
						<tr>
							<th scope="row"
								style="width: 100px; padding: 10px; font-weight: bold; vertical-align: top;">SUBJECT
							</th>

							<td style="width: 350px; padding: 10px; vertical-align: top;">${qnaVo.title}
							</td>
							<th scope="row"
								style="width: 100px; padding: 10px; font-weight: bold; vertical-align: top;">
							</th>

							<td style="width: 350px; padding: 10px; vertical-align: top;">
							</td>
						</tr>
						<tr>
							<th scope="row"
								style="width: 100px; padding: 10px; font-weight: bold; vertical-align: top;">WRITER
							</th>

							<td style="width: 350px; padding: 10px; vertical-align: top;">${qnaVo.writer}
							</td>
							<th scope="row"
								style="width: 100px; padding: 10px; font-weight: bold; vertical-align: top;">
							</th>

							<td style="width: 350px; padding: 10px; vertical-align: top;">
							</td>
						</tr>
						<tr>
							<th scope="row"
								style="width: 100px; padding: 10px; font-weight: bold; vertical-align: top; border-bottom: 1px solid #ccc;">DATE
							</th>

							<td
								style="width: 100px; padding: 10px; vertical-align: top; border-bottom: 1px solid #ccc;">${qnaVo.regDate}
							</td>
							<th scope="row"
								style="width: 100px; padding: 10px; font-weight: bold; vertical-align: top; border-bottom: 1px solid #ccc;">HIT
							</th>

							<td
								style="width: 1000px; padding: 10px; vertical-align: top; border-bottom: 1px solid #ccc;">${qnaVo.hit}
							</td>
						</tr>
					</tbody>
				</table>
				<div style="text-align: center;">${qnaVo.contents}</div>
				<c:forEach items="${qnaVo.files}" var="fileqnaVo">
					<a
						href="fileDown?fileName=${fileqnaVo.fileName}&oriName=${fileqnaVo.oriName}">${fileqnaVo.oriName}</a>
				</c:forEach>
			</div>
			<table class="table"
					style="border-collapse: separate; border-spacing: 1px; text-align: left; line-height: 1.5; ">
					<tbody>

					<tr>
					<td><div>${cm.writer} ${cm.regDate} </div>
						<div>${cm.contents}</div></td>
					</tr>

					</tbody>
			</table>
			<div>
				<form id="frm" action="./commentInsert" method="post">
					<div class="form-group">
						<label for="writer">Writer:</label> <input type="text"
							class="form-control myCheck" id="writer" name="writer">
					</div>
					<div class="form-group">
						<label for="num">num:</label> <input type="number"
							class="form-control myCheck" id="num" name="num" value="${qnaVo.num}" }>
					</div>

					<div class="form-group" style="margin: auto;">
						<label for="contents">Contents"</label>
						<textarea class="form-control myCheck" id="contents"
							name="contents"></textarea>
					</div>

					<input type="button" id="btn" value="WRITE" class="btn btn-primary">
				</form>
			</div>
		</div>
	</div>
	<c:import
		url="${pageContext.request.contextPath}/WEB-INF/views/templates/footer.jsp"></c:import>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/board/boardInsert.js"></script>
</body>
</html>