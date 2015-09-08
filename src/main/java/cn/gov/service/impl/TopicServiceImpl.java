package cn.gov.service.impl;

import cn.gov.dao.TopicCommentMapper;
import cn.gov.dao.TopicMapper;
import cn.gov.model.Topic;
import cn.gov.model.TopicComment;
import cn.gov.model.TopicCommentExample;
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
        return topicMapper.selectByExample(null);
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
