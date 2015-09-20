package cn.gov.action;

import cn.gov.model.Report;
import cn.gov.service.ReportService;
import cn.gov.util.AlertUtil;
import cn.gov.util.FileUtil;
import cn.gov.util.IpUtil;
import com.opensymphony.xwork2.ActionContext;
import org.apache.commons.lang.StringEscapeUtils;

import java.io.File;
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
}
