package cn.gov.service.impl;

import cn.gov.dao.ResourceMapper;
import cn.gov.dao.RoleResourceMapper;
import cn.gov.dao.UserRoleMapper;
import cn.gov.model.*;
import cn.gov.service.ResourceService;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by 王勇 on 2015/7/31.
 */
public class ResourceServiceImpl implements ResourceService {

    private ResourceMapper resourceMapper;
    private UserRoleMapper userRoleMapper;
    private RoleResourceMapper roleResourceMapper;

    @Override
    public List<Resource> queryResourcesByUserName(String userName, Integer resourceId) {
        UserRoleExample userRoleExample = new UserRoleExample();
        userRoleExample.createCriteria().andUsernameEqualTo(userName);
        List<UserRole> userRoles = userRoleMapper.selectByExample(userRoleExample);
        if (userRoles == null || userRoles.size() == 0) {
            return null;
        }
        UserRole userRole = userRoles.get(0);
        RoleResourceExample roleResourceExample = new RoleResourceExample();
        roleResourceExample.createCriteria().andRoleidEqualTo(userRole.getRoleid());
        List<RoleResource> roleResources = roleResourceMapper.selectByExample(roleResourceExample);
        if (roleResources == null || roleResources.size() == 0) {
            return null;
        }
        List<Integer> resourceIds = new ArrayList<Integer>(roleResources.size());
        for (RoleResource roleResource : roleResources) {
            resourceIds.add(roleResource.getResourceid());
        }
        ResourceExample resourceExample = new ResourceExample();
        if (resourceId == null) {
            resourceExample.createCriteria().andIdIn(resourceIds).andParentidIsNull();
        }else {
            resourceExample.createCriteria().andIdIn(resourceIds).andParentidEqualTo(resourceId);
        }
        resourceExample.setOrderByClause("px asc");
        return resourceMapper.selectByExample(resourceExample);
    }

    @Override
    public Resource queryResourceById(Integer resourceId) {
        return resourceMapper.selectByPrimaryKey(resourceId);
    }

    public ResourceMapper getResourceMapper() {
        return resourceMapper;
    }

    public void setResourceMapper(ResourceMapper resourceMapper) {
        this.resourceMapper = resourceMapper;
    }

    public RoleResourceMapper getRoleResourceMapper() {
        return roleResourceMapper;
    }

    public void setRoleResourceMapper(RoleResourceMapper roleResourceMapper) {
        this.roleResourceMapper = roleResourceMapper;
    }

    public UserRoleMapper getUserRoleMapper() {
        return userRoleMapper;
    }

    public void setUserRoleMapper(UserRoleMapper userRoleMapper) {
        this.userRoleMapper = userRoleMapper;
    }
}
