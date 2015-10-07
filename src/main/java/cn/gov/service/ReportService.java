package cn.gov.service;

import cn.gov.model.Report;
import cn.gov.model.ReportAdmin;
import cn.gov.model.ReportMsg;

import java.util.List;

/**
 * Created by 王勇 on 2015/9/20.
 */
public interface ReportService {
    public List<Report> queryReport();

    public void insertReport(Report report);

    public void insertReportMsg(ReportMsg reportMsg);

    public ReportMsg queryReportMsgById(String id);

    public int updateReportMsgSelective(ReportMsg reportMsg);

    public int updateReportAdminSelective(ReportAdmin reportAdmin);

    public String parseOrgName(String orgCode);

    public boolean check(String username, String password);

    public List<ReportMsg> queryReportMsg(Boolean sign, Boolean answered);

}
