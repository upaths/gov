<#assign s=JspTaglibs["/WEB-INF/struts-tags.tld"] />
<html>
<head>
    <title>测试</title>
</head>
<body>
<@upper>
    <#list tpxwList as s>
        ${s}<br />
    </#list>
</@upper>
</body>
</html>