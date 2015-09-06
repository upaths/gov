package cn.gov.service.impl;

import cn.gov.dao.LinkCategoryMapper;
import cn.gov.model.LinkCategory;
import cn.gov.model.LinkCategoryExample;
import cn.gov.service.LinkCategoryService;

import java.util.List;

/**
 * Created by 王勇 on 2015/9/1.
 */
public class LinkCategoryServiceImpl implements LinkCategoryService {

    private LinkCategoryMapper linkCategoryMapper;

    @Override
    public List<LinkCategory> queryLinkCategory() {
        LinkCategoryExample linkCategoryExample = new LinkCategoryExample();
        linkCategoryExample.setOrderByClause("sort");
        return linkCategoryMapper.selectByExample(linkCategoryExample);
    }

    @Override
    public void insertLinkCategory(LinkCategory linkCategory) {
        linkCategoryMapper.insert(linkCategory);
    }

    @Override
    public int updateLinkCategory(LinkCategory linkCategory) {
        return linkCategoryMapper.updateByPrimaryKey(linkCategory);
    }

    @Override
    public int deleteLinkCategory(Integer id) {
        return linkCategoryMapper.deleteByPrimaryKey(id);
    }

    public LinkCategoryMapper getLinkCategoryMapper() {
        return linkCategoryMapper;
    }

    public void setLinkCategoryMapper(LinkCategoryMapper linkCategoryMapper) {
        this.linkCategoryMapper = linkCategoryMapper;
    }
}
