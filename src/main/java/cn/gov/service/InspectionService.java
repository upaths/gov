package cn.gov.service;

import cn.gov.model.InspectReport;
import cn.gov.model.Inspection;

import java.util.List;

/**
 * Created by 王勇 on 2015/9/20.
 */
public interface InspectionService {
    public List<Inspection> queryInspection();

    public void insertInspection(Inspection inspection);

    public int updateInspection(Inspection inspection);

    public int deleteInspection(Integer id);

    public Inspection queryInspectionById(Integer id);

    public List<InspectReport> queryInspectReportByInspectId(Integer inspectId);

    public int countInspectReportByInspectId(Integer inspectId);

    public void insertInspectReport(InspectReport inspectReport);

}
