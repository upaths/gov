package cn.gov.service.impl;

import cn.gov.dao.TopicCommentMapper;
import cn.gov.dao.TopicMapper;
import cn.gov.model.Topic;
import cn.gov.model.TopicComment;
import cn.gov.model.TopicCommentExample;
import cn.gov.model.TopicExample;
import cn.gov.service.TopicService;

import java.util.List;

/**
 * Created by 王勇 on 2015/9/8.
 */
public class TopicServiceImpl implements TopicService {

    private TopicMapper topicMapper;
    private TopicCommentMapper topicCommentMapper;

    @Override
    public void insertTopic(Topic topic) {
        topicMapper.insert(topic);
    }

    @Override
    public int updateTopic(Topic topic) {
        return topicMapper.updateByPrimaryKey(topic);
    }

    @Override
    public int deleteTopic(Integer id) {
        return topicMapper.deleteByPrimaryKey(id);
    }

    @Override
    public List<Topic> queryTopic() {
        TopicExample topicExample = new TopicExample();
        topicExample.setOrderByClause("id desc");
        return topicMapper.selectByExample(topicExample);
    }

    @Override
    public Topic queryTopicById(Integer id) {
        return topicMapper.selectByPrimaryKey(id);
    }

    @Override
    public void insertTopicComment(TopicComment topicComment) {
        topicCommentMapper.insert(topicComment);
    }

    @Override
    public int updateTopicComment(TopicComment topicComment) {
        return topicCommentMapper.updateByPrimaryKeySelective(topicComment);
    }

    @Override
    public int deleteTopicComment(Integer id) {
        return topicCommentMapper.deleteByPrimaryKey(id);
    }

    @Override
    public List<TopicComment> queryTopicCommentByTopicId(Integer TopicId) {
        TopicCommentExample topicCommentExample = new TopicCommentExample();
        topicCommentExample.createCriteria().andTopicIdEqualTo(TopicId);
        return topicCommentMapper.selectByExample(topicCommentExample);
    }

    @Override
    public int countTopicCommentByTopicId(Integer TopicId, Boolean display) {
        TopicCommentExample topicCommentExample = new TopicCommentExample();
        topicCommentExample.createCriteria().andTopicIdEqualTo(TopicId).andDisplayEqualTo(display);
        return topicCommentMapper.countByExample(topicCommentExample);
    }

    @Override
    public List<Topic> queryTopic(String sort, Integer page, Integer size) {
        TopicExample topicExample = new TopicExample();
        String limitSql = "";
        if (size != null && size > 0) {
            if (page != null && page > 0) {
                limitSql += " limit " + (page - 1) * size + "," + size;
            }else {
                limitSql += " limit " + size;
            }
        }
        if (sort != null && !"".equals(sort)) {
            topicExample.setOrderByClause(sort + limitSql);
        }else {
            topicExample.setOrderByClause("id desc" + limitSql);
        }
        return topicMapper.selectByExample(topicExample);
    }

    @Override
    public int countTopic() {
        return topicMapper.countByExample(null);
    }

    @Override
    public List<TopicComment> queryDisplayTopicComment(Integer topicId, String sort, Integer page, Integer size) {
        TopicCommentExample topicCommentExample = new TopicCommentExample();
        topicCommentExample.createCriteria().andTopicIdEqualTo(topicId);
        String limitSql = "";
        if (size != null && size > 0) {
            if (page != null && page > 0) {
                limitSql += " limit " + (page - 1) * size + "," + size;
            }else {
                limitSql += " limit " + size;
            }
        }
        if (sort != null && !"".equals(sort)) {
            topicCommentExample.setOrderByClause(sort + limitSql);
        }else {
            topicCommentExample.setOrderByClause("id desc" + limitSql);
        }
        return topicCommentMapper.selectByExample(topicCommentExample);
    }

    @Override
    public int countDisplayTopicComment(Integer topicId) {
        return this.countTopicCommentByTopicId(topicId, true);
    }

    public TopicMapper getTopicMapper() {
        return topicMapper;
    }

    public void setTopicMapper(TopicMapper topicMapper) {
        this.topicMapper = topicMapper;
    }

    public TopicCommentMapper getTopicCommentMapper() {
        return topicCommentMapper;
    }

    public void setTopicCommentMapper(TopicCommentMapper topicCommentMapper) {
        this.topicCommentMapper = topicCommentMapper;
    }
}
