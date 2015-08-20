package cn.gov.service.impl;

import java.util.ArrayList;
import java.util.List;

import cn.gov.dao.CategoryMapper;
import cn.gov.model.Category;
import cn.gov.model.CategoryExample;
import cn.gov.model.CategoryTree;
import cn.gov.service.CategoryService;

public class CategoryServiceImpl implements CategoryService {
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
		CategoryExample categoryExample = new CategoryExample();
		categoryExample.createCriteria().andParentIdEqualTo(parentId);
		return categoryMapper.deleteByExample(categoryExample);
	}

	@Override
	public List<CategoryTree> queryCategoryTree() {
		List<CategoryTree> categoryTreeList = new ArrayList<CategoryTree>();
		List<Category> list = this.queryFirstLevel();
		for (Category c : list) {
			CategoryTree categoryTree = new CategoryTree(c);
			this.buildCategoryTree(categoryTree);
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
		List<CategoryTree> trees = this.queryCategoryTree();
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
		sb.append("{\"id\":\"").append(tree.getId()).append("\",\"text\":\"").append(tree.getMc()).append("\"");
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
		List<CategoryTree> trees = this.queryCategoryTree();
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
			tree.setMc(prev + "┣"+tree.getMc());
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
		categoryExample.createCriteria().andParentIdIsNull();
		categoryExample.setOrderByClause("px");
		return categoryMapper.selectByExample(categoryExample);
	}

	public List<Category> queryChilds(Integer parentId) {
		CategoryExample categoryExample = new CategoryExample();
		categoryExample.createCriteria().andParentIdEqualTo(parentId);
		categoryExample.setOrderByClause("px");
		return categoryMapper.selectByExample(categoryExample);
	}

	
	public Category queryByMc(String mc) {
		CategoryExample categoryExample = new CategoryExample();
		categoryExample.createCriteria().andMcEqualTo(mc);
		List<Category> list = categoryMapper.selectByExample(categoryExample);
		return list == null || list.size() <= 0 ? null : list.get(0);
	}

	public Category queryByPrimaryKey(Integer id) {
		return categoryMapper.selectByPrimaryKey(id);
	}

	public CategoryMapper getCategoryMapper() {
		return categoryMapper;
	}

	public void setCategoryMapper(CategoryMapper categoryMapper) {
		this.categoryMapper = categoryMapper;
	}
	
}
