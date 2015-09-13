package cn.gov.service;

import cn.gov.model.Topic;
import cn.gov.model.TopicComment;

import java.util.List;

/**
 * Created by 王勇 on 2015/9/8.
 */
public interface TopicService {
    public void insertTopic(Topic topic);

    public int updateTopic(Topic topic);

    public int deleteTopic(Integer id);

    public List<Topic> queryTopic();

    public Topic queryTopicById(Integer id);

    public void insertTopicComment(TopicComment topicComment);

    public int updateTopicComment(TopicComment topicComment);

    public int deleteTopicComment(Integer id);

    public List<TopicComment> queryTopicCommentByTopicId(Integer TopicId);

    public int countTopicCommentByTopicId(Integer TopicId, Boolean display);

    public List<Topic> queryTopic(String sort, Integer page, Integer size);

    public int countTopic();

    public List<TopicComment> queryDisplayTopicComment(Integer topicId, String sort, Integer page, Integer size);

    public int countDisplayTopicComment(Integer topicId);

}
