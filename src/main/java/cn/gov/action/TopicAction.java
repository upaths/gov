package cn.gov.action;

import cn.gov.model.Topic;
import cn.gov.model.TopicComment;
import cn.gov.model.TopicDetail;
import cn.gov.service.TopicService;
import cn.gov.util.AlertUtil;
import cn.gov.util.IpUtil;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 * Created by 王勇 on 2015/9/8.
 */
public class TopicAction extends BasicAction {

    private TopicService topicService;
    private List<TopicDetail> topicDetails;
    private Topic topic;
    private List<TopicComment> topicComments;
    private TopicComment topicComment;
    private Integer id;
    private String month;

    public String query() {
        List<Topic> topics = topicService.queryTopic();
        if (topics != null && topics.size() > 0) {
            topicDetails = new ArrayList<TopicDetail>(topics.size());
            for (Topic t : topics) {
                TopicDetail topicDetail = new TopicDetail(t);
                topicDetail.setChecked(topicService.countTopicCommentByTopicId(t.getId(), true));
                topicDetail.setUnchecked(topicService.countTopicCommentByTopicId(t.getId(), false));
                topicDetails.add(topicDetail);
            }
        }
        return "query";
    }

    public String toAdd() {
        month = new SimpleDateFormat("yyyy年M月").format(new Date());
        return "toAdd";
    }

    public String add() {
        topicService.insertTopic(topic);
        AlertUtil.alertThenGo(response, "添加成功！", "topic_query.action");
        return null;
    }

    public String toUpdate() {
        topic = topicService.queryTopicById(id);
        return "toUpdate";
    }

    public String update() {
        String msg;
        int cnt = topicService.updateTopic(topic);
        msg = cnt > 0 ? "更新成功！" : "更新失败！";
        AlertUtil.alertThenGo(response, msg, "topic_query.action");
        return null;
    }

    public String delete() {
        String msg;
        int cnt = topicService.deleteTopic(id);
        msg = cnt > 0 ? "删除成功！" : "删除失败！";
        AlertUtil.alertThenGo(response, msg, "topic_query.action");
        return null;
    }

    public String commentReview() {
        topicComments = topicService.queryTopicCommentByTopicId(id);
        return "commentReview";
    }

    public String commentUpdate() {
        String msg;
        int cnt = topicService.updateTopicComment(topicComment);
        msg = cnt > 0 ? "操作成功！" : "操作失败！";
        AlertUtil.alertThenGo(response, msg, "topic_commentReview.action?id=" + id);
        return null;
    }

    public String insertTopicComment() {
        topicComment.setIp(IpUtil.getClientIp(request));
        topicComment.setDate(new Date());
        topicComment.setDisplay(false);
        topicService.insertTopicComment(topicComment);
        AlertUtil.alertThenGo(response, "评论成功，请等待管理员审核！", request.getContextPath()+"/index.html");
        return null;
    }

    public TopicService getTopicService() {
        return topicService;
    }

    public void setTopicService(TopicService topicService) {
        this.topicService = topicService;
    }

    public List<TopicDetail> getTopicDetails() {
        return topicDetails;
    }

    public void setTopicDetails(List<TopicDetail> topicDetails) {
        this.topicDetails = topicDetails;
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

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }
}
