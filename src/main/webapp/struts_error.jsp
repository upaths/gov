<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>错误提示</title>
	<s:if test="hasFieldErrors()">
		<script language="JavaScript">
			var msg = '';
			<s:iterator value="fieldErrors">
			<s:iterator value="value">
			msg=msg+'<s:property escape='false'/>'+'\n';
			</s:iterator>
			</s:iterator>
			alert(msg);
			window.location.href = "${pageContext.request.contextPath}/";
		</script>

	</s:if>
</head>
<body>
</body>
</html>