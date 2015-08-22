package cn.gov.service.impl;

import cn.gov.dao.SourceMapper;
import cn.gov.model.Source;
import cn.gov.model.SourceExample;
import cn.gov.service.SourceService;

import java.util.List;

/**
 * Created by 王勇 on 2015/8/21.
 */
public class SourceServiceImpl implements SourceService {

    private SourceMapper sourceMapper;
    @Override
    public List<Source> queryAllSource() {
        SourceExample sourceExample = new SourceExample();
        sourceExample.setOrderByClause("px");
        return this.sourceMapper.selectByExample(sourceExample);
    }

    public SourceMapper getSourceMapper() {
        return sourceMapper;
    }

    public void setSourceMapper(SourceMapper sourceMapper) {
        this.sourceMapper = sourceMapper;
    }
}
