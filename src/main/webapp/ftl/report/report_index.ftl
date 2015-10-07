<#include "../top.ftl">
<link rel="stylesheet" type="text/css" href="${contextPath}/ftl/report/css/public.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/ftl/report/css/sjjb.css">
<style>
    <!--
    .prompt_bg{
        background-image: url("${contextPath}/ftl/report/images/prompt.png");
        background-position: left center;
        background-repeat: no-repeat;
        width: 740px;
        margin-left: 90px;
        height: 40px;
        margin-top: 10px;
    }
    .prompt_text{
        width: 840px;
        margin-left: 90px;
        text-align: left;
        line-height: 35px;
        color: #0C71BA;
        font-size: 18px;
        font-weight: bolder;
        border-bottom: 1px solid #9CC4E0;
        padding-bottom: 10px;
        text-indent: 0px;
    }
    .button_box{
        width: 1000px;
        height: 60px;
        text-align: center;
    }
    -->
</style>
<div class="page_main">
    <div class="page_main_bg">
        <div class="prompt_bg">
        </div>
        <div class="prompt_text">
            根据“属地管理、分级负责”的原则，请按照被举报人的属地和级别选择相应的举报网站反映问题。
        </div>
        <div class="jb_sj2" style="height: 360px;">
            <div class="left jb_sj2_title">
                <a href="#"> 东营市纪委监察局 </a>
            </div>
            <div class="left link_list_box2">
                <div class="left link_list_item">
                    <a href="<@c.url value="${contextPath}/report_clause.action?org=dongying"/>" target="_blank">东营区</a>
                </div>
                <div class="left link_list_item">
                    <a href="<@c.url value="${contextPath}/report_clause.action?org=hekou"/>" target="_blank">河口区</a>
                </div>
                <div class="left link_list_item">
                    <a href="<@c.url value="${contextPath}/report_clause.action?org=kenli"/>" target="_blank">垦利县</a>
                </div>
                <div class="left link_list_item">
                    <a href="<@c.url value="${contextPath}/report_clause.action?org=lijin"/>" target="_blank">利津县</a>
                </div>
                <div class="left link_list_item">
                    <a href="<@c.url value="${contextPath}/report_clause.action?org=guangrao"/>" target="_blank">广饶县</a>
                </div>
            </div>
        </div>
    </div>
</div>
<#include "../bottom.ftl">