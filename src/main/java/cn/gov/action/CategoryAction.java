package cn.gov.action;

import java.io.IOException;
import java.util.List;

import cn.gov.model.Category;
import cn.gov.model.CategoryTree;
import cn.gov.service.CategoryService;
import cn.gov.util.AlertUtil;

public class CategoryAction extends BasicAction {

	private String type;
	private Integer id;
	private Integer parentId;
	private Category category;
	private List<Category> list;
	private CategoryService categoryService;
	
	@SuppressWarnings("unchecked")
	public String query() {
		list = categoryService.queryCategoryList();
		return "query";
	}

	public void queryCategoryTree() {
		StringBuffer sb = new StringBuffer("[{\"id\":\"0\",\"text\":\"作为一级栏目\"");
		sb.append(",\"children\":[").append(categoryService.queryCategoryTreeJson()).append("]");
		sb.append("}]");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(sb.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void queryFirstLevelCategoryTree() {
		StringBuffer sb = new StringBuffer("[{\"id\":\"0\",\"text\":\"作为一级栏目\"");
		sb.append(",\"children\":[").append(categoryService.queryFirstLevelCategoryTreeJson()).append("]");
		sb.append("}]");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(sb.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public String toAdd() {
		if (parentId == null) {
			parentId = 0;
		}
		return "toAdd";
	}

	public String toUpdate() {
		category = categoryService.queryByPrimaryKey(id);
		return "toUpdate";
	}

	public String insert() {
		if (category.getDisplay() == null) {
			category.setDisplay(false);
		}
		categoryService.insert(category);
		AlertUtil.alertThenGo(response, "添加成功！", "category_query.action");
		return null;
	}

	public String update() {
		if (category.getDisplay() == null) {
			category.setDisplay(false);
		}
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
}
