package cn.gov.service.impl;

import cn.gov.dao.ReportMapper;
import cn.gov.model.Report;
import cn.gov.model.ReportExample;
import cn.gov.service.ReportService;

import java.util.List;

/**
 * Created by 王勇 on 2015/9/20.
 */
public class ReportServiceImpl implements ReportService {
    private ReportMapper reportMapper;
    @Override
    public List<Report> queryReport() {
        ReportExample reportExample = new ReportExample();
        reportExample.setOrderByClause("date desc");
        return reportMapper.selectByExample(reportExample);
    }

    @Override
    public void insertReport(Report report) {
        reportMapper.insert(report);
    }

    public ReportMapper getReportMapper() {
        return reportMapper;
    }

    public void setReportMapper(ReportMapper reportMapper) {
        this.reportMapper = reportMapper;
    }
}
