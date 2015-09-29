package cn.gov.service.impl;

import java.util.ArrayList;
import java.util.List;

import cn.gov.cache.SiteCache;
import cn.gov.dao.CategoryMapper;
import cn.gov.model.Category;
import cn.gov.model.CategoryExample;
import cn.gov.model.CategoryTree;
import cn.gov.service.CategoryService;

public class CategoryServiceImpl implements CategoryService {
	private CategoryMapper categoryMapper;
	public void initCache() {
		SiteCache.updateCategoryCache(categoryMapper.selectByExample(null));
	}
	public void insert(Category category) {
		categoryMapper.insert(category);
		// 更新缓存
		SiteCache.updateCategoryCache(categoryMapper.selectByExample(null));
	}

	public int update(Category category) {
		int cnt = categoryMapper.updateByPrimaryKeySelective(category);
		// 更新缓存
		SiteCache.updateCategoryCache(categoryMapper.selectByExample(null));
		return cnt;
	}

	public int delete(Integer id) {
		int cnt = categoryMapper.deleteByPrimaryKey(id);
		// 更新缓存
		SiteCache.updateCategoryCache(categoryMapper.selectByExample(null));
		return cnt;
	}

	public int deleteChilds(Integer parentId) {
		CategoryExample categoryExample = new CategoryExample();
		categoryExample.createCriteria().andParentIdEqualTo(parentId);
		return categoryMapper.deleteByExample(categoryExample);
	}

	@Override
	public List<CategoryTree> queryCategoryTree(boolean showChild) {
		List<CategoryTree> categoryTreeList = new ArrayList<CategoryTree>();
		List<Category> list = this.queryFirstLevel();
		for (Category c : list) {
			CategoryTree categoryTree = new CategoryTree(c);
			// 如果需要显示子节点，构建栏目树
			if (showChild) {
				this.buildCategoryTree(categoryTree);
			}
			categoryTreeList.add(categoryTree);
		}
		return categoryTreeList;
	}

	private CategoryTree buildCategoryTree(CategoryTree c) {
		List<Category> childs = this.queryChilds(c.getId());
		if (childs != null) {
			c.setChilds(new ArrayList<CategoryTree>());
			for (Category child : childs) {
				CategoryTree childTree = new CategoryTree(child);
				this.buildCategoryTree(childTree);
				c.getChilds().add(childTree);
			}
		}
		return c;
	}

	@Override
	public String queryCategoryTreeJson() {
		List<CategoryTree> trees = this.queryCategoryTree(true);
		if (trees == null) {
			return null;
		}
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < trees.size(); i++) {
			CategoryTree tree = trees.get(i);
			if (i > 0) {
				sb.append(",");
			}
			this.buildCategoryJson(tree, sb);
		}
		return sb.toString();
	}

	@Override
	public String queryFirstLevelCategoryTreeJson() {
		// 暂时只允许选择一级栏目作为父节点
		List<CategoryTree> trees = this.queryCategoryTree(false);
		if (trees == null) {
			return null;
		}
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < trees.size(); i++) {
			CategoryTree tree = trees.get(i);
			if (i > 0) {
				sb.append(",");
			}
			this.buildCategoryJson(tree, sb);
		}
		return sb.toString();
	}

	private void buildCategoryJson(CategoryTree tree, StringBuffer sb) {
		sb.append("{\"id\":\"").append(tree.getId()).append("\",\"text\":\"").append(tree.getName()).append("\"");
		if (tree.getCategoryType() != null && !"".equals(tree.getCategoryType())) {
			sb.append(",\"attributes\":{\"category_type\":\"").append(tree.getCategoryType()).append("\"}");
		}
		if (tree.getChilds() != null && tree.getChilds().size() > 0) {
			sb.append(",\"children\":[");
			for (int i = 0; i < tree.getChilds().size(); i++) {
				CategoryTree child = tree.getChilds().get(i);
				if (i > 0) {
					sb.append(",");
				}
				this.buildCategoryJson(child, sb);
			}
			sb.append("]");
		}
		sb.append("}");
	}

	@Override
	public List<Category> queryCategoryList() {
		List<CategoryTree> trees = this.queryCategoryTree(true);
		if (trees == null) {
			return null;
		}
		List<Category> categories = new ArrayList<Category>();
		int level = 0;
		for (CategoryTree tree : trees) {
			this.buildCategoryList(tree, categories, level);
		}
		return categories;
	}

	private void buildCategoryList(CategoryTree tree, List<Category> categories, int level) {
		if (level > 0) {
			String prev = "";
			for (int i = 0; i < level; i++) {
				prev += "&nbsp;&nbsp;&nbsp;&nbsp;";
			}
			tree.setName(prev + "┣" + tree.getName());
		}
		categories.add(tree);
		if (tree.getChilds() != null) {
			level++;
			for (CategoryTree child : tree.getChilds()) {
				this.buildCategoryList(child, categories, level);
			}
			level--;
		}
	}

	public List<Category> queryFirstLevel() {
		CategoryExample categoryExample = new CategoryExample();
		categoryExample.createCriteria().andParentIdEqualTo(0);
		categoryExample.setOrderByClause("sort");
		return categoryMapper.selectByExample(categoryExample);
	}

	public List<Category> queryChilds(Integer parentId) {
		CategoryExample categoryExample = new CategoryExample();
		categoryExample.createCriteria().andParentIdEqualTo(parentId);
		categoryExample.setOrderByClause("sort");
		return categoryMapper.selectByExample(categoryExample);
	}

	
	public Category queryByName(String name) {
		CategoryExample categoryExample = new CategoryExample();
		categoryExample.createCriteria().andNameEqualTo(name);
		List<Category> list = categoryMapper.selectByExample(categoryExample);
		return list == null || list.size() <= 0 ? null : list.get(0);
	}

	public Category queryByPrimaryKey(Integer id) {
		return categoryMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<Category> queryDisplayCategoryByPid(Integer pid, Integer page, Integer size) {
		CategoryExample categoryExample = new CategoryExample();
		categoryExample.createCriteria().andParentIdEqualTo(pid).andDisplayEqualTo(true);
		String limitSql = "";
		if (size != null && size > 0) {
			if (page != null && page > 0) {
				limitSql += " limit " + (page - 1) * size + "," + size;
			}else {
				limitSql += " limit " + size;
			}
		}
		categoryExample.setOrderByClause("sort" + limitSql);
		return categoryMapper.selectByExample(categoryExample);
	}

	@Override
	public int countDisplayCategoryByPid(Integer pid) {
		CategoryExample categoryExample = new CategoryExample();
		categoryExample.createCriteria().andParentIdEqualTo(pid);
		return categoryMapper.countByExample(categoryExample);
	}

	public CategoryMapper getCategoryMapper() {
		return categoryMapper;
	}

	public void setCategoryMapper(CategoryMapper categoryMapper) {
		this.categoryMapper = categoryMapper;
	}
	
}
