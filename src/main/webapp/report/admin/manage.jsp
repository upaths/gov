<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>举报信息管理后台</title>
    <link rel="stylesheet" type="text/css" href="../../easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../../easyui/themes/icon.css">
    <script type="text/javascript" src="../../easyui/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="../../easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript">
        function jump(url) {
            $("#admin_frame").attr("src", url);
        }
    </script>
</head>
<body>
<div class="easyui-layout" data-options="fit:true">
    <div data-options="region:'west',split:true" title="菜单" style="width:150px;">
        <ul class="easyui-tree">
            <li>
                <span>功能菜单</span>
                <ul>
                    <li><a href="javascript:jump('signReport.action');void(0);" style="color: #000; text-decoration: none;">署名举报</a></li>
                    <li><a href="javascript:jump('noSignReport.action');void(0);" style="color: #000; text-decoration: none;">匿名举报</a></li>
                    <li><a href="javascript:jump('user_chg_pwd.jsp');void(0);" style="color: #000; text-decoration: none;">修改密码</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <div data-options="region:'center',title:'管理界面'">
        <iframe id="admin_frame" src="" width="100%" height="99%" frameborder="0" />
    </div>
</div>
</body>
</html>
