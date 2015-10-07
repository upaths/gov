<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>举报管理员登录</title>
    <link rel="stylesheet" type="text/css" href="../../easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="../../easyui/themes/icon.css">
    <script type="text/javascript" src="../../easyui/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="../../easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript">
        function check() {
            var username = document.getElementById("username");
            var password = document.getElementById("password");
            var rand = document.getElementById("rand");
            if (username.value == "") {
                alert("帐号不能为空！");
                username.focus();
                return false;
            }
            if (password.value == "") {
                alert("密码不能为空！");
                password.focus();
                return false;
            }
            if (rand.value == "") {
                alert("验证码不能为空！");
                rand.focus();
                return false;
            }
            return true;
        }
    </script>
</head>
<body style="width:400px; margin: 200px auto;">
<div class="easyui-panel" title="举报管理员登录" style="width:400px;">
    <div style="padding:10px 60px 20px 60px">
        <form id="ff" action="login.action" method="post" onsubmit="return check()">
            <table cellpadding="5">
                <tr>
                    <td>用户名:</td>
                    <td><input class="easyui-box" type="text" name="username" id="username"></td>
                </tr>
                <tr>
                    <td>密码:</td>
                    <td><input class="easyui-box" type="password" name="password" id="password"></td>
                </tr>
                <tr>
                    <td>验证码:</td>
                    <td><input class="easyui-box" type="text" name="rand" id="rand" maxlength="6"></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <img src="${pageContext.request.contextPath}/open/rand.action?d=<%=new java.util.Date() %>" alt="看不清？点击换一个" onclick="this.src='${pageContext.request.contextPath}/open/rand.action?d='+new Date()">
                    </td>
                </tr>
            </table>
        </form>
        <div style="text-align:center;padding:5px">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
        </div>
    </div>
</div>
<script>
    function submitForm(){
        $('#ff').submit();
    }
    function clearForm(){
        $('#ff').form('clear');
    }
</script>
</body>
</html>