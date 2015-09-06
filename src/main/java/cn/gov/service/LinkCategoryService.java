package cn.gov.service;

import cn.gov.model.LinkCategory;

import java.util.List;

/**
 * Created by 王勇 on 2015/9/1.
 */
public interface LinkCategoryService {

    public List<LinkCategory> queryLinkCategory();

    public void insertLinkCategory(LinkCategory linkCategory);

    public int updateLinkCategory(LinkCategory linkCategory);

    public int deleteLinkCategory(Integer id);
}
