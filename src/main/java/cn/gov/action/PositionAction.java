package cn.gov.action;

import cn.gov.model.Position;
import cn.gov.service.PositionService;
import cn.gov.util.AlertUtil;

import java.util.List;

/**
 * Created by 王勇 on 2015/8/22.
 */
public class PositionAction extends BasicAction {

    private List<Position> list;
    private Position position;
    private PositionService positionService;

    public String query() {
        list = positionService.queryAllPosition();
        return "query";
    }

    public String toAdd() {
        return "toAdd";
    }

    public String toUpdate() {
        position = positionService.queryPositionById(position.getId());
        return "toUpdate";
    }

    public String insert() {
        positionService.insertPosition(position);
        AlertUtil.alertThenGo(response, "添加成功！", "position_query.action");
        return null;
    }

    public String update() {
        positionService.updatePosition(position);
        AlertUtil.alertThenGo(response, "更新成功！", "position_query.action");
        return null;
    }

    public String delete() {
        positionService.deletePosition(position.getId());
        AlertUtil.alertThenGo(response, "删除成功！", "position_query.action");
        return null;
    }

    public List<Position> getList() {
        return list;
    }

    public void setList(List<Position> list) {
        this.list = list;
    }

    public Position getPosition() {
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
    }

    public PositionService getPositionService() {
        return positionService;
    }

    public void setPositionService(PositionService positionService) {
        this.positionService = positionService;
    }
}
