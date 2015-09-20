package cn.gov.action;

import cn.gov.model.InspectReport;
import cn.gov.model.Inspection;
import cn.gov.model.InspectionDetail;
import cn.gov.service.InspectionService;
import cn.gov.util.AlertUtil;
import cn.gov.util.FileUtil;
import cn.gov.util.IpUtil;
import com.opensymphony.xwork2.ActionContext;
import org.apache.commons.lang.StringEscapeUtils;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by 王勇 on 2015/9/20.
 */
public class InspectionAction extends BasicAction {
    private InspectionService inspectionService;
    private List<InspectionDetail> inspectionDetails;
    private List<Inspection> inspections;
    private Inspection inspection;
    private List<InspectReport> inspectReports;
    private InspectReport inspectReport;
    private Integer id;
    private File doc;
    private String docFileName;
    private String docContentType;
    private String rand; // 表单中的rand

    public String inspection() {
        inspections = inspectionService.queryInspection();
        return SUCCESS;
    }

    public String query() {
        List<Inspection> inspections = inspectionService.queryInspection();
        if (inspections != null && inspections.size() > 0) {
            inspectionDetails = new ArrayList<InspectionDetail>(inspections.size());
            for (Inspection inspection : inspections) {
                InspectionDetail inspectionDetail = new InspectionDetail(inspection);
                inspectionDetail.setReport(inspectionService.countInspectReportByInspectId(inspection.getId()));
                inspectionDetails.add(inspectionDetail);
            }
        }
        return "query";
    }

    public String toAdd() {
        return "toAdd";
    }

    public String add() {
        inspectionService.insertInspection(inspection);
        AlertUtil.alertThenGo(response, "添加成功！", "inspection_query.action");
        return null;
    }

    public String toUpdate() {
        inspection = inspectionService.queryInspectionById(id);
        return "toUpdate";
    }

    public String update() {
        String msg;
        int cnt = inspectionService.updateInspection(inspection);
        msg = cnt > 0 ? "更新成功！" : "更新失败！";
        AlertUtil.alertThenGo(response, msg, "inspection_query.action");
        return null;
    }

    public String delete() {
        String msg;
        int cnt = inspectionService.deleteInspection(id);
        msg = cnt > 0 ? "删除成功！" : "删除失败！";
        AlertUtil.alertThenGo(response, msg, "inspection_query.action");
        return null;
    }

    public String inspectReport() {
        inspectReports = inspectionService.queryInspectReportByInspectId(id);
        return "inspectReport";
    }

    public String insertInspectReport() {
        // 从session中取出RandomAction.java 中生成的验证码random
        String random = (String) (ActionContext.getContext().getSession().get("random"));
        // 下面就是将session中保存验证码字符串与客户输入的验证码字符串对比了
        if (rand != null && rand.equals(random)) {
            inspectReport.setIp(IpUtil.getClientIp(request));
            inspectReport.setDate(new Date());
            inspectReport.setReportName(StringEscapeUtils.escapeHtml(inspectReport.getReportName()));
            inspectReport.setReportContact(StringEscapeUtils.escapeHtml(inspectReport.getReportContact()));
            inspectReport.setReportCondition(StringEscapeUtils.escapeHtml(inspectReport.getReportCondition()));
            inspectReport.setReportedName(StringEscapeUtils.escapeHtml(inspectReport.getReportedName()));
            inspectReport.setReportedCondition(StringEscapeUtils.escapeHtml(inspectReport.getReportedCondition()));
            inspectReport.setTitle(StringEscapeUtils.escapeHtml(inspectReport.getTitle()));
            inspectReport.setProblem(StringEscapeUtils.escapeHtml(inspectReport.getProblem()));
            if (doc != null) {
                String url = FileUtil.uploadFile(doc, docFileName, request);
                inspectReport.setDoc(url);
            }
            inspectionService.insertInspectReport(inspectReport);
            AlertUtil.alertThenGo(response, "提交成功，我们会尽快与您联系！", request.getContextPath()+"/index.html");
        }else {
            AlertUtil.alertThenGo(response, "验证码错误！", request.getContextPath()+"/index.html");
        }
        return null;
    }

    public InspectionService getInspectionService() {
        return inspectionService;
    }

    public void setInspectionService(InspectionService inspectionService) {
        this.inspectionService = inspectionService;
    }

    public List<InspectionDetail> getInspectionDetails() {
        return inspectionDetails;
    }

    public void setInspectionDetails(List<InspectionDetail> inspectionDetails) {
        this.inspectionDetails = inspectionDetails;
    }

    public Inspection getInspection() {
        return inspection;
    }

    public void setInspection(Inspection inspection) {
        this.inspection = inspection;
    }

    public List<InspectReport> getInspectReports() {
        return inspectReports;
    }

    public void setInspectReports(List<InspectReport> inspectReports) {
        this.inspectReports = inspectReports;
    }

    public InspectReport getInspectReport() {
        return inspectReport;
    }

    public void setInspectReport(InspectReport inspectReport) {
        this.inspectReport = inspectReport;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public List<Inspection> getInspections() {
        return inspections;
    }

    public void setInspections(List<Inspection> inspections) {
        this.inspections = inspections;
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
