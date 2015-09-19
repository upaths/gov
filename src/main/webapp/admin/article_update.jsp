<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link href="../css/admin_css.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="../easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css">
    <script type="text/javascript" src="../easyui/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="../easyui/easyloader.js"></script>
    <script charset="utf-8" src="editor/kindeditor-min.js"></script>
    <script charset="utf-8" src="editor/lang/zh_CN.js"></script>
    <script src="../My97DatePicker/WdatePicker.js"></script>
    <script>
        <c:if test="${category.categoryType == '1' || category.categoryType == '2' || category.categoryType == '3'}">
        var editor;
        KindEditor.ready(function(K) {
            editor = K.create('textarea[name="article.content"]', {
                cssPath : 'editor/plugins/code/prettify.css',
                uploadJson : 'upload_json.jsp',
                fileManagerJson : 'file_manager_json.jsp',
                allowFileManager : true
            });
        });
        </c:if>
        function check() {
            $("#catId").val($("#catid_tree").combotree('getValue'));
            $("#source_text").val($("#source").combobox('getText'));
            var title = $("#title");
            var date = $("#date");
            if (title.val() == "") {
                alert("标题不能为空！");
                title.focus();
                return;
            }
            if (date.val() == "") {
                alert("时间不能为空！");
                date.focus();
                return;
            }
            <c:if test="${category.categoryType == '1' || category.categoryType == '2' || category.categoryType == '3'}">
            var content = $("#content");
            content.val(editor.html());
            var redirect = $("#redirect");
            var url = $("#url");
            if (redirect.is(':checked')) {
                if (url.val() == "") {
                    alert("跳转链接不能为空！");
                    url.focus();
                    return;
                }
            }else {
                if (content.val() == "") {
                    alert("内容不能为空！");
                    content.focus();
                    return;
                }
            }
            </c:if>
            <c:if test="${category.categoryType == '4'}">
            var redirect = $("#redirect");
            var url = $("#url");
            if (redirect.is(':checked')) {
                if (url.val() == "") {
                    alert("跳转链接不能为空！");
                    url.focus();
                    return;
                }
            }else {
                alert("是否跳转必须选中！");
            }
            </c:if>
            <c:if test="${category.categoryType == '5'}">
            var doc = $("#doc");
            if (doc.val() == "") {
                alert("文件不能为空！");
                doc.focus();
                return;
            }
            </c:if>
            $("#myform").submit();
        }
        function initSource() {
            $("#source").combobox('setText','${article.source}');
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
            <td height="40" align="center" class="nzcms_table_top" >${category.name}</td>
        </tr>
        <tr bgcolor="#D2E8F6">
            <td height="40" colspan="2" align="left" class="zfb"  id='news' style='DISPLAY:none '>
                <strong>添加说明书：</strong><br /><ol> <li>在此页面修改内容信息；</li>
            </ol></td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td width="10%" height="30" align="center" bgcolor="#E4EDF9" >标题：</td>
            <td height="30" class="gray"><input name="article.title" type="text" id="title" size="50" maxlength="100" value="${article.title}"/>
                <font color="red">*</font> 信息标题
            </td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td width="10%" height="30" align="center" bgcolor="#E4EDF9" >短标题：</td>
            <td height="30" class="gray"><input name="article.shortTitle" type="text" id="shortTitle" size="30" maxlength="50" value="${article.shortTitle}"/>
                信息短标题
            </td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td width="10%" height="30" align="center" bgcolor="#E4EDF9" >所属栏目：</td>
            <td height="30" class="gray">
                <input type="hidden" name="article.catId" id="catId" value="${article.catId}" />
                <input id="catid_tree" class="easyui-combotree" data-options="url:'category_queryCategoryTree.action',required:true" value="${article.catId}"/>
            </td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td width="10%" height="30" align="center" bgcolor="#E4EDF9" >关键词：</td>
            <td height="30"><input name="article.keyword" type="text" id="keyword" size="50" maxlength="100" value="${article.keyword}" />
                <FONT color=gray></FONT></td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td width="10%" height="30" align="center" bgcolor="#E4EDF9" >摘要：</td>
            <td height="30"><input name="article.summary" type="text" id="summary" size="50" maxlength="100" value="${article.summary}" />
                <FONT color=gray></FONT></td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td height="30" align="center" bgcolor="#E4EDF9" >来源：</td>
            <td height="30">
                <input type="hidden" name="article.source" id="source_text" />
                <select class="easyui-combobox" id="source" style="width:150px;" data-options="onLoadSuccess(){initSource();}">
                    <c:forEach items="${sourceList}" var="item">
                        <option value="${item.id}">${item.name}</option>
                    </c:forEach>
                </select>
                <font color="gray">信息摘取哪里</font></td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td width="10%" height="30" align="center" bgcolor="#E4EDF9">推荐位：</td>
            <td height="30">
                <select name="article.positionId" id="positionId">
                    <option value=""></option>
                    <c:forEach items="${positionList}" var="item">
                        <option value="${item.id}" <c:if test="${item.id == article.positionId}">selected</c:if>>${item.name}</option>
                    </c:forEach>
                </select>
                <font color="gray">是否推荐到首页</font></td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td height="30" align="center" bgcolor="#E4EDF9" >缩略图：</td>
            <td height="30" valign="middle" class="gray" >
                <input name="image" id="thumb" type="file" />
                <input type="hidden" name="article.thumb" value="${article.thumb}" />
                <c:if test="${!empty article.thumb }">
                    <a href="${pageContext.request.contextPath }${article.thumb}" target="_blank">点击查看缩略图</a>
                </c:if>
            </td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td height="30" align="center" bgcolor="#E4EDF9" >时间：</td>
            <td height="30" valign="middle" class="gray" ><input name="article.date" id="date" type="text" class="Wdate" onfocus="WdatePicker({'dateFmt':'yyyy-MM-dd HH:mm:ss'})" value="<fmt:formatDate value="${article.date}" pattern="yyyy-MM-dd HH:mm:ss" />" size="20">
                <font color="red">*</font> 时间可以修改</td>
        </tr>
        <c:choose>
            <c:when test="${role.roleCode eq 'SUPER_ADMIN' || role.roleCode eq 'SITE_ADMIN'}">
            <tr bgcolor="#FFFFFF" <c:if test="${category.categoryType == '2'}">style="display: none;" </c:if>>
                <td width="10%" height="30" align="center" bgcolor="#E4EDF9" >审核：</td>
                <td height="30"><input name="article.display" type="checkbox" value="true" <c:if test="${article.display}">checked</c:if> style="vertical-align:middle; margin: 0 4px;">
                    <font color="gray">(打&quot;√&quot;则会在网页上面显示，否则为隐藏在后台)</font></td>
            </tr>
            </c:when>
            <c:otherwise>
                <input name="article.display" type="hidden" value="${article.display}" />
            </c:otherwise>
        </c:choose>
        <c:if test="${category.categoryType == '1' || category.categoryType == '2' || category.categoryType == '3'}">
        <tr bgcolor="#FFFFFF">
            <td width="10%" height="30" align="center" bgcolor="#E4EDF9" >内容：</td>
            <td height="30" valign="top">
                <textarea name="article.content" id="content" cols="100" rows="8" style="width:700px;height:370px;visibility:hidden;">${article.content}</textarea>
            </td>
        </tr>
        </c:if>
        <c:if test="${category.categoryType == '1' || category.categoryType == '2' || category.categoryType == '3' || category.categoryType == '4'}">
        <tr bgcolor="#FFFFFF">
            <td width="10%" height="30" align="center" bgcolor="#E4EDF9" >是否跳转：</td>
            <td height="30">
                <input name="article.redirect" id="redirect" type="checkbox" value="true" <c:if test="${article.redirect}">checked</c:if> style="vertical-align:middle; margin: 0 4px;">
                <font color="gray">(打&quot;√&quot;则会直接跳转到链接页面)</font>
            </td>
        </tr>
        <tr bgcolor="#FFFFFF">
            <td width="10%" height="30" align="center" bgcolor="#E4EDF9" >跳转链接：</td>
            <td height="30"><input name="article.url" type="text" id="url" size="50" maxlength="100" value="${article.url}" />
                <FONT color=gray></FONT></td>
        </tr>
        </c:if>
        <c:if test="${category.categoryType == '5'}">
            <tr bgcolor="#FFFFFF">
                <td width="10%" height="30" align="center" bgcolor="#E4EDF9" >文件：</td>
                <td height="30">
                    <input name="doc" type="file" id="doc" />
                    <input type="hidden" name="article.doc" value="${article.doc}" />
                    <c:if test="${!empty article.doc }">
                        <a href="${pageContext.request.contextPath }${article.doc}" target="_blank">点击查看文件</a>
                    </c:if>
                </td>
            </tr>
        </c:if>
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