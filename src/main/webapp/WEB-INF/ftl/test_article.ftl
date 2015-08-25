<#assign s=JspTaglibs["/WEB-INF/struts-tags.tld"] />
<html>
<head>
    <title>文章循环</title>
</head>
<body>
<@article catid=53; article>
    <strong>${article.bt}</strong><br />
</@article>
</body>
</html>