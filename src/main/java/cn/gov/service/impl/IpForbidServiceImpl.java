package cn.gov.service.impl;

import cn.gov.cache.SiteCache;
import cn.gov.dao.IpForbidMapper;
import cn.gov.model.IpForbid;
import cn.gov.model.IpForbidExample;
import cn.gov.service.IpForbidService;

import java.util.List;

/**
 * Created by 王勇 on 2015/9/1.
 */
public class IpForbidServiceImpl implements IpForbidService {

    private IpForbidMapper ipForbidMapper;

    public void initCache() {
        SiteCache.updateIpForbidCache(ipForbidMapper.selectByExample(null));
    }
    @Override
    public void insertForbiddenIp(IpForbid ipForbid) {
        ipForbidMapper.insert(ipForbid);
        // 更新缓存
        SiteCache.updateIpForbidCache(ipForbidMapper.selectByExample(null));
    }

    @Override
    public int deleteForbinddenIp(Integer id) {
        int cnt = ipForbidMapper.deleteByPrimaryKey(id);
        // 更新缓存
        SiteCache.updateIpForbidCache(ipForbidMapper.selectByExample(null));
        return cnt;
    }

    @Override
    public List<IpForbid> queryForbiddenIp() {
        IpForbidExample ipForbidExample = new IpForbidExample();
        ipForbidExample.setOrderByClause("id");
        return ipForbidMapper.selectByExample(ipForbidExample);
    }

    public IpForbidMapper getIpForbidMapper() {
        return ipForbidMapper;
    }

    public void setIpForbidMapper(IpForbidMapper ipForbidMapper) {
        this.ipForbidMapper = ipForbidMapper;
    }
}
