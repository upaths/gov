package cn.gov.service.impl;

import java.util.List;

import cn.gov.dao.CategoryMapper;
import cn.gov.model.Category;
import cn.gov.model.CategoryExample;
import cn.gov.service.CategoryService;

public class CategoryServiceImpl implements CategoryService {
	private CategoryExample categoryExample;
	private CategoryMapper categoryMapper;
	public void insert(Category category) {
		categoryMapper.insert(category);
	}

	public int update(Category category) {
		return categoryMapper.updateByPrimaryKey(category);
	}

	public int delete(Integer id) {
		return categoryMapper.deleteByPrimaryKey(id);
	}

	public int deleteChilds(Integer parentId) {
		categoryExample.clear();
		categoryExample.createCriteria().andParentIdEqualTo(parentId);
		return categoryMapper.deleteByExample(categoryExample);
	}

	public List<Category> queryFirstLevel() {
		categoryExample.clear();
		categoryExample.createCriteria().andParentIdIsNull();
		categoryExample.setOrderByClause("px");
		return categoryMapper.selectByExample(categoryExample);
	}

	public List<Category> queryChilds(Integer parentId) {
		categoryExample.clear();
		categoryExample.createCriteria().andParentIdEqualTo(parentId);
		categoryExample.setOrderByClause("px");
		return categoryMapper.selectByExample(categoryExample);
	}

	
	public Category queryByMc(String mc) {
		categoryExample.clear();
		categoryExample.createCriteria().andMcEqualTo(mc);
		List<Category> list = categoryMapper.selectByExample(categoryExample);
		return list == null || list.size() <= 0 ? null : list.get(0);
	}

	public Category queryByPrimaryKey(Integer id) {
		return categoryMapper.selectByPrimaryKey(id);
	}

	public CategoryExample getCategoryExample() {
		return categoryExample;
	}

	public void setCategoryExample(CategoryExample categoryExample) {
		this.categoryExample = categoryExample;
	}

	public CategoryMapper getCategoryMapper() {
		return categoryMapper;
	}

	public void setCategoryMapper(CategoryMapper categoryMapper) {
		this.categoryMapper = categoryMapper;
	}
	
}
