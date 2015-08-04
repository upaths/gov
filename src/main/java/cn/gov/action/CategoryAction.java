package cn.gov.action;

import java.util.List;

import cn.gov.model.Category;
import cn.gov.model.CategoryTree;
import cn.gov.service.CategoryService;
import cn.gov.util.AlertUtil;

public class CategoryAction extends BasicAction {
	private Category category;
	private List<Category> list;
	private CategoryService categoryService;
	
	@SuppressWarnings("unchecked")
	public String query() {
		list = categoryService.queryCategoryList();
		return "query";
	}

	public String insert() {
		categoryService.insert(category);
		AlertUtil.alertThenGo(response, "添加成功！", "category_query.action");
		return null;
	}

	public String update() {
		categoryService.update(category);
		AlertUtil.alertThenGo(response, "更新成功！", "category_query.action");
		return null;
	}
	
	public String delete() {
		categoryService.delete(category.getId());
		categoryService.deleteChilds(category.getId());
		AlertUtil.alertThenGo(response, "删除成功！", "category_query.action");
		return null;
	}
	
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public List<Category> getList() {
		return list;
	}
	public void setList(List<Category> list) {
		this.list = list;
	}
	public CategoryService getCategoryService() {
		return categoryService;
	}
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	
}
