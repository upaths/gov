package cn.gov.service;

import cn.gov.model.Resource;

import java.util.List;

/**
 * Created by 王勇 on 2015/7/31.
 */
public interface ResourceService {

    /**
     * 根据用户名查询用户拥有的资源列表
     * @param userName
     * @param resourceId
     * @return
     */
    public List<Resource> queryResourcesByUserName(String userName, Integer resourceId);

    public Resource queryResourceById(Integer resourceId);
}
