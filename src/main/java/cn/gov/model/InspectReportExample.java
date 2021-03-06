package cn.gov.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class InspectReportExample {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table inspect_report
     *
     * @mbggenerated
     */
    protected String orderByClause;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table inspect_report
     *
     * @mbggenerated
     */
    protected boolean distinct;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table inspect_report
     *
     * @mbggenerated
     */
    protected List<Criteria> oredCriteria;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inspect_report
     *
     * @mbggenerated
     */
    public InspectReportExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inspect_report
     *
     * @mbggenerated
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inspect_report
     *
     * @mbggenerated
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inspect_report
     *
     * @mbggenerated
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inspect_report
     *
     * @mbggenerated
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inspect_report
     *
     * @mbggenerated
     */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inspect_report
     *
     * @mbggenerated
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inspect_report
     *
     * @mbggenerated
     */
    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inspect_report
     *
     * @mbggenerated
     */
    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inspect_report
     *
     * @mbggenerated
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table inspect_report
     *
     * @mbggenerated
     */
    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table inspect_report
     *
     * @mbggenerated
     */
    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andReportNameIsNull() {
            addCriterion("report_name is null");
            return (Criteria) this;
        }

        public Criteria andReportNameIsNotNull() {
            addCriterion("report_name is not null");
            return (Criteria) this;
        }

        public Criteria andReportNameEqualTo(String value) {
            addCriterion("report_name =", value, "reportName");
            return (Criteria) this;
        }

        public Criteria andReportNameNotEqualTo(String value) {
            addCriterion("report_name <>", value, "reportName");
            return (Criteria) this;
        }

        public Criteria andReportNameGreaterThan(String value) {
            addCriterion("report_name >", value, "reportName");
            return (Criteria) this;
        }

        public Criteria andReportNameGreaterThanOrEqualTo(String value) {
            addCriterion("report_name >=", value, "reportName");
            return (Criteria) this;
        }

        public Criteria andReportNameLessThan(String value) {
            addCriterion("report_name <", value, "reportName");
            return (Criteria) this;
        }

        public Criteria andReportNameLessThanOrEqualTo(String value) {
            addCriterion("report_name <=", value, "reportName");
            return (Criteria) this;
        }

        public Criteria andReportNameLike(String value) {
            addCriterion("report_name like", value, "reportName");
            return (Criteria) this;
        }

        public Criteria andReportNameNotLike(String value) {
            addCriterion("report_name not like", value, "reportName");
            return (Criteria) this;
        }

        public Criteria andReportNameIn(List<String> values) {
            addCriterion("report_name in", values, "reportName");
            return (Criteria) this;
        }

        public Criteria andReportNameNotIn(List<String> values) {
            addCriterion("report_name not in", values, "reportName");
            return (Criteria) this;
        }

        public Criteria andReportNameBetween(String value1, String value2) {
            addCriterion("report_name between", value1, value2, "reportName");
            return (Criteria) this;
        }

        public Criteria andReportNameNotBetween(String value1, String value2) {
            addCriterion("report_name not between", value1, value2, "reportName");
            return (Criteria) this;
        }

        public Criteria andReportContactIsNull() {
            addCriterion("report_contact is null");
            return (Criteria) this;
        }

        public Criteria andReportContactIsNotNull() {
            addCriterion("report_contact is not null");
            return (Criteria) this;
        }

        public Criteria andReportContactEqualTo(String value) {
            addCriterion("report_contact =", value, "reportContact");
            return (Criteria) this;
        }

        public Criteria andReportContactNotEqualTo(String value) {
            addCriterion("report_contact <>", value, "reportContact");
            return (Criteria) this;
        }

        public Criteria andReportContactGreaterThan(String value) {
            addCriterion("report_contact >", value, "reportContact");
            return (Criteria) this;
        }

        public Criteria andReportContactGreaterThanOrEqualTo(String value) {
            addCriterion("report_contact >=", value, "reportContact");
            return (Criteria) this;
        }

        public Criteria andReportContactLessThan(String value) {
            addCriterion("report_contact <", value, "reportContact");
            return (Criteria) this;
        }

        public Criteria andReportContactLessThanOrEqualTo(String value) {
            addCriterion("report_contact <=", value, "reportContact");
            return (Criteria) this;
        }

        public Criteria andReportContactLike(String value) {
            addCriterion("report_contact like", value, "reportContact");
            return (Criteria) this;
        }

        public Criteria andReportContactNotLike(String value) {
            addCriterion("report_contact not like", value, "reportContact");
            return (Criteria) this;
        }

        public Criteria andReportContactIn(List<String> values) {
            addCriterion("report_contact in", values, "reportContact");
            return (Criteria) this;
        }

        public Criteria andReportContactNotIn(List<String> values) {
            addCriterion("report_contact not in", values, "reportContact");
            return (Criteria) this;
        }

        public Criteria andReportContactBetween(String value1, String value2) {
            addCriterion("report_contact between", value1, value2, "reportContact");
            return (Criteria) this;
        }

        public Criteria andReportContactNotBetween(String value1, String value2) {
            addCriterion("report_contact not between", value1, value2, "reportContact");
            return (Criteria) this;
        }

        public Criteria andReportConditionIsNull() {
            addCriterion("report_condition is null");
            return (Criteria) this;
        }

        public Criteria andReportConditionIsNotNull() {
            addCriterion("report_condition is not null");
            return (Criteria) this;
        }

        public Criteria andReportConditionEqualTo(String value) {
            addCriterion("report_condition =", value, "reportCondition");
            return (Criteria) this;
        }

        public Criteria andReportConditionNotEqualTo(String value) {
            addCriterion("report_condition <>", value, "reportCondition");
            return (Criteria) this;
        }

        public Criteria andReportConditionGreaterThan(String value) {
            addCriterion("report_condition >", value, "reportCondition");
            return (Criteria) this;
        }

        public Criteria andReportConditionGreaterThanOrEqualTo(String value) {
            addCriterion("report_condition >=", value, "reportCondition");
            return (Criteria) this;
        }

        public Criteria andReportConditionLessThan(String value) {
            addCriterion("report_condition <", value, "reportCondition");
            return (Criteria) this;
        }

        public Criteria andReportConditionLessThanOrEqualTo(String value) {
            addCriterion("report_condition <=", value, "reportCondition");
            return (Criteria) this;
        }

        public Criteria andReportConditionLike(String value) {
            addCriterion("report_condition like", value, "reportCondition");
            return (Criteria) this;
        }

        public Criteria andReportConditionNotLike(String value) {
            addCriterion("report_condition not like", value, "reportCondition");
            return (Criteria) this;
        }

        public Criteria andReportConditionIn(List<String> values) {
            addCriterion("report_condition in", values, "reportCondition");
            return (Criteria) this;
        }

        public Criteria andReportConditionNotIn(List<String> values) {
            addCriterion("report_condition not in", values, "reportCondition");
            return (Criteria) this;
        }

        public Criteria andReportConditionBetween(String value1, String value2) {
            addCriterion("report_condition between", value1, value2, "reportCondition");
            return (Criteria) this;
        }

        public Criteria andReportConditionNotBetween(String value1, String value2) {
            addCriterion("report_condition not between", value1, value2, "reportCondition");
            return (Criteria) this;
        }

        public Criteria andReportedNameIsNull() {
            addCriterion("reported_name is null");
            return (Criteria) this;
        }

        public Criteria andReportedNameIsNotNull() {
            addCriterion("reported_name is not null");
            return (Criteria) this;
        }

        public Criteria andReportedNameEqualTo(String value) {
            addCriterion("reported_name =", value, "reportedName");
            return (Criteria) this;
        }

        public Criteria andReportedNameNotEqualTo(String value) {
            addCriterion("reported_name <>", value, "reportedName");
            return (Criteria) this;
        }

        public Criteria andReportedNameGreaterThan(String value) {
            addCriterion("reported_name >", value, "reportedName");
            return (Criteria) this;
        }

        public Criteria andReportedNameGreaterThanOrEqualTo(String value) {
            addCriterion("reported_name >=", value, "reportedName");
            return (Criteria) this;
        }

        public Criteria andReportedNameLessThan(String value) {
            addCriterion("reported_name <", value, "reportedName");
            return (Criteria) this;
        }

        public Criteria andReportedNameLessThanOrEqualTo(String value) {
            addCriterion("reported_name <=", value, "reportedName");
            return (Criteria) this;
        }

        public Criteria andReportedNameLike(String value) {
            addCriterion("reported_name like", value, "reportedName");
            return (Criteria) this;
        }

        public Criteria andReportedNameNotLike(String value) {
            addCriterion("reported_name not like", value, "reportedName");
            return (Criteria) this;
        }

        public Criteria andReportedNameIn(List<String> values) {
            addCriterion("reported_name in", values, "reportedName");
            return (Criteria) this;
        }

        public Criteria andReportedNameNotIn(List<String> values) {
            addCriterion("reported_name not in", values, "reportedName");
            return (Criteria) this;
        }

        public Criteria andReportedNameBetween(String value1, String value2) {
            addCriterion("reported_name between", value1, value2, "reportedName");
            return (Criteria) this;
        }

        public Criteria andReportedNameNotBetween(String value1, String value2) {
            addCriterion("reported_name not between", value1, value2, "reportedName");
            return (Criteria) this;
        }

        public Criteria andReportedConditionIsNull() {
            addCriterion("reported_condition is null");
            return (Criteria) this;
        }

        public Criteria andReportedConditionIsNotNull() {
            addCriterion("reported_condition is not null");
            return (Criteria) this;
        }

        public Criteria andReportedConditionEqualTo(String value) {
            addCriterion("reported_condition =", value, "reportedCondition");
            return (Criteria) this;
        }

        public Criteria andReportedConditionNotEqualTo(String value) {
            addCriterion("reported_condition <>", value, "reportedCondition");
            return (Criteria) this;
        }

        public Criteria andReportedConditionGreaterThan(String value) {
            addCriterion("reported_condition >", value, "reportedCondition");
            return (Criteria) this;
        }

        public Criteria andReportedConditionGreaterThanOrEqualTo(String value) {
            addCriterion("reported_condition >=", value, "reportedCondition");
            return (Criteria) this;
        }

        public Criteria andReportedConditionLessThan(String value) {
            addCriterion("reported_condition <", value, "reportedCondition");
            return (Criteria) this;
        }

        public Criteria andReportedConditionLessThanOrEqualTo(String value) {
            addCriterion("reported_condition <=", value, "reportedCondition");
            return (Criteria) this;
        }

        public Criteria andReportedConditionLike(String value) {
            addCriterion("reported_condition like", value, "reportedCondition");
            return (Criteria) this;
        }

        public Criteria andReportedConditionNotLike(String value) {
            addCriterion("reported_condition not like", value, "reportedCondition");
            return (Criteria) this;
        }

        public Criteria andReportedConditionIn(List<String> values) {
            addCriterion("reported_condition in", values, "reportedCondition");
            return (Criteria) this;
        }

        public Criteria andReportedConditionNotIn(List<String> values) {
            addCriterion("reported_condition not in", values, "reportedCondition");
            return (Criteria) this;
        }

        public Criteria andReportedConditionBetween(String value1, String value2) {
            addCriterion("reported_condition between", value1, value2, "reportedCondition");
            return (Criteria) this;
        }

        public Criteria andReportedConditionNotBetween(String value1, String value2) {
            addCriterion("reported_condition not between", value1, value2, "reportedCondition");
            return (Criteria) this;
        }

        public Criteria andTitleIsNull() {
            addCriterion("title is null");
            return (Criteria) this;
        }

        public Criteria andTitleIsNotNull() {
            addCriterion("title is not null");
            return (Criteria) this;
        }

        public Criteria andTitleEqualTo(String value) {
            addCriterion("title =", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotEqualTo(String value) {
            addCriterion("title <>", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleGreaterThan(String value) {
            addCriterion("title >", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleGreaterThanOrEqualTo(String value) {
            addCriterion("title >=", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLessThan(String value) {
            addCriterion("title <", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLessThanOrEqualTo(String value) {
            addCriterion("title <=", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleLike(String value) {
            addCriterion("title like", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotLike(String value) {
            addCriterion("title not like", value, "title");
            return (Criteria) this;
        }

        public Criteria andTitleIn(List<String> values) {
            addCriterion("title in", values, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotIn(List<String> values) {
            addCriterion("title not in", values, "title");
            return (Criteria) this;
        }

        public Criteria andTitleBetween(String value1, String value2) {
            addCriterion("title between", value1, value2, "title");
            return (Criteria) this;
        }

        public Criteria andTitleNotBetween(String value1, String value2) {
            addCriterion("title not between", value1, value2, "title");
            return (Criteria) this;
        }

        public Criteria andProblemIsNull() {
            addCriterion("problem is null");
            return (Criteria) this;
        }

        public Criteria andProblemIsNotNull() {
            addCriterion("problem is not null");
            return (Criteria) this;
        }

        public Criteria andProblemEqualTo(String value) {
            addCriterion("problem =", value, "problem");
            return (Criteria) this;
        }

        public Criteria andProblemNotEqualTo(String value) {
            addCriterion("problem <>", value, "problem");
            return (Criteria) this;
        }

        public Criteria andProblemGreaterThan(String value) {
            addCriterion("problem >", value, "problem");
            return (Criteria) this;
        }

        public Criteria andProblemGreaterThanOrEqualTo(String value) {
            addCriterion("problem >=", value, "problem");
            return (Criteria) this;
        }

        public Criteria andProblemLessThan(String value) {
            addCriterion("problem <", value, "problem");
            return (Criteria) this;
        }

        public Criteria andProblemLessThanOrEqualTo(String value) {
            addCriterion("problem <=", value, "problem");
            return (Criteria) this;
        }

        public Criteria andProblemLike(String value) {
            addCriterion("problem like", value, "problem");
            return (Criteria) this;
        }

        public Criteria andProblemNotLike(String value) {
            addCriterion("problem not like", value, "problem");
            return (Criteria) this;
        }

        public Criteria andProblemIn(List<String> values) {
            addCriterion("problem in", values, "problem");
            return (Criteria) this;
        }

        public Criteria andProblemNotIn(List<String> values) {
            addCriterion("problem not in", values, "problem");
            return (Criteria) this;
        }

        public Criteria andProblemBetween(String value1, String value2) {
            addCriterion("problem between", value1, value2, "problem");
            return (Criteria) this;
        }

        public Criteria andProblemNotBetween(String value1, String value2) {
            addCriterion("problem not between", value1, value2, "problem");
            return (Criteria) this;
        }

        public Criteria andDocIsNull() {
            addCriterion("doc is null");
            return (Criteria) this;
        }

        public Criteria andDocIsNotNull() {
            addCriterion("doc is not null");
            return (Criteria) this;
        }

        public Criteria andDocEqualTo(String value) {
            addCriterion("doc =", value, "doc");
            return (Criteria) this;
        }

        public Criteria andDocNotEqualTo(String value) {
            addCriterion("doc <>", value, "doc");
            return (Criteria) this;
        }

        public Criteria andDocGreaterThan(String value) {
            addCriterion("doc >", value, "doc");
            return (Criteria) this;
        }

        public Criteria andDocGreaterThanOrEqualTo(String value) {
            addCriterion("doc >=", value, "doc");
            return (Criteria) this;
        }

        public Criteria andDocLessThan(String value) {
            addCriterion("doc <", value, "doc");
            return (Criteria) this;
        }

        public Criteria andDocLessThanOrEqualTo(String value) {
            addCriterion("doc <=", value, "doc");
            return (Criteria) this;
        }

        public Criteria andDocLike(String value) {
            addCriterion("doc like", value, "doc");
            return (Criteria) this;
        }

        public Criteria andDocNotLike(String value) {
            addCriterion("doc not like", value, "doc");
            return (Criteria) this;
        }

        public Criteria andDocIn(List<String> values) {
            addCriterion("doc in", values, "doc");
            return (Criteria) this;
        }

        public Criteria andDocNotIn(List<String> values) {
            addCriterion("doc not in", values, "doc");
            return (Criteria) this;
        }

        public Criteria andDocBetween(String value1, String value2) {
            addCriterion("doc between", value1, value2, "doc");
            return (Criteria) this;
        }

        public Criteria andDocNotBetween(String value1, String value2) {
            addCriterion("doc not between", value1, value2, "doc");
            return (Criteria) this;
        }

        public Criteria andInspectIdIsNull() {
            addCriterion("inspect_id is null");
            return (Criteria) this;
        }

        public Criteria andInspectIdIsNotNull() {
            addCriterion("inspect_id is not null");
            return (Criteria) this;
        }

        public Criteria andInspectIdEqualTo(Integer value) {
            addCriterion("inspect_id =", value, "inspectId");
            return (Criteria) this;
        }

        public Criteria andInspectIdNotEqualTo(Integer value) {
            addCriterion("inspect_id <>", value, "inspectId");
            return (Criteria) this;
        }

        public Criteria andInspectIdGreaterThan(Integer value) {
            addCriterion("inspect_id >", value, "inspectId");
            return (Criteria) this;
        }

        public Criteria andInspectIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("inspect_id >=", value, "inspectId");
            return (Criteria) this;
        }

        public Criteria andInspectIdLessThan(Integer value) {
            addCriterion("inspect_id <", value, "inspectId");
            return (Criteria) this;
        }

        public Criteria andInspectIdLessThanOrEqualTo(Integer value) {
            addCriterion("inspect_id <=", value, "inspectId");
            return (Criteria) this;
        }

        public Criteria andInspectIdIn(List<Integer> values) {
            addCriterion("inspect_id in", values, "inspectId");
            return (Criteria) this;
        }

        public Criteria andInspectIdNotIn(List<Integer> values) {
            addCriterion("inspect_id not in", values, "inspectId");
            return (Criteria) this;
        }

        public Criteria andInspectIdBetween(Integer value1, Integer value2) {
            addCriterion("inspect_id between", value1, value2, "inspectId");
            return (Criteria) this;
        }

        public Criteria andInspectIdNotBetween(Integer value1, Integer value2) {
            addCriterion("inspect_id not between", value1, value2, "inspectId");
            return (Criteria) this;
        }

        public Criteria andDateIsNull() {
            addCriterion("date is null");
            return (Criteria) this;
        }

        public Criteria andDateIsNotNull() {
            addCriterion("date is not null");
            return (Criteria) this;
        }

        public Criteria andDateEqualTo(Date value) {
            addCriterion("date =", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateNotEqualTo(Date value) {
            addCriterion("date <>", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateGreaterThan(Date value) {
            addCriterion("date >", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateGreaterThanOrEqualTo(Date value) {
            addCriterion("date >=", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateLessThan(Date value) {
            addCriterion("date <", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateLessThanOrEqualTo(Date value) {
            addCriterion("date <=", value, "date");
            return (Criteria) this;
        }

        public Criteria andDateIn(List<Date> values) {
            addCriterion("date in", values, "date");
            return (Criteria) this;
        }

        public Criteria andDateNotIn(List<Date> values) {
            addCriterion("date not in", values, "date");
            return (Criteria) this;
        }

        public Criteria andDateBetween(Date value1, Date value2) {
            addCriterion("date between", value1, value2, "date");
            return (Criteria) this;
        }

        public Criteria andDateNotBetween(Date value1, Date value2) {
            addCriterion("date not between", value1, value2, "date");
            return (Criteria) this;
        }

        public Criteria andIpIsNull() {
            addCriterion("ip is null");
            return (Criteria) this;
        }

        public Criteria andIpIsNotNull() {
            addCriterion("ip is not null");
            return (Criteria) this;
        }

        public Criteria andIpEqualTo(String value) {
            addCriterion("ip =", value, "ip");
            return (Criteria) this;
        }

        public Criteria andIpNotEqualTo(String value) {
            addCriterion("ip <>", value, "ip");
            return (Criteria) this;
        }

        public Criteria andIpGreaterThan(String value) {
            addCriterion("ip >", value, "ip");
            return (Criteria) this;
        }

        public Criteria andIpGreaterThanOrEqualTo(String value) {
            addCriterion("ip >=", value, "ip");
            return (Criteria) this;
        }

        public Criteria andIpLessThan(String value) {
            addCriterion("ip <", value, "ip");
            return (Criteria) this;
        }

        public Criteria andIpLessThanOrEqualTo(String value) {
            addCriterion("ip <=", value, "ip");
            return (Criteria) this;
        }

        public Criteria andIpLike(String value) {
            addCriterion("ip like", value, "ip");
            return (Criteria) this;
        }

        public Criteria andIpNotLike(String value) {
            addCriterion("ip not like", value, "ip");
            return (Criteria) this;
        }

        public Criteria andIpIn(List<String> values) {
            addCriterion("ip in", values, "ip");
            return (Criteria) this;
        }

        public Criteria andIpNotIn(List<String> values) {
            addCriterion("ip not in", values, "ip");
            return (Criteria) this;
        }

        public Criteria andIpBetween(String value1, String value2) {
            addCriterion("ip between", value1, value2, "ip");
            return (Criteria) this;
        }

        public Criteria andIpNotBetween(String value1, String value2) {
            addCriterion("ip not between", value1, value2, "ip");
            return (Criteria) this;
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table inspect_report
     *
     * @mbggenerated do_not_delete_during_merge
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table inspect_report
     *
     * @mbggenerated
     */
    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}