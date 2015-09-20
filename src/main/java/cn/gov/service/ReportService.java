package cn.gov.service;

import cn.gov.model.Report;

import java.util.List;

/**
 * Created by 王勇 on 2015/9/20.
 */
public interface ReportService {
    public List<Report> queryReport();

    public void insertReport(Report report);
}
