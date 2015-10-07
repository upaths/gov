<#include "../top.ftl">
<link rel="stylesheet" type="text/css" href="${contextPath}/ftl/report/css/public.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/ftl/report/css/search.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/ftl/report/css/button.css">
<script src="${contextPath}/ftl/report/js/common.js" type="text/javascript"></script>
<script type="text/javascript">
    /**查询回复信息**/
    function report_search() {
        var reportRand = Trim(document.getElementById('msgId').value);
        if(reportRand == '') {
            document.getElementById('msgId').focus();
            alert('查询码不能为空!');
            return false;
        } else if(Trim(document.getElementById('rand').value) == '') {
            document.getElementById('rand').focus();
            alert('验证码不能为空!');
            return false;
        } else {
            $.post(
                    '<@c.url value="${contextPath}/report_msg_search.action"/>',
                    {
                        msgId: document.getElementById('msgId').value,
                        rand: document.getElementById('rand').value
                    },
                    function (data) {
                        if(data == 'no_same') {
                            alert('验证码错误，请重新输入!');
                            document.getElementById('rand_img').src='${contextPath}/open/rand.action?d='+new Date();
                            return false;
                        } else if(data == 'no_data') {
                            alert('根据查询码没有找到举报信息！');
                            return false;
                        } else if(data == 'no_answer') {
                            alert('举报尚未答复，请耐心等待！');
                            return false;
                        }  else {
                            document.getElementById('result').innerHTML = data;
                            document.getElementById('rand_img').src='${contextPath}/open/rand.action?d='+new Date();
                        }
                    }
            )
        }
    }
</script>
<div class="page_main" style="padding-bottom: 20px;">
    <div class="page_main_bg">
        <div class="page_main_con" style="width: 720px;">
            <div class="left sear_tit">
                <div class="left sear_tit_con"></div>
            </div>
            <div class="left sear_con">
                <font color="#FF0000">
                    特别提示：请到相应的举报网站查询反馈，此处只能查询反映到山东省纪委举报网站信件的反馈！</font>
            </div>
            <div class="sear_table">
                <form name="searchForm" id="searchForm" method="post">
                    <table cellpadding="0" cellspacing="0" class="table_report">
                        <tbody><tr>
                            <td class="redStar">
                                <font class="red">*</font>
                            </td>
                            <td class="read_cons_sear2" style="text-align: left;">
                                请输入查询码：
                            </td>
                            <td colspan="3" class="report_info" style="text-align: left">
                                <input type="text" name="msgId" value="" maxlength="32" id="msgId" class="font14" style="width: 430px;">
                            </td>
                        </tr>
                        <tr>
                            <td class="redStar">
                                <font class="red">*</font>
                            </td>
                            <td class="read_cons_sear2" style="text-align: left;">
                                验证码：
                            </td>
                            <td class="report_info" style="border: 0px; width: 110px;">
                                <input type="text" name="rand" value="" id="rand" class="font14" style="width: 100px;" maxlength="6">
                            </td>
                            <td class="report_info" style="border: 0px; width: 80px;">
                                <img id="rand_img" src="${contextPath}/open/rand.action?d=<%=new java.util.Date() %>" alt="看不清？点击换一个" onclick="this.src='${contextPath}/open/rand.action?d='+new Date()">
                            </td>
                            <td class="font14 report_info" style="border: 0px; border-right: 1px; width: 345px;">
                                看不清，请点击图片
                            </td>
                        </tr>
                        <tr>
                            <td class="redStar">
                            </td>
                            <td class="read_cons_sear2" style="text-align: left;">
                                操作：
                            </td>
                            <td colspan="3" class="td_mes report_info" style="text-align: left;">
                                <input type="button" class="but_search3" value="查 询" style="margin-left: 10px;" onclick="report_search();">
                            </td>
                        </tr>
                        <tr>
                            <td class="redStar">
                            </td>
                            <td class="read_cons_sear2" style="text-align: left;">
                                答复内容：
                            </td>
                            <td colspan="3" class="font14 report_info" style="padding: 0px;">
                                <div id="result" class="fresult">
                                </div>
                            </td>
                        </tr>
                        </tbody></table>
                </form>
            </div>
        </div>
    </div>
</div>
<#include "../bottom.ftl">