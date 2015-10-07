package cn.gov.service.impl;

import cn.gov.dao.ReportAdminMapper;
import cn.gov.dao.ReportMapper;
import cn.gov.dao.ReportMsgMapper;
import cn.gov.model.*;
import cn.gov.service.ReportService;
import cn.gov.util.MD5Util;

import java.util.List;

/**
 * Created by 王勇 on 2015/9/20.
 */
public class ReportServiceImpl implements ReportService {
    private ReportMapper reportMapper;
    private ReportMsgMapper reportMsgMapper;
    private ReportAdminMapper reportAdminMapper;
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

    @Override
    public void insertReportMsg(ReportMsg reportMsg) {
        reportMsgMapper.insert(reportMsg);
    }

    @Override
    public ReportMsg queryReportMsgById(String id) {
        return reportMsgMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateReportMsgSelective(ReportMsg reportMsg) {
        return reportMsgMapper.updateByPrimaryKeySelective(reportMsg);
    }

    @Override
    public int updateReportAdminSelective(ReportAdmin reportAdmin) {
        if (reportAdmin.getPassword() != null && !"".equals(reportAdmin.getPassword())) {
            reportAdmin.setPassword(MD5Util.md5(reportAdmin.getPassword()));
        }
        return reportAdminMapper.updateByPrimaryKeySelective(reportAdmin);
    }

    @Override
    public String parseOrgName(String orgCode) {
        return "dongying".equals(orgCode) ? "东营区" : "hekou".equals(orgCode) ? "河口区" : "kenli".equals(orgCode) ?
                "垦利县" : "lijin".equals(orgCode) ? "利津县" : "guangrao".equals(orgCode) ? "广饶县" : null;
    }

    @Override
    public boolean check(String username, String password) {
        ReportAdmin u = reportAdminMapper.selectByPrimaryKey(username);
        if (u != null && u.getPassword().equals(MD5Util.md5(password))) {
            return true;
        }
        return false;
    }

    @Override
    public List<ReportMsg> queryReportMsg(Boolean sign, Boolean answered) {
        ReportMsgExample reportMsgExample = new ReportMsgExample();
        if (sign != null || answered != null) {
            ReportMsgExample.Criteria criteria = reportMsgExample.createCriteria();
            if (sign != null) {
                criteria.andSignedEqualTo(sign);
            }
            if (answered != null) {
                criteria.andAnsweredEqualTo(answered);
            }
        }
        reportMsgExample.setOrderByClause("date");
        return reportMsgMapper.selectByExample(reportMsgExample);
    }

    public ReportMapper getReportMapper() {
        return reportMapper;
    }

    public void setReportMapper(ReportMapper reportMapper) {
        this.reportMapper = reportMapper;
    }

    public ReportMsgMapper getReportMsgMapper() {
        return reportMsgMapper;
    }

    public void setReportMsgMapper(ReportMsgMapper reportMsgMapper) {
        this.reportMsgMapper = reportMsgMapper;
    }

    public ReportAdminMapper getReportAdminMapper() {
        return reportAdminMapper;
    }

    public void setReportAdminMapper(ReportAdminMapper reportAdminMapper) {
        this.reportAdminMapper = reportAdminMapper;
    }
}
