package cn.gov.action;

import cn.gov.filter.CheckIpForbidFilter;
import cn.gov.model.IpForbid;
import cn.gov.service.IpForbidService;
import cn.gov.util.AlertUtil;

import java.util.List;

/**
 * Created by 王勇 on 2015/9/1.
 */
public class IpForbidAction extends BasicAction {

    private List<IpForbid> list;
    private IpForbid ipForbid;
    private Integer id;
    private IpForbidService ipForbidService;
    private CheckIpForbidFilter checkIpForbidFilter;

    public String query() {
        list = ipForbidService.queryForbiddenIp();
        return "query";
    }

    public String insert() {
        ipForbidService.insertForbiddenIp(ipForbid);
        checkIpForbidFilter.updateIpForbidList();
        AlertUtil.alertThenGo(response, "添加成功！", "ip_forbid_query.action");
        return null;
    }

    public String delete() {
        ipForbidService.deleteForbinddenIp(id);
        checkIpForbidFilter.updateIpForbidList();
        AlertUtil.alertThenGo(response, "删除成功！", "ip_forbid_query.action");
        return null;
    }

    public List<IpForbid> getList() {
        return list;
    }

    public void setList(List<IpForbid> list) {
        this.list = list;
    }

    public IpForbid getIpForbid() {
        return ipForbid;
    }

    public void setIpForbid(IpForbid ipForbid) {
        this.ipForbid = ipForbid;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public IpForbidService getIpForbidService() {
        return ipForbidService;
    }

    public void setIpForbidService(IpForbidService ipForbidService) {
        this.ipForbidService = ipForbidService;
    }

    public CheckIpForbidFilter getCheckIpForbidFilter() {
        return checkIpForbidFilter;
    }

    public void setCheckIpForbidFilter(CheckIpForbidFilter checkIpForbidFilter) {
        this.checkIpForbidFilter = checkIpForbidFilter;
    }
}
