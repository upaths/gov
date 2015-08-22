<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link href="../css/admin_css.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="../script/jquery-1.4.min.js"></script>
    <script charset="utf-8" src="editor/kindeditor-min.js"></script>
    <script charset="utf-8" src="editor/lang/zh_CN.js"></script>
    <script>
        var editor;
        $(function() {
            editor = KindEditor.create('textarea[name="article.nr"]', {
                cssPath : 'editor/plugins/code/prettify.css',
                uploadJson : 'upload_json.jsp',
                fileManagerJson : 'file_manager_json.jsp',
                allowFileManager : true
            });
        });
        function check() {
            var bt = $("#bt");
            var lb = $("#lb");
            var lrrq = $("#lrrq");
            var nr = $("#nr");
            var tzlj = $("#tzlj");
            nr.val(editor.html());
            if (bt.val() == "") {
                alert("标题不能为空！");
                bt.focus();
                return;
            }
            if (lb.val() == "") {
                alert("类别不能为空！");
                lb.focus();
                return;
            }
            if (lrrq.val() == "") {
                alert("时间不能为空！");
                lrrq.focus();
                return;
            }
            <c:if test="${categoryId != 4}">
            if (nr.val() == "") {
                alert("内容不能为空！");
                nr.focus();
                return;
            }
            </c:if>
            <c:if test="${categoryId == 4}">
            if (tzlj.val() == "") {
                alert("跳转链接不能为空！");
                tzlj.focus();
                return;
            }
            </c:if>
            $("#myform").submit();
        }
    </script>
</head>
<body>
<form name="myform" id="myform" action="article_update.action" method="post" enctype="multipart/form-data">
    <input type="hidden" name="categoryId" value="${categoryId}" />
    <input type="hidden" name="article.id" value="${article.id}" />
    <table width="0" height="6" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td></td>
        </tr>
    </table>
    <table width="100%"  border="1" align="center" cellpadding="5" cellspacing="1" bordercolor="#FFFFFF" bgcolor="#C4D8ED">
        <tr bgcolor="#D2E8F6">
            <td height="40" align="center" class="nzcms_table_top" ><a href="javascript:$('#news').toggle();void(0);">说明书<img src="images/help.png" alt="问" border="0" /></a></td>
            <td height="40" align="center" class="nzcms_table_top" >${category.mc}</td>
        </tr>
        <tr bgcolor="#D2E8F6">
            <td height="40" colspan="2" align="left" class="zfb"  id='news' style='DISPLAY:none '>
                <strong>添加说明书：</strong><br /><ol> <li>在此页面修改内容信息；</li>
            </ol></td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td width="10%" height="30" align="center" bgcolor="#E4EDF9" >标题：</td>
            <td height="30" class="gray"><input name="article.bt" type="text" id="bt" size="50" maxlength="100" value="${article.bt}"/>
                <font color="red">*</font> 信息标题
                <input type="hidden" name="article.lb" value="${article.lb}" />
            </td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td width="10%" height="30" align="center" bgcolor="#E4EDF9" >短标题：</td>
            <td height="30" class="gray"><input name="article.dbt" type="text" id="dbt" size="30" maxlength="50" value="${article.dbt}"/>
                信息短标题
            </td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td width="10%" height="30" align="center" bgcolor="#E4EDF9" >关键词：</td>
            <td height="30"><input name="article.gjc" type="text" id="gjc" size="50" maxlength="100" value="${article.gjc}" />
                <FONT color=gray></FONT></td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td width="10%" height="30" align="center" bgcolor="#E4EDF9" >摘要：</td>
            <td height="30"><input name="article.zy" type="text" id="zy" size="50" maxlength="100" value="${article.zy}" />
                <FONT color=gray></FONT></td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td height="30" align="center" bgcolor="#E4EDF9" >来源：</td>
            <td height="30">
                <select name="article.xxly" id="xxly">
                    <option value=""></option>
                    <c:forEach items="${sourceList}" var="item">
                        <option value="${item.id}" <c:if test="${item.id == article.xxly}">selected</c:if>>${item.mc}</option>
                    </c:forEach>
                </select>
                <font color="gray">信息摘取哪里</font></td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td width="10%" height="30" align="center" bgcolor="#E4EDF9">推荐位：</td>
            <td height="30">
                <select name="article.tjw" id="tjw">
                    <option value=""></option>
                    <c:forEach items="${positionList}" var="item">
                        <option value="${item.id}" <c:if test="${item.id == article.tjw}">selected</c:if>>${item.mc}</option>
                    </c:forEach>
                </select>
                <font color="gray">是否推荐到首页</font></td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td height="30" align="center" bgcolor="#E4EDF9" >缩略图：</td>
            <td height="30" valign="middle" class="gray" >
                <input name="image" id="slt" type="file" />
                <input type="hidden" name="article.slt" value="${article.slt}" />
                <c:if test="${!empty article.slt }">
                    <a href="${pageContext.request.contextPath }${article.slt}" target="_blank">点击查看缩略图</a>
                </c:if>
            </td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td height="30" align="center" bgcolor="#E4EDF9" >时间：</td>
            <td height="30" valign="middle" class="gray" ><input name="article.lrrq" id="lrrq" type="text" value="${article.lrrq }" size="20" maxlength="45">
                <font color="red">*</font> 时间可以修改</td>
        </tr>
        <tr bgcolor="#FFFFFF" <c:if test="${category.categoryType == '2'}">style="display: none;" </c:if>>
            <td width="10%" height="30" align="center" bgcolor="#E4EDF9" >审核：</td>
            <td height="30"><input name="article.sfxs" type="checkbox" value="true" <c:if test="${article.sfxs}">checked</c:if> style="vertical-align:middle; margin: 0 4px;">
                <font color="gray">(打&quot;√&quot;则会在网页上面显示，否则为隐藏在后台)</font></td>
        </tr>
        <tr bgcolor="#FFFFFF" <c:if test="${categoryId != 4}">style="display: none;"</c:if>>
            <td width="10%" height="30" align="center" bgcolor="#E4EDF9" >跳转链接：</td>
            <td height="30"><input name="article.tzlj" type="text" id="tzlj" size="50" maxlength="100" value="${article.tzlj}" />
                <FONT color=gray></FONT></td>
        </tr>
        <tr bgcolor="#FFFFFF" <c:if test="${categoryId == 4}">style="display: none;"</c:if>>
            <td width="10%" height="30" align="center" bgcolor="#E4EDF9" >内容：</td>
            <td height="30" valign="top">
                <textarea name="article.nr" id="nr" cols="100" rows="8" style="width:700px;height:370px;visibility:hidden;">${article.nr}</textarea>
            </td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td width="10%" height="30" bgcolor="#E4EDF9" >&nbsp;</td>
            <td height="30"><input type="button" class="button" value=" 提 交 " onclick="check();">
                <input type="reset" class="button" value=" 重 来 ">
                <input type="button" class="button" onClick="history.go(-1);" value=" 返 回 "></td>
        </tr>
    </table>
</form>
</body>
</html>