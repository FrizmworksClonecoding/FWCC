<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<script type="text/javascript" src="${pageContext.request.contextPath}/libs/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
		<title>Insert title here</title>
	</head>
	<body>

	<textarea name="ir1" id="ir1" rows="10" cols="100">�����Ϳ� �⺻���� ������ ��(���� ���)�� ���ٸ� �� value ���� �������� �����ø� �˴ϴ�.</textarea>
	
	<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	 oAppRef: oEditors,
	 elPlaceHolder: "ir1",
	 sSkinURI: "se2/SmartEditor2Skin.html",
	 fCreator: "createSEditor2"
	});
</script>

</body>

</html>