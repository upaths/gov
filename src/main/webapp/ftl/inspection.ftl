<#include "top.ftl">
    <div class="content">
        <!--列表、内容页面代码  start-->
        <!--列表、内容页面的css请写在content.css文件中的 content container 注释下面-->
        <div class="theCurrent">
            <!--当前  start-->
            所在位置：
            <a href="<@c.url value="${contextPath}/index.action"/>">首页</a>
            >
            <a href="#">巡查信箱</a>
            > 正文
            <!--当前  end-->
        </div>

        <!--巡查信箱-->
        <div class="content-xuncha">
            <div class="c_t15gray"  style="margin:15px 0;">  <p style="text-align: center">　　<span style="font-size:20px; padding-bottom:10px;"><b>巡视受理范围</b></span>　　</p><p>　　根据有关要求和巡视工作职责，本轮巡视省委巡视组主要受理反映县（市、区）党委和人大、政府、政协党组领导班子及其成员的问题以及与巡视工作有关的来信来电来访，重点是关于党风廉政建设、作风建设、执行政治纪律和选拔任用干部方面的举报和反映。其他不属于巡视受理范围的信访问题，将按规定转交有关部门处理。</p></div>
            <table width="868" border="1" cellpadding="10" cellspacing="0" align="center">
                <tr>
                    <td colspan="3" align="center">2015年第二轮巡视单位</td>
                </tr>
                <tr>
                    <td align="center">组别</td>
                    <td align="center">巡视单位</td>
                    <td align="center">邮箱</td>
                </tr>
                <#list inspections as inspection>
                    <tr>
                        <td align="center">${inspection.team}</td>
                        <td align="center">${inspection.organization}</td>
                        <td align="center"><a href="<@c.url value="${contextPath}/inspect_report.action?id=${inspection.id}"/>" target="_blank" >点击进入</a></td>
                    </tr>
                </#list>
            </table>
        </div>

        <div class="clear"></div>
        <!--列表、内容页面代码  end-->
    </div>
<#include "bottom.ftl">
