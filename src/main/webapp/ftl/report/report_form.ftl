<#include "../top.ftl">
<link rel="stylesheet" type="text/css" href="${contextPath}/ftl/report/css/public.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/ftl/report/css/jb_form.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/ftl/report/css/theme.css">
<link href="${contextPath}/ftl/report/css/uploadify.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="${contextPath}/ftl/report/js/common.js"></script>
<script type="text/javascript" src="${contextPath}/ftl/report/js/jb_form.js"></script>

<script type="text/javascript">
    function checkValue() {
        <#if flag?? && flag=1>
        if(myTrim(document.getElementById("reportName").value) == '') {
            alert('举报人姓名不能为空!');
            document.getElementById("reportName").focus();
            return false;
        }
        if(myTrim(document.getElementById("reportId").value) == '') {
            alert('举报人身份证号不能为空!');
            document.getElementById("reportId").focus();
            return false;
        } else if(!isIdCardNo(document.getElementById("reportId").value)){
            alert('身份证号输入错误!');
            document.getElementById("reportId").focus();
            return false;
        }

        if(myTrim(document.getElementById("reportContact").value) == '') {
            alert('举报人联系方式不能为空!');
            document.getElementById("reportContact").focus();
            return false;
        } else if(!isContactTel(document.getElementById("reportContact").value) && !isEmail(document.getElementById("reportContact").value)){
            alert('联系方式输入错误！');
            document.getElementById("reportContact").focus();
            return false;
        }
        if(myTrim(document.getElementById("reportAddress").value) == '') {
            alert('举报人现居住地址不能为空!');
            document.getElementById("reportAddress").focus();
            return false;
        }
        </#if>
        if(myTrim(document.getElementById("reportedName").value) == '') {
            alert('被举报人不能为空!');
            document.getElementById("reportedName").focus();
            return false;
        }
        if(myTrim(document.getElementById("reportedOrg").value) == '') {
            alert('被举报人单位不能为空!');
            document.getElementById("reportedOrg").focus();
            return false;
        }
        if(myTrim(document.getElementById("reportedPost").value) == '') {
            alert('被举报人职务不能为空!');
            document.getElementById("reportedPost").focus();
            return false;
        }
        if(myTrim(document.getElementById("reportedLevel").value) == '') {
            alert('被举报人级别不能为空!');
            document.getElementById("reportedLevel").focus();
            return false;
        }
        if(myTrim(document.getElementById("title").value) == '') {
            alert('举报标题不能为空!');
            document.getElementById("title").focus();
            return false;
        }
        if(myTrim(document.getElementById("problemType").value) == '') {
            alert('举报问题类别不能为空!');
            document.getElementById("problemType").focus();
            return false;
        }
        if(myTrim(document.getElementById("problemTypeDetail").value) == '') {
            alert('举报问题细类不能为空!');
            document.getElementById("problemTypeDetail").focus();
            return false;
        }
        if(myTrim(document.getElementById("problem").value) == '') {
            alert('举报主要问题内容不能为空!');
            document.getElementById("problem").focus();
            return false;
        }
        if(myTrim(document.getElementById("rand").value) == '') {
            alert('验证码不能为空!');
            document.getElementById("rand").focus();
            return false;
        }
        if (document.getElementById("signed").value == "1") {
            document.getElementById("signed").value = "true";
        }else {
            document.getElementById("signed").value = "false";
        }
        return true;
    }
</script>
<form id="reportInfo" name="reportInfo" method="post" action="<@c.url value="${contextPath}/report_msg_insert.action"/>" onsubmit="return checkValue()">
    <div style="height: 0px;">
        <input type="hidden" name="reportMsg.signed" id="signed" value="${flag}">
        <input type="hidden" name="reportMsg.org" value="${org}">
    </div>

    <div class="page_main">
        <div class="page_main_bg">
            <div class="fj_form_con">
                <div class="form_title">
                    <div class="form_title_sm">
                    </div>
                </div>
                <div class="sear_table" style="margin-top: 0px;">
                    <table cellspacing="0" cellpadding="0" class="table_info">
                        <tbody><tr>
                            <td colspan="6" class="table_name">
                                举报人信息（注意:标有
                                <font style="color: red;"> * </font>的必须填写）
                            </td>
                        </tr>
                        <tr>
                            <td class="td_name2" style="width: 90px;">
                                姓名
                            </td>
                            <td class="td_star" style="width: 15px;">
                                <#if flag?? && flag=1><font style="color: red;"> * </font></#if>
                            </td>
                            <td class="td_info" style="width: 300px;">
                                <input type="text" name="reportMsg.reportName" maxlength="30" value="" id="reportName" class="input_text">
                            </td>
                            <td class="td_name2" style="width: 90px;">
                                身份证号
                            </td>
                            <td class="td_star" style="width: 15px;">
                                <#if flag?? && flag=1><font style="color: red;"> * </font></#if>
                            </td>
                            <td class="td_info" style="width: 300px;">
                                <input type="text" name="reportMsg.reportId" id="reportId" maxlength="18" value="" class="input_text">
                            </td>

                        </tr>
                        <tr>
                            <td class="td_name2">
                                联系方式
                            </td>
                            <td class="td_star" style="width: 15px;">
                            <#if flag?? && flag=1><font style="color: red;"> * </font></#if>
                            </td>
                            <td class="td_info">
                                <input type="text" name="reportMsg.reportContact" maxlength="50" value="" id="reportContact" class="input_text">
                            </td>
                            <td class="td_name2">
                                政治面貌
                            </td>
                            <td class="td_star" style="width: 15px;">
                                &nbsp;
                            </td>
                            <td class="td_info">
                                <select name="reportMsg.reportStatus" id="reportStatus" class="input_sele">
                                    <option value="">
                                        ==请选择==
                                    </option>
                                    <option value="中国共产党党员">中国共产党党员</option>
                                    <option value="中共预备党员">中共预备党员</option>
                                    <option value="共青团员">共青团员</option>
                                    <option value="民主党派人士">民主党派人士</option>
                                    <option value="无党派民主人士">无党派民主人士</option>
                                    <option value="群众">群众</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_name2">
                                现居住地址
                            </td>
                            <td class="td_star" style="width: 15px;">
                            <#if flag?? && flag=1><font style="color: red;"> * </font></#if>
                            </td>
                            <td class="td_info">
                                <input type="text" name="reportMsg.reportAddress" maxlength="100" value="" id="reportAddress" class="input_text">
                            </td>
                            <td class="td_name2">
                                级别
                            </td>
                            <td class="td_star" style="width: 15px;">
                                &nbsp;
                            </td>
                            <td class="td_info">
                                <select name="reportMsg.reportLevel" id="reportLevel" class="input_sele">
                                    <option value="">
                                        ==请选择==
                                    </option>
                                    <option value="省部级(含)以上">省部级(含)以上</option>
                                    <option value="地厅级">地厅级</option>
                                    <option value="县处级">县处级</option>
                                    <option value="乡科级">乡科级</option>
                                    <option value="一般干部">一般干部</option>
                                    <option value="其他军队人员">其他军队人员</option>
                                    <option value="其他金融机构">其他金融机构</option>
                                    <option value="其他一般企业">其他一般企业</option>
                                    <option value="其他事业人员">其他事业人员</option>
                                    <option value="其他农村人员">其他农村人员</option>
                                    <option value="其他人员">其他人员</option>
                                </select>
                            </td>
                        </tr>

                        </tbody></table>
                </div>
                <div class="sear_table">
                    <table cellspacing="0" cellpadding="0" class="table_info">
                        <tbody><tr>
                            <td colspan="6" class="table_name">
                                被举报人（单位）信息（注意:标有
                                <font style="color: red;"> * </font>的必须填写）
                            </td>
                        </tr>
                        <tr>
                            <td class="td_name2" style="width: 90px;">
                                被举报人
                            </td>
                            <td class="td_star" style="width: 15px;">
                                <font style="color: red;"> * </font>
                            </td>
                            <td class="td_info" style="width: 300px;">
                                <input type="text" name="reportMsg.reportedName" id="reportedName" maxlength="30" value="" class="input_text">
                            </td>
                            <td class="td_name2" style="width: 90px;">
                                单位
                            </td>
                            <td class="td_star" style="width: 15px;">
                                <font style="color: red;"> * </font>
                            </td>
                            <td class="td_info" style="width: 300px;">
                                <input type="text" name="reportMsg.reportedOrg" id="reportedOrg" maxlength="100" value="" class="input_text">
                            </td>
                        </tr>
                        <tr>
                            <td class="td_name2">
                                职务
                            </td>
                            <td class="td_star" style="width: 15px;">
                                <font style="color: red;"> * </font>
                            </td>
                            <td class="td_info">
                                <input type="text" name="reportMsg.reportedPost" id="reportedPost" maxlength="30" value="" class="input_text">
                            </td>
                            <td class="td_name2">
                                级别
                            </td>
                            <td class="td_star" style="width: 15px;">
                                <font style="color: red;"> * </font>
                            </td>
                            <td class="td_info">
                                <select name="reportMsg.reportedLevel" id="reportedLevel" class="input_sele">
                                    <option value="">
                                        ==请选择==
                                    </option>
                                    <option value="省部级(含)以上">省部级(含)以上</option>
                                    <option value="地厅级">地厅级</option>
                                    <option value="县处级">县处级</option>
                                    <option value="乡科级">乡科级</option>
                                    <option value="一般干部">一般干部</option>
                                    <option value="其他军队人员">其他军队人员</option>
                                    <option value="其他金融机构">其他金融机构</option>
                                    <option value="其他一般企业">其他一般企业</option>
                                    <option value="其他事业人员">其他事业人员</option>
                                    <option value="其他农村人员">其他农村人员</option>
                                    <option value="其他人员">其他人员</option>
                                </select>
                            </td>
                        </tr>
                        </tbody></table>
                </div>
                <div class="sear_table">
                    <table cellspacing="0" cellpadding="0" class="table_info">
                        <tbody><tr>
                            <td colspan="5" class="table_name">
                                举报正文（注意:标有
                                <font style="color: red;"> * </font>的必须填写）
                            </td>
                        </tr>
                        <tr>
                            <td class="td_name2" style="width: 115px;">
                                标题(最多50字)
                            </td>
                            <td class="td_star" style="width: 15px;">
                                <font style="color: red;"> * </font>
                            </td>
                            <td class="td_info" style="width: 715px;">
                                <input type="text" name="reportMsg.title" id="title" maxlength="50" value="" class="input_text" style="width: 682px;">
                            </td>
                        </tr>
                        <tr>
                            <td class="td_name2">
                                问题类别
                            </td>
                            <td class="td_star" style="width: 15px;">
                                <font style="color: red;"> * </font>
                            </td>
                            <td class="td_info">
                                <select name="reportMsg.problemType" id="problemType" class="input_sele" style="width: 689px;">
                                    <option value="">
                                        ==请选择==
                                    </option>
                                    <option value="违反政治纪律行为">违反政治纪律行为</option>
                                    <option value="违反组织人事纪律行为">违反组织人事纪律行为</option>
                                    <option value="违反廉洁自律规定行为">违反廉洁自律规定行为</option>
                                    <option value="贪污贿赂行为">贪污贿赂行为</option>
                                    <option value="破坏社会主义经济秩序行为">破坏社会主义经济秩序行为</option>
                                    <option value="违反财经纪律行为">违反财经纪律行为</option>
                                    <option value="失职渎职行为">失职渎职行为</option>
                                    <option value="侵犯党员权利公民权利行为">侵犯党员权利公民权利行为</option>
                                    <option value="严重违反社会主义道德行为">严重违反社会主义道德行为</option>
                                    <option value="妨害社会管理秩序行为">妨害社会管理秩序行为</option>
                                    <option value="其他违纪行为">其他违纪行为</option>
                                </select>

                            </td>
                        </tr>
                        <tr>
                            <td class="td_name2">
                                问题细类
                            </td>
                            <td class="td_star" style="width: 15px;">
                                <font style="color: red;"> * </font>
                            </td>
                            <td class="td_info">
                                <select name="reportMsg.problemTypeDetail" id="problemTypeDetail" class="input_sele" style="width: 689px;">
                                    <option value="">
                                        ==请选择==
                                    </option>

                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_name2">
                                主要问题
                                <br>
                                (剩余
                                <font style="font-weight: bolder; font-size: 17px;" id="tip">6000</font>字)
                            </td>
                            <td class="td_star" style="width: 15px;">
                                <font style="color: red;"> * </font>
                            </td>
                            <td class="td_info" style="height: 335px;">
                                <textarea name="reportMsg.problem" cols="85" rows="20" id="problem" style="width: 682px; font-size: 15px;border: 1px solid gray;"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_name2">
                                验证码
                            </td>
                            <td class="td_star" style="width: 15px;">
                                <font style="color: red;"> * </font>
                            </td>
                            <td class="td_info">
                                <div class="left" style="margin-top: 5px; height: 27px;">
                                    <input type="text" class="input_text" name="rand" id="rand" maxlength="6">
                                </div>
                                <div class="left" style="margin-top: 5px; height: 27px;">
                                    <img src="${contextPath}/open/rand.action?d=<%=new java.util.Date() %>" alt="看不清？点击换一个" onclick="this.src='${contextPath}/open/rand.action?d='+new Date()">
                                </div>
                                <div class="left" style="margin-top: 5px; height: 27px; line-height: 27px;">
                                    看不清，请点击图片
                                </div>
                            </td>
                        </tr>
                        </tbody></table>
                </div>

                <div class="oper_box" style="margin-top: 30px;">
                    <table align="center">
                        <tbody><tr>
                            <td style="width: 100px;">
                                <input type="submit" class="but_submit" value="提 交">
                            </td>
                            <td style="width: 100px;">
                                <input type="reset" class="but_submit" value="重 填">
                            </td>
                        </tr>
                        </tbody></table>
                </div>
            </div>
        </div>

    </div>
</form>
<div id="area"></div>
<#include "../bottom.ftl">