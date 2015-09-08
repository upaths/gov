package cn.gov.model;

public class Topic {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column topic.id
     *
     * @mbggenerated
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column topic.title
     *
     * @mbggenerated
     */
    private String title;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column topic.content
     *
     * @mbggenerated
     */
    private String content;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column topic.month
     *
     * @mbggenerated
     */
    private String month;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column topic.id
     *
     * @return the value of topic.id
     *
     * @mbggenerated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column topic.id
     *
     * @param id the value for topic.id
     *
     * @mbggenerated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column topic.title
     *
     * @return the value of topic.title
     *
     * @mbggenerated
     */
    public String getTitle() {
        return title;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column topic.title
     *
     * @param title the value for topic.title
     *
     * @mbggenerated
     */
    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column topic.content
     *
     * @return the value of topic.content
     *
     * @mbggenerated
     */
    public String getContent() {
        return content;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column topic.content
     *
     * @param content the value for topic.content
     *
     * @mbggenerated
     */
    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column topic.month
     *
     * @return the value of topic.month
     *
     * @mbggenerated
     */
    public String getMonth() {
        return month;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column topic.month
     *
     * @param month the value for topic.month
     *
     * @mbggenerated
     */
    public void setMonth(String month) {
        this.month = month == null ? null : month.trim();
    }
}