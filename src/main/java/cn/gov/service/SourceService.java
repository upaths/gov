package cn.gov.service;

import cn.gov.model.Source;

import java.util.List;

/**
 * Created by 王勇 on 2015/8/21.
 */
public interface SourceService {

    public List<Source> queryAllSource();

    public Source querySourceById(Integer sourceId);

    public void insertSource(Source source);

    public int updateSource(Source source);

    public int deleteSource(Integer sourceId);

}
