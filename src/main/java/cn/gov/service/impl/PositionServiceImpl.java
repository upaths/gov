package cn.gov.service.impl;

import cn.gov.dao.PositionMapper;
import cn.gov.model.Position;
import cn.gov.model.PositionExample;
import cn.gov.service.PositionService;

import java.util.List;

/**
 * Created by 王勇 on 2015/8/21.
 */
public class PositionServiceImpl implements PositionService {

    private PositionMapper positionMapper;
    @Override
    public List<Position> queryAllPosition() {
        PositionExample positionExample = new PositionExample();
        positionExample.setOrderByClause("px");
        return positionMapper.selectByExample(positionExample);
    }

    public PositionMapper getPositionMapper() {
        return positionMapper;
    }

    public void setPositionMapper(PositionMapper positionMapper) {
        this.positionMapper = positionMapper;
    }
}
