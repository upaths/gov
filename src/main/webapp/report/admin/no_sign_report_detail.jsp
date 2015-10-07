<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="page" uri="/WEB-INF/page.tld" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ftl/report/css/public.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ftl/report/css/jb_form.css">
<link rel="stylesheet" type="text/css" href=${pageContext.request.contextPath}/ftl/report/css/theme.css">
<link href="${pageContext.request.contextPath}/ftl/report/css/uploadify.css" rel="stylesheet" type="text/css">
	<script type="text/javascript">
		function check() {
			var answer = document.getElementById("answer").value;
			if (answer == "") {
				alert("答复内容不能为空！");
				document.getElementById("answer").focus();
				return false;
			}
			if (answer.length > 2000) {
				alert("答复内容最多为2000个字符！");
				document.getElementById("answer").focus();
				return false;
			}
			return true;
		}
	</script>
</head>
<body>
<form action="reportAnswer.action" method="post" onsubmit="return check()">
	<input type="hidden" name="reportMsg.id" value="${reportMsg.id}" />
	<input type="hidden" name="reportMsg.signed" value="false" />
	<div class="fj_form_con">
		<div class="sear_table">
			<table cellspacing="0" cellpadding="0" class="table_info">
				<tbody><tr>
					<td colspan="6" class="table_name">
						被举报人（单位）信息
					</td>
				</tr>
				<tr>
					<td class="td_name2" style="width: 90px;">
						被举报人
					</td>
					<td class="td_star" style="width: 15px;">
					</td>
					<td class="td_info" style="width: 300px;">
						${reportMsg.reportedName}
					</td>
					<td class="td_name2" style="width: 90px;">
						单位
					</td>
					<td class="td_star" style="width: 15px;">
					</td>
					<td class="td_info" style="width: 300px;">
						${reportMsg.reportedOrg}
					</td>
				</tr>
				<tr>
					<td class="td_name2">
						职务
					</td>
					<td class="td_star" style="width: 15px;">
					</td>
					<td class="td_info">
						${reportMsg.reportedPost}
					</td>
					<td class="td_name2">
						级别
					</td>
					<td class="td_star" style="width: 15px;">
					</td>
					<td class="td_info">
						${reportMsg.reportedLevel}
					</td>
				</tr>
				</tbody></table>
		</div>
		<div class="sear_table">
			<table cellspacing="0" cellpadding="0" class="table_info">
				<tbody><tr>
					<td colspan="5" class="table_name">
						举报正文
					</td>
				</tr>
				<tr>
					<td class="td_name2" style="width: 115px;">
						标题
					</td>
					<td class="td_star" style="width: 15px;">
					</td>
					<td class="td_info" style="width: 715px;">
						${reportMsg.title}
					</td>
				</tr>
				<tr>
					<td class="td_name2">
						问题类别
					</td>
					<td class="td_star" style="width: 15px;">
					</td>
					<td class="td_info">
						${reportMsg.problemType}
					</td>
				</tr>
				<tr>
					<td class="td_name2">
						问题细类
					</td>
					<td class="td_star" style="width: 15px;">
					</td>
					<td class="td_info">
						${reportMsg.problemTypeDetail}
					</td>
				</tr>
				<tr>
					<td class="td_name2">
						主要问题
					</td>
					<td class="td_star" style="width: 15px;">
					</td>
					<td class="td_info" style="height: 200px;">
						${reportMsg.problem}
					</td>
				</tr>
				</tbody>
			</table>
		</div>
		<div class="sear_table">
			<table cellspacing="0" cellpadding="0" class="table_info">
				<tbody><tr>
					<td colspan="5" class="table_name">
						问题答复
					</td>
				</tr>
				<tr>
					<td class="td_name2" style="width: 115px;">
						已答复
					</td>
					<td class="td_star" style="width: 15px;">
					</td>
					<td class="td_info" style="width: 715px;">
						<input type="checkbox" name="reportMsg.answered" value="true" <c:if test="${reportMsg.answered }">checked</c:if> />
					</td>
				</tr>
				<tr>
					<td class="td_name2">
						答复内容
					</td>
					<td class="td_star" style="width: 15px;">
					</td>
					<td class="td_info" style="height: 150px;">
						<textarea name="reportMsg.answer" cols="85" rows="10" id="answer" style="width: 682px; font-size: 15px;border: 1px solid gray;">${reportMsg.answer}</textarea>
					</td>
				</tr>
				</tbody>
			</table>
		</div>
		<div class="oper_box" style="margin-top: 30px;">
		<table align="center">
			<tbody><tr>
				<td style="width: 100px;">
					<input type="submit" class="but_submit" value="答 复">
				</td>
				<td style="width: 100px;">
					<input type="button" class="but_submit" value="返 回" onclick="history.go(-1)">
				</td>
			</tr>
			</tbody></table>
	</div>
	</div>
</form>
</body>
</html>