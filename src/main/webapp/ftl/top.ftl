<#assign c=JspTaglibs["/WEB-INF/c.tld"] />
<#assign contextPath = request.contextPath/>
<!doctype html>
<html>
<@configTag; config>
<head>
    <meta charset="utf-8">
    <title>${config.title}</title>
    <meta name="Keywords" content="${config.keyword }" />
    <meta name="Description" content="${config.description }" />
    <link href="${contextPath}/css/style.css" rel="stylesheet" type="text/css">
    <link href="${contextPath}/css/content.css" rel="stylesheet" type="text/css">
    <script src="${contextPath}/easyui/jquery-1.8.0.min.js" 
type="text/javascript"></script>
    <script src="${contextPath}/script/jquery.SuperSlide.js" 
type="text/javascript"></script>
    <script src="${contextPath}/script/jquery.validate.min.js"></script>
    <script src="${contextPath}/script/jquery.validate.plugin.js"></script>
    <script src="${contextPath}/My97DatePicker/WdatePicker.js"></script>
</head>
<body <#if config.preventCopy?? && config.preventCopy>onselectstart="return false" 
oncut="return false;" oncopy="return false;" onpaste="return false"</#if>>
</@configTag>
<div class="mian-container">
    <div class="header">
        <div class="header-nav">
            <div class="header-nav-left"><a href="#" target="_blank">设为首页
</a><span class="span-cut">|</span><a href="#" target="_blank">工作邮箱</a> </div>
            <div class="header-nav-right">
                <div class="header-search">
                    <form action="${contextPath}/search/" target="_blank" method="post">
                        <input name="title" class="keywords" type="text" />
                        <input type="submit" class="btn" value="" />
                    </form>
                </div>
            </div>
        </div>
        <div class="header-nav-background"> </div>
        <div class="header-banner">
            <div class="site-name"></div>
            <div class="site-slider">
                <ul>
                    <li><img src="${contextPath}/pic/1.png"  /></li>
                    <li><img src="${contextPath}/pic/1.png"  /></li>
                    <li><img src="${contextPath}/pic/1.png"  /></li>
                </ul>
            </div>
        </div>
        <div class="header-menu">
            <div class="header-menu-nav">
                <ul>
                    <li><a href="<@c.url value="${contextPath}/index.action"/>"<#if 
pid??&&pid = 0> class="on"</#if>>网站首页</a></li>
                    <@categoryListTag pid=0; list>
                        <#list list as cat>
                            <li><a href="<@c.url value="${contextPath}/list.action?
id=${cat.id}&page=1"/>"<#if pid??&&pid = cat.id> class="on"</#if>>${cat.name}
</a></li>
                        </#list>
                    </@categoryListTag>
                </ul>
            </div>
            <div class="header-menu-background"></div>
        </div>
    </div>