package cn.gov.service;

import cn.gov.model.Position;

import java.util.List;

/**
 * Created by 王勇 on 2015/8/21.
 */
public interface PositionService {

    public List<Position> queryAllPosition();

    public Position queryPositionById(Integer positionId);

    public void insertPosition(Position position);

    public int updatePosition(Position position);

    public int deletePosition(Integer positionId);
}
