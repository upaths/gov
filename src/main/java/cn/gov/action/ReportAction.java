package cn.gov.action;

import cn.gov.model.Report;
import cn.gov.model.ReportMsg;
import cn.gov.service.ReportService;
import cn.gov.util.AlertUtil;
import cn.gov.util.FileUtil;
import cn.gov.util.IpUtil;
import cn.gov.util.UUIDGenerator;
import com.opensymphony.xwork2.ActionContext;
import org.apache.commons.lang.StringEscapeUtils;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * Created by 王勇 on 2015/9/20.
 */
public class ReportAction extends BasicAction {
    private ReportService reportService;
    private List<Report> reports;
    private Report report;
    private File doc;
    private String docFileName;
    private String docContentType;
    private String rand; // 表单中的rand

    private ReportMsg reportMsg;
    private String msgId;
    private Boolean sign;
    private Boolean answered;
    private List<ReportMsg> reportMsgs;

    public String query() {
        reports = reportService.queryReport();
        return "query";
    }

    public String insert() {
        // 从session中取出RandomAction.java 中生成的验证码random
        String random = (String) (ActionContext.getContext().getSession().get("random"));
        // 下面就是将session中保存验证码字符串与客户输入的验证码字符串对比了
        if (rand != null && rand.equals(random)) {
            report.setIp(IpUtil.getClientIp(request));
            report.setDate(new Date());
            report.setReportName(StringEscapeUtils.escapeHtml(report.getReportName()));
            report.setReportContact(StringEscapeUtils.escapeHtml(report.getReportContact()));
            report.setReportCondition(StringEscapeUtils.escapeHtml(report.getReportCondition()));
            report.setReportedName(StringEscapeUtils.escapeHtml(report.getReportedName()));
            report.setReportedCondition(StringEscapeUtils.escapeHtml(report.getReportedCondition()));
            report.setTitle(StringEscapeUtils.escapeHtml(report.getTitle()));
            report.setProblem(StringEscapeUtils.escapeHtml(report.getProblem()));
            if (doc != null) {
                String url = FileUtil.uploadFile(doc, docFileName, request);
                report.setDoc(url);
            }
            reportService.insertReport(report);
            AlertUtil.alertThenGo(response, "提交成功，我们会尽快与您联系！", request.getContextPath() + "/index.html");
        }else {
            AlertUtil.alertThenGo(response, "验证码错误！", request.getContextPath()+"/index.html");
        }
        return null;
    }

    public String insertMsg() {
        // 从session中取出RandomAction.java 中生成的验证码random
        String random = (String) (ActionContext.getContext().getSession().get("random"));
        // 下面就是将session中保存验证码字符串与客户输入的验证码字符串对比了
        if (rand != null && rand.equals(random)) {
            String uuid = UUIDGenerator.getUUID();
            reportMsg.setAnswered(false);
            reportMsg.setId(uuid);
            reportMsg.setOrg(reportService.parseOrgName(reportMsg.getOrg()));
            reportMsg.setDate(new Date());
            reportMsg.setIp(IpUtil.getClientIp(request));
            try {
                reportService.insertReportMsg(reportMsg);
                AlertUtil.alertThenGo(response, "提交成功，您的查询码为\""+uuid+"\",按CTRL+C可复制该信息！", request.getContextPath() + "/index.html");
            }catch (Exception e) {
                AlertUtil.alertThenGo(response, "提交失败！", request.getContextPath() + "/index.html");
            }
        }else {
            AlertUtil.alertThenGo(response, "验证码错误！", request.getContextPath()+"/index.html");
        }
        return null;
    }

    public String searchMsg() throws IOException {
        response.setCharacterEncoding("UTF-8");
        // 从session中取出RandomAction.java 中生成的验证码random
        String random = (String) (ActionContext.getContext().getSession().get("random"));
        // 下面就是将session中保存验证码字符串与客户输入的验证码字符串对比了
        if (rand != null && rand.equals(random)) {
            reportMsg = reportService.queryReportMsgById(msgId);
            if (reportMsg == null) {
                response.getWriter().write("no_data");
            }else {
                if (reportMsg.getAnswered() == null || !reportMsg.getAnswered()
                        || reportMsg.getAnswer() == null || "".equals(reportMsg.getAnswer())) {
                    response.getWriter().write("no_answer");
                }else {
                    response.getWriter().write(reportMsg.getAnswer());
                }
            }
        }else {
            response.getWriter().write("no_same");
        }
        return null;
    }

    public String queryReport() {
        reportMsgs = reportService.queryReportMsg(sign, answered);
        return SUCCESS;
    }

    public String queryReportDetail() {
        reportMsg = reportService.queryReportMsgById(msgId);
        return SUCCESS;
    }

    public String reportAnswer() {
        if (reportMsg.getAnswered() == null) {
            reportMsg.setAnswered(false);
        }
        int cnt = reportService.updateReportMsgSelective(reportMsg);
        String url = "noSignReport.action";
        if (reportMsg.getSigned() != null && reportMsg.getSigned()) {
            url = "signReport.action";
        }
        if (cnt > 0) {
            AlertUtil.alertThenGo(response, "答复成功！", url);
        }else {
            AlertUtil.alertThenGo(response, "答复失败！", url);
        }
        return null;
    }

    public ReportService getReportService() {
        return reportService;
    }

    public void setReportService(ReportService reportService) {
        this.reportService = reportService;
    }

    public List<Report> getReports() {
        return reports;
    }

    public void setReports(List<Report> reports) {
        this.reports = reports;
    }

    public Report getReport() {
        return report;
    }

    public void setReport(Report report) {
        this.report = report;
    }

    public File getDoc() {
        return doc;
    }

    public void setDoc(File doc) {
        this.doc = doc;
    }

    public String getDocFileName() {
        return docFileName;
    }

    public void setDocFileName(String docFileName) {
        this.docFileName = docFileName;
    }

    public String getDocContentType() {
        return docContentType;
    }

    public void setDocContentType(String docContentType) {
        this.docContentType = docContentType;
    }

    public String getRand() {
        return rand;
    }

    public void setRand(String rand) {
        this.rand = rand;
    }

    public ReportMsg getReportMsg() {
        return reportMsg;
    }

    public void setReportMsg(ReportMsg reportMsg) {
        this.reportMsg = reportMsg;
    }

    public String getMsgId() {
        return msgId;
    }

    public void setMsgId(String msgId) {
        this.msgId = msgId;
    }

    public boolean isSign() {
        return sign;
    }

    public void setSign(boolean sign) {
        this.sign = sign;
    }

    public List<ReportMsg> getReportMsgs() {
        return reportMsgs;
    }

    public void setReportMsgs(List<ReportMsg> reportMsgs) {
        this.reportMsgs = reportMsgs;
    }

    public Boolean getSign() {
        return sign;
    }

    public void setSign(Boolean sign) {
        this.sign = sign;
    }

    public Boolean getAnswered() {
        return answered;
    }

    public void setAnswered(Boolean answered) {
        this.answered = answered;
    }
}
