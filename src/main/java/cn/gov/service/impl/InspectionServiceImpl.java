package cn.gov.service.impl;

import cn.gov.dao.InspectReportMapper;
import cn.gov.dao.InspectionMapper;
import cn.gov.model.InspectReport;
import cn.gov.model.InspectReportExample;
import cn.gov.model.Inspection;
import cn.gov.model.InspectionExample;
import cn.gov.service.InspectionService;

import java.util.List;

/**
 * Created by 王勇 on 2015/9/20.
 */
public class InspectionServiceImpl implements InspectionService {
    private InspectionMapper inspectionMapper;
    private InspectReportMapper inspectReportMapper;
    @Override
    public List<Inspection> queryInspection() {
        InspectionExample inspectionExample = new InspectionExample();
        inspectionExample.setOrderByClause("sort");
        return inspectionMapper.selectByExample(inspectionExample);
    }

    @Override
    public void insertInspection(Inspection inspection) {
        inspectionMapper.insert(inspection);
    }

    @Override
    public int updateInspection(Inspection inspection) {
        return inspectionMapper.updateByPrimaryKey(inspection);
    }

    @Override
    public int deleteInspection(Integer id) {
        return inspectionMapper.deleteByPrimaryKey(id);
    }

    @Override
    public Inspection queryInspectionById(Integer id) {
        return inspectionMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<InspectReport> queryInspectReportByInspectId(Integer inspectId) {
        InspectReportExample inspectReportExample = new InspectReportExample();
        inspectReportExample.createCriteria().andInspectIdEqualTo(inspectId);
        inspectReportExample.setOrderByClause("date desc");
        return inspectReportMapper.selectByExample(inspectReportExample);
    }

    @Override
    public int countInspectReportByInspectId(Integer inspectId) {
        InspectReportExample inspectReportExample = new InspectReportExample();
        inspectReportExample.createCriteria().andInspectIdEqualTo(inspectId);
        return inspectReportMapper.countByExample(inspectReportExample);
    }

    @Override
    public void insertInspectReport(InspectReport inspectReport) {
        inspectReportMapper.insert(inspectReport);
    }

    public InspectionMapper getInspectionMapper() {
        return inspectionMapper;
    }

    public void setInspectionMapper(InspectionMapper inspectionMapper) {
        this.inspectionMapper = inspectionMapper;
    }

    public InspectReportMapper getInspectReportMapper() {
        return inspectReportMapper;
    }

    public void setInspectReportMapper(InspectReportMapper inspectReportMapper) {
        this.inspectReportMapper = inspectReportMapper;
    }
}
