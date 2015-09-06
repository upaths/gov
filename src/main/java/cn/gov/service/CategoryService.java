package cn.gov.service;

import java.util.List;

import cn.gov.model.Category;
import cn.gov.model.CategoryTree;

public interface CategoryService {
	
	public void insert(Category category);

	public int update(Category category);

	public int delete(Integer id);

	public int deleteChilds(Integer parentId);

	public List<CategoryTree> queryCategoryTree();

	public String queryCategoryTreeJson();

	public List<Category> queryCategoryList();

	public List<Category> queryFirstLevel();

	public List<Category> queryChilds(Integer parentId);

	public Category queryByPrimaryKey(Integer id);
	
	public Category queryByName(String mc);
}
