<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/admin_css.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="../easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css">
<script type="text/javascript" src="../easyui/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="../easyui/easyloader.js"></script>
<script type="text/javascript">
	$(function(){
		using('tree', function () {
	        $('#cc').tree({
	        	url:'article_queryCategoryTree.action',
	            onClick:function(node){
	            	if (node.attributes && node.attributes.has_child == 'N') {
						var url = '';
						if (node.attributes.category_type == "1") {
							url = "article_query.action?categoryId="+node.id;
						}else if (node.attributes.category_type == "2") {
							url = "article_toUpdate.action?categoryId="+node.id;
						}else if (node.attributes.category_type == "3") {
							url = "article_query.action?categoryId="+node.id;
						}else if (node.attributes.category_type == "4") {
							url = "article_query.action?categoryId="+node.id;
						}
	            		$('#article_right', window.parent.document).attr("src", "${pageContext.request.contextPath}/admin/"+url);
	            	}
	          	}
	        });
	    });
	}); 
</script>
</head>
<body>
<table border="0" width="200" height="100%" cellpadding="0" cellspacing="0" bgcolor="#C9DEFA">
<tr><td valign="top">
<table width="200" height="45" border="0" cellpadding="0" cellspacing="0" background="images/category_top.jpg" id="1">
  <tr>
    <td width="60" align="center">&nbsp;</td>
    <td class="14">栏目分类</td>
  </tr>
</table>
<table width="180" border="0" cellpadding="0" cellspacing="0">
<tr>
  <td><ul id="cc"></ul></td>
</tr>
</table>
</td></tr>
</table>
</body>
</html>