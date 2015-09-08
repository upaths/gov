package cn.gov.action;

import cn.gov.model.Topic;
import cn.gov.model.TopicComment;
import cn.gov.service.TopicService;

import java.util.List;

/**
 * Created by 王勇 on 2015/9/8.
 */
public class TopicAction extends BasicAction {

    private TopicService topicService;
    private List<Topic> topics;
    private Topic topic;
    private List<TopicComment> topicComments;
    private TopicComment topicComment;
    private Integer id;

    public String query() {
        return "query";
    }

    public TopicService getTopicService() {
        return topicService;
    }

    public void setTopicService(TopicService topicService) {
        this.topicService = topicService;
    }

    public List<Topic> getTopics() {
        return topics;
    }

    public void setTopics(List<Topic> topics) {
        this.topics = topics;
    }

    public Topic getTopic() {
        return topic;
    }

    public void setTopic(Topic topic) {
        this.topic = topic;
    }

    public List<TopicComment> getTopicComments() {
        return topicComments;
    }

    public void setTopicComments(List<TopicComment> topicComments) {
        this.topicComments = topicComments;
    }

    public TopicComment getTopicComment() {
        return topicComment;
    }

    public void setTopicComment(TopicComment topicComment) {
        this.topicComment = topicComment;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}
