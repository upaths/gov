package cn.gov.service;

import cn.gov.model.IpForbid;

import java.util.List;

/**
 * Created by 王勇 on 2015/9/1.
 */
public interface IpForbidService {

    public void insertForbiddenIp(IpForbid ipForbid);

    public int deleteForbinddenIp(Integer id);

    public List<IpForbid> queryForbiddenIp();
}
