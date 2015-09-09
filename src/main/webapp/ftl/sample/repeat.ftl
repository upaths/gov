<#assign s=JspTaglibs["/WEB-INF/struts-tags.tld"] />
<html>
<head>
    <title>测试循环</title>
</head>
<body>
<#assign x = 1>

<@repeat count=4>
Test ${x}
    <#assign x = x + 1>
</@repeat>

<@repeat count=3 hr=true>
Test
</@repeat>

<@repeat count=3; cnt>
${cnt}. Test
</@repeat>
</body>
</html>