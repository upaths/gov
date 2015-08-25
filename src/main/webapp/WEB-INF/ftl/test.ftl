<#assign s=JspTaglibs["/WEB-INF/struts-tags.tld"] />
<#assign upper = "cn.gov.util.UpperDirective"?new()>
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