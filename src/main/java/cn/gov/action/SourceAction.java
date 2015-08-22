package cn.gov.action;

import cn.gov.model.Source;
import cn.gov.service.SourceService;
import cn.gov.util.AlertUtil;

import java.util.List;

/**
 * Created by 王勇 on 2015/8/22.
 */
public class SourceAction extends BasicAction {

    private List<Source> list;
    private Source source;
    private SourceService sourceService;

    public String query() {
        list = sourceService.queryAllSource();
        return "query";
    }

    public String toAdd() {
        return "toAdd";
    }

    public String toUpdate() {
        source = sourceService.querySourceById(source.getId());
        return "toUpdate";
    }

    public String insert() {
        sourceService.insertSource(source);
        AlertUtil.alertThenGo(response, "添加成功！", "source_query.action");
        return null;
    }

    public String update() {
        sourceService.updateSource(source);
        AlertUtil.alertThenGo(response, "更新成功！", "source_query.action");
        return null;
    }

    public String delete() {
        sourceService.deleteSource(source.getId());
        AlertUtil.alertThenGo(response, "删除成功！", "source_query.action");
        return null;
    }

    public List<Source> getList() {
        return list;
    }

    public void setList(List<Source> list) {
        this.list = list;
    }

    public Source getSource() {
        return source;
    }

    public void setSource(Source source) {
        this.source = source;
    }

    public SourceService getSourceService() {
        return sourceService;
    }

    public void setSourceService(SourceService sourceService) {
        this.sourceService = sourceService;
    }
}
