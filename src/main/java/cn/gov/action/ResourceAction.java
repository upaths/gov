package cn.gov.action;

import cn.gov.model.Resource;
import cn.gov.service.ResourceService;
import com.opensymphony.xwork2.ActionContext;

import java.util.List;

/**
 * Created by 王勇 on 2015/8/1.
 */
public class ResourceAction extends BasicAction {
    private ResourceService resourceService;
    private List<Resource> resourceList;
    private Integer resourceId;
    private Resource resource;

    public String top() {
        String username = (String)ActionContext.getContext().getSession().get("user");
        resourceList = resourceService.queryResourcesByUserName(username, null);
        return "top";
    }

    public String left() {
        String username = (String)ActionContext.getContext().getSession().get("user");
        resourceList = resourceService.queryResourcesByUserName(username, resourceId);
        resource = resourceService.queryResourceById(resourceId);
        return "left";
    }

    public String right() {
        String username = (String)ActionContext.getContext().getSession().get("user");
        resourceList = resourceService.queryResourcesByUserName(username, null);
        return "right";
    }

    public ResourceService getResourceService() {
        return resourceService;
    }

    public List<Resource> getResourceList() {
        return resourceList;
    }

    public void setResourceService(ResourceService resourceService) {
        this.resourceService = resourceService;
    }

    public void setResourceList(List<Resource> resourceList) {
        this.resourceList = resourceList;
    }

    public Integer getResourceId() {
        return resourceId;
    }

    public void setResourceId(Integer resourceId) {
        this.resourceId = resourceId;
    }

    public Resource getResource() {
        return resource;
    }

    public void setResource(Resource resource) {
        this.resource = resource;
    }
}
