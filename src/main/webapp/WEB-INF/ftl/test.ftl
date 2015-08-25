<#assign s=JspTaglibs["/WEB-INF/struts-tags.tld"] />
<#assign upper = "cn.gov.util.UpperDirective"?new()>
<html>
<head>
    <title>测试</title>
</head>
<body>
<@upper>
bar
<#-- 这里允许使用所有的 FTL -->
    <#list ["red", "green", "blue"] as color>
    ${color}
    </#list>
baaz
</@upper>
</body>
</html>