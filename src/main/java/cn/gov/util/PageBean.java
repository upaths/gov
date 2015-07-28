package cn.gov.util;

import java.util.HashMap;
import java.util.Map;

public class PageBean {
    private Map<String,String> params=new HashMap<String, String>();
    int currentPage = 1;  //当前页
    public int totalPages = 0;  //总页数
    int pageSize = -1;//第一次赋值时需要设置
    int totalRows = 0;  //总数据数

    public PageBean() {
    }
    
    /**
     * 初始化页面参数
     * @param pageSize 页面尺寸-每页行数
     * @param currentPage 当前页
     */
    public PageBean(int pageSize,int currentPage) {
    	this.pageSize = pageSize;
    	this.currentPage = currentPage;
    }
    
    /**
     * 初始化页面参数
     *
     * @param totalRows   总行数
     * @param pageSize    页面尺寸(每页行数)
     * @param currentPage 当前页
     */
    public PageBean(int totalRows, int pageSize, int currentPage) {
        this.totalRows = totalRows;
        this.pageSize = pageSize;
        this.currentPage = currentPage;
    }

    /**
     * 获取当前第几页
     * @return 当前第几页
     */
    public int getCurrentPage() {
        return Math.min(Math.max(currentPage, 1), getTotalPages());
    }

    /**
     * 获取当前页第一条的索引
     * @return 当前页第一条的索引
     */
    public int getCurrentPageBeginIndex(){
        return (this.getCurrentPage()-1)*this.getPageSize()+1;
    }

    /**
     * 获取当前页的最后一条的索引
     * @return 当前页的最后一条的索引
     */
    public int getCurrentPageEndIndex(){
        return Math.min(this.getCurrentPage()*this.getPageSize(),this.getTotalRows());
    }

    /**
     * 设置当前第几页
     * @param currentPage 当前页数
     */
    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    /**
     * 获取总页数
     * @return 总页数
     */
    public int getTotalPages() {
        return Math.max((getTotalRows() + getPageSize() - 1) / getPageSize(), 1);
    }

    /**
     * 设置总页数
     * @param totalPages 总页数
     * @deprecated 不起作用
     */
    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }

    /**
     * 获取每一页的尺寸
     * @return 页面尺寸
     */
    public int getPageSize() {
        return pageSize;
    }

    /**
     * 设置页面尺寸
     * @param pageSize 页面尺寸
     */
    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    /**
     * 获取总行数
     * @return 总行数
     */
    public int getTotalRows() {
        return totalRows;
    }

    /**
     * 设置总行数
     * @param totalRows 总行数
     */
    public void setTotalRows(int totalRows) {
        this.totalRows = totalRows;
    }

    /**
     * 是否最后一页
     * @return 是否最后一页
     */
    public boolean isLastPage() {
        return this.getCurrentPage() == getTotalPages();
    }

    /**
     * 是否第一页
     * @return 是否第一页
     */
    public boolean isFirstPage() {
        return this.getCurrentPage() == 1;
    }
    public void addParam(String name,String value){
        params.put(name,value);
    }
    public void remove(String name){
        params.remove(name);
    }

    public Map getParams() {
        return params;
    }

    public void setParams(Map params) {
        this.params = params;
    }

}
