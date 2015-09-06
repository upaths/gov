<#assign s=JspTaglibs["/WEB-INF/struts-tags.tld"] />
<html>
<head>
    <title>文章循环</title>
</head>
<body>
<@wy_article catid=48; article>
    <strong>${article.nr}</strong><br />
</@wy_article>
</body>
</html>