package cn.gov.model;

import java.util.ArrayList;
import java.util.List;

public class ConfigExample {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table config
     *
     * @mbggenerated
     */
    protected String orderByClause;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table config
     *
     * @mbggenerated
     */
    protected boolean distinct;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table config
     *
     * @mbggenerated
     */
    protected List<Criteria> oredCriteria;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table config
     *
     * @mbggenerated
     */
    public ConfigExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table config
     *
     * @mbggenerated
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table config
     *
     * @mbggenerated
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table config
     *
     * @mbggenerated
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table config
     *
     * @mbggenerated
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table config
     *
     * @mbggenerated
     */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table config
     *
     * @mbggenerated
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table config
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
     * This method corresponds to the database table config
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
     * This method corresponds to the database table config
     *
     * @mbggenerated
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table config
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
     * This class corresponds to the database table config
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

        public Criteria andZdmIsNull() {
            addCriterion("zdm is null");
            return (Criteria) this;
        }

        public Criteria andZdmIsNotNull() {
            addCriterion("zdm is not null");
            return (Criteria) this;
        }

        public Criteria andZdmEqualTo(String value) {
            addCriterion("zdm =", value, "zdm");
            return (Criteria) this;
        }

        public Criteria andZdmNotEqualTo(String value) {
            addCriterion("zdm <>", value, "zdm");
            return (Criteria) this;
        }

        public Criteria andZdmGreaterThan(String value) {
            addCriterion("zdm >", value, "zdm");
            return (Criteria) this;
        }

        public Criteria andZdmGreaterThanOrEqualTo(String value) {
            addCriterion("zdm >=", value, "zdm");
            return (Criteria) this;
        }

        public Criteria andZdmLessThan(String value) {
            addCriterion("zdm <", value, "zdm");
            return (Criteria) this;
        }

        public Criteria andZdmLessThanOrEqualTo(String value) {
            addCriterion("zdm <=", value, "zdm");
            return (Criteria) this;
        }

        public Criteria andZdmLike(String value) {
            addCriterion("zdm like", value, "zdm");
            return (Criteria) this;
        }

        public Criteria andZdmNotLike(String value) {
            addCriterion("zdm not like", value, "zdm");
            return (Criteria) this;
        }

        public Criteria andZdmIn(List<String> values) {
            addCriterion("zdm in", values, "zdm");
            return (Criteria) this;
        }

        public Criteria andZdmNotIn(List<String> values) {
            addCriterion("zdm not in", values, "zdm");
            return (Criteria) this;
        }

        public Criteria andZdmBetween(String value1, String value2) {
            addCriterion("zdm between", value1, value2, "zdm");
            return (Criteria) this;
        }

        public Criteria andZdmNotBetween(String value1, String value2) {
            addCriterion("zdm not between", value1, value2, "zdm");
            return (Criteria) this;
        }

        public Criteria andYmIsNull() {
            addCriterion("ym is null");
            return (Criteria) this;
        }

        public Criteria andYmIsNotNull() {
            addCriterion("ym is not null");
            return (Criteria) this;
        }

        public Criteria andYmEqualTo(String value) {
            addCriterion("ym =", value, "ym");
            return (Criteria) this;
        }

        public Criteria andYmNotEqualTo(String value) {
            addCriterion("ym <>", value, "ym");
            return (Criteria) this;
        }

        public Criteria andYmGreaterThan(String value) {
            addCriterion("ym >", value, "ym");
            return (Criteria) this;
        }

        public Criteria andYmGreaterThanOrEqualTo(String value) {
            addCriterion("ym >=", value, "ym");
            return (Criteria) this;
        }

        public Criteria andYmLessThan(String value) {
            addCriterion("ym <", value, "ym");
            return (Criteria) this;
        }

        public Criteria andYmLessThanOrEqualTo(String value) {
            addCriterion("ym <=", value, "ym");
            return (Criteria) this;
        }

        public Criteria andYmLike(String value) {
            addCriterion("ym like", value, "ym");
            return (Criteria) this;
        }

        public Criteria andYmNotLike(String value) {
            addCriterion("ym not like", value, "ym");
            return (Criteria) this;
        }

        public Criteria andYmIn(List<String> values) {
            addCriterion("ym in", values, "ym");
            return (Criteria) this;
        }

        public Criteria andYmNotIn(List<String> values) {
            addCriterion("ym not in", values, "ym");
            return (Criteria) this;
        }

        public Criteria andYmBetween(String value1, String value2) {
            addCriterion("ym between", value1, value2, "ym");
            return (Criteria) this;
        }

        public Criteria andYmNotBetween(String value1, String value2) {
            addCriterion("ym not between", value1, value2, "ym");
            return (Criteria) this;
        }

        public Criteria andBahIsNull() {
            addCriterion("bah is null");
            return (Criteria) this;
        }

        public Criteria andBahIsNotNull() {
            addCriterion("bah is not null");
            return (Criteria) this;
        }

        public Criteria andBahEqualTo(String value) {
            addCriterion("bah =", value, "bah");
            return (Criteria) this;
        }

        public Criteria andBahNotEqualTo(String value) {
            addCriterion("bah <>", value, "bah");
            return (Criteria) this;
        }

        public Criteria andBahGreaterThan(String value) {
            addCriterion("bah >", value, "bah");
            return (Criteria) this;
        }

        public Criteria andBahGreaterThanOrEqualTo(String value) {
            addCriterion("bah >=", value, "bah");
            return (Criteria) this;
        }

        public Criteria andBahLessThan(String value) {
            addCriterion("bah <", value, "bah");
            return (Criteria) this;
        }

        public Criteria andBahLessThanOrEqualTo(String value) {
            addCriterion("bah <=", value, "bah");
            return (Criteria) this;
        }

        public Criteria andBahLike(String value) {
            addCriterion("bah like", value, "bah");
            return (Criteria) this;
        }

        public Criteria andBahNotLike(String value) {
            addCriterion("bah not like", value, "bah");
            return (Criteria) this;
        }

        public Criteria andBahIn(List<String> values) {
            addCriterion("bah in", values, "bah");
            return (Criteria) this;
        }

        public Criteria andBahNotIn(List<String> values) {
            addCriterion("bah not in", values, "bah");
            return (Criteria) this;
        }

        public Criteria andBahBetween(String value1, String value2) {
            addCriterion("bah between", value1, value2, "bah");
            return (Criteria) this;
        }

        public Criteria andBahNotBetween(String value1, String value2) {
            addCriterion("bah not between", value1, value2, "bah");
            return (Criteria) this;
        }

        public Criteria andBqxxIsNull() {
            addCriterion("bqxx is null");
            return (Criteria) this;
        }

        public Criteria andBqxxIsNotNull() {
            addCriterion("bqxx is not null");
            return (Criteria) this;
        }

        public Criteria andBqxxEqualTo(String value) {
            addCriterion("bqxx =", value, "bqxx");
            return (Criteria) this;
        }

        public Criteria andBqxxNotEqualTo(String value) {
            addCriterion("bqxx <>", value, "bqxx");
            return (Criteria) this;
        }

        public Criteria andBqxxGreaterThan(String value) {
            addCriterion("bqxx >", value, "bqxx");
            return (Criteria) this;
        }

        public Criteria andBqxxGreaterThanOrEqualTo(String value) {
            addCriterion("bqxx >=", value, "bqxx");
            return (Criteria) this;
        }

        public Criteria andBqxxLessThan(String value) {
            addCriterion("bqxx <", value, "bqxx");
            return (Criteria) this;
        }

        public Criteria andBqxxLessThanOrEqualTo(String value) {
            addCriterion("bqxx <=", value, "bqxx");
            return (Criteria) this;
        }

        public Criteria andBqxxLike(String value) {
            addCriterion("bqxx like", value, "bqxx");
            return (Criteria) this;
        }

        public Criteria andBqxxNotLike(String value) {
            addCriterion("bqxx not like", value, "bqxx");
            return (Criteria) this;
        }

        public Criteria andBqxxIn(List<String> values) {
            addCriterion("bqxx in", values, "bqxx");
            return (Criteria) this;
        }

        public Criteria andBqxxNotIn(List<String> values) {
            addCriterion("bqxx not in", values, "bqxx");
            return (Criteria) this;
        }

        public Criteria andBqxxBetween(String value1, String value2) {
            addCriterion("bqxx between", value1, value2, "bqxx");
            return (Criteria) this;
        }

        public Criteria andBqxxNotBetween(String value1, String value2) {
            addCriterion("bqxx not between", value1, value2, "bqxx");
            return (Criteria) this;
        }

        public Criteria andZdkqgbIsNull() {
            addCriterion("zdkqgb is null");
            return (Criteria) this;
        }

        public Criteria andZdkqgbIsNotNull() {
            addCriterion("zdkqgb is not null");
            return (Criteria) this;
        }

        public Criteria andZdkqgbEqualTo(Boolean value) {
            addCriterion("zdkqgb =", value, "zdkqgb");
            return (Criteria) this;
        }

        public Criteria andZdkqgbNotEqualTo(Boolean value) {
            addCriterion("zdkqgb <>", value, "zdkqgb");
            return (Criteria) this;
        }

        public Criteria andZdkqgbGreaterThan(Boolean value) {
            addCriterion("zdkqgb >", value, "zdkqgb");
            return (Criteria) this;
        }

        public Criteria andZdkqgbGreaterThanOrEqualTo(Boolean value) {
            addCriterion("zdkqgb >=", value, "zdkqgb");
            return (Criteria) this;
        }

        public Criteria andZdkqgbLessThan(Boolean value) {
            addCriterion("zdkqgb <", value, "zdkqgb");
            return (Criteria) this;
        }

        public Criteria andZdkqgbLessThanOrEqualTo(Boolean value) {
            addCriterion("zdkqgb <=", value, "zdkqgb");
            return (Criteria) this;
        }

        public Criteria andZdkqgbIn(List<Boolean> values) {
            addCriterion("zdkqgb in", values, "zdkqgb");
            return (Criteria) this;
        }

        public Criteria andZdkqgbNotIn(List<Boolean> values) {
            addCriterion("zdkqgb not in", values, "zdkqgb");
            return (Criteria) this;
        }

        public Criteria andZdkqgbBetween(Boolean value1, Boolean value2) {
            addCriterion("zdkqgb between", value1, value2, "zdkqgb");
            return (Criteria) this;
        }

        public Criteria andZdkqgbNotBetween(Boolean value1, Boolean value2) {
            addCriterion("zdkqgb not between", value1, value2, "zdkqgb");
            return (Criteria) this;
        }

        public Criteria andGbtsxxIsNull() {
            addCriterion("gbtsxx is null");
            return (Criteria) this;
        }

        public Criteria andGbtsxxIsNotNull() {
            addCriterion("gbtsxx is not null");
            return (Criteria) this;
        }

        public Criteria andGbtsxxEqualTo(String value) {
            addCriterion("gbtsxx =", value, "gbtsxx");
            return (Criteria) this;
        }

        public Criteria andGbtsxxNotEqualTo(String value) {
            addCriterion("gbtsxx <>", value, "gbtsxx");
            return (Criteria) this;
        }

        public Criteria andGbtsxxGreaterThan(String value) {
            addCriterion("gbtsxx >", value, "gbtsxx");
            return (Criteria) this;
        }

        public Criteria andGbtsxxGreaterThanOrEqualTo(String value) {
            addCriterion("gbtsxx >=", value, "gbtsxx");
            return (Criteria) this;
        }

        public Criteria andGbtsxxLessThan(String value) {
            addCriterion("gbtsxx <", value, "gbtsxx");
            return (Criteria) this;
        }

        public Criteria andGbtsxxLessThanOrEqualTo(String value) {
            addCriterion("gbtsxx <=", value, "gbtsxx");
            return (Criteria) this;
        }

        public Criteria andGbtsxxLike(String value) {
            addCriterion("gbtsxx like", value, "gbtsxx");
            return (Criteria) this;
        }

        public Criteria andGbtsxxNotLike(String value) {
            addCriterion("gbtsxx not like", value, "gbtsxx");
            return (Criteria) this;
        }

        public Criteria andGbtsxxIn(List<String> values) {
            addCriterion("gbtsxx in", values, "gbtsxx");
            return (Criteria) this;
        }

        public Criteria andGbtsxxNotIn(List<String> values) {
            addCriterion("gbtsxx not in", values, "gbtsxx");
            return (Criteria) this;
        }

        public Criteria andGbtsxxBetween(String value1, String value2) {
            addCriterion("gbtsxx between", value1, value2, "gbtsxx");
            return (Criteria) this;
        }

        public Criteria andGbtsxxNotBetween(String value1, String value2) {
            addCriterion("gbtsxx not between", value1, value2, "gbtsxx");
            return (Criteria) this;
        }

        public Criteria andWzbtIsNull() {
            addCriterion("wzbt is null");
            return (Criteria) this;
        }

        public Criteria andWzbtIsNotNull() {
            addCriterion("wzbt is not null");
            return (Criteria) this;
        }

        public Criteria andWzbtEqualTo(String value) {
            addCriterion("wzbt =", value, "wzbt");
            return (Criteria) this;
        }

        public Criteria andWzbtNotEqualTo(String value) {
            addCriterion("wzbt <>", value, "wzbt");
            return (Criteria) this;
        }

        public Criteria andWzbtGreaterThan(String value) {
            addCriterion("wzbt >", value, "wzbt");
            return (Criteria) this;
        }

        public Criteria andWzbtGreaterThanOrEqualTo(String value) {
            addCriterion("wzbt >=", value, "wzbt");
            return (Criteria) this;
        }

        public Criteria andWzbtLessThan(String value) {
            addCriterion("wzbt <", value, "wzbt");
            return (Criteria) this;
        }

        public Criteria andWzbtLessThanOrEqualTo(String value) {
            addCriterion("wzbt <=", value, "wzbt");
            return (Criteria) this;
        }

        public Criteria andWzbtLike(String value) {
            addCriterion("wzbt like", value, "wzbt");
            return (Criteria) this;
        }

        public Criteria andWzbtNotLike(String value) {
            addCriterion("wzbt not like", value, "wzbt");
            return (Criteria) this;
        }

        public Criteria andWzbtIn(List<String> values) {
            addCriterion("wzbt in", values, "wzbt");
            return (Criteria) this;
        }

        public Criteria andWzbtNotIn(List<String> values) {
            addCriterion("wzbt not in", values, "wzbt");
            return (Criteria) this;
        }

        public Criteria andWzbtBetween(String value1, String value2) {
            addCriterion("wzbt between", value1, value2, "wzbt");
            return (Criteria) this;
        }

        public Criteria andWzbtNotBetween(String value1, String value2) {
            addCriterion("wzbt not between", value1, value2, "wzbt");
            return (Criteria) this;
        }

        public Criteria andGjzcIsNull() {
            addCriterion("gjzc is null");
            return (Criteria) this;
        }

        public Criteria andGjzcIsNotNull() {
            addCriterion("gjzc is not null");
            return (Criteria) this;
        }

        public Criteria andGjzcEqualTo(String value) {
            addCriterion("gjzc =", value, "gjzc");
            return (Criteria) this;
        }

        public Criteria andGjzcNotEqualTo(String value) {
            addCriterion("gjzc <>", value, "gjzc");
            return (Criteria) this;
        }

        public Criteria andGjzcGreaterThan(String value) {
            addCriterion("gjzc >", value, "gjzc");
            return (Criteria) this;
        }

        public Criteria andGjzcGreaterThanOrEqualTo(String value) {
            addCriterion("gjzc >=", value, "gjzc");
            return (Criteria) this;
        }

        public Criteria andGjzcLessThan(String value) {
            addCriterion("gjzc <", value, "gjzc");
            return (Criteria) this;
        }

        public Criteria andGjzcLessThanOrEqualTo(String value) {
            addCriterion("gjzc <=", value, "gjzc");
            return (Criteria) this;
        }

        public Criteria andGjzcLike(String value) {
            addCriterion("gjzc like", value, "gjzc");
            return (Criteria) this;
        }

        public Criteria andGjzcNotLike(String value) {
            addCriterion("gjzc not like", value, "gjzc");
            return (Criteria) this;
        }

        public Criteria andGjzcIn(List<String> values) {
            addCriterion("gjzc in", values, "gjzc");
            return (Criteria) this;
        }

        public Criteria andGjzcNotIn(List<String> values) {
            addCriterion("gjzc not in", values, "gjzc");
            return (Criteria) this;
        }

        public Criteria andGjzcBetween(String value1, String value2) {
            addCriterion("gjzc between", value1, value2, "gjzc");
            return (Criteria) this;
        }

        public Criteria andGjzcNotBetween(String value1, String value2) {
            addCriterion("gjzc not between", value1, value2, "gjzc");
            return (Criteria) this;
        }

        public Criteria andWzmsIsNull() {
            addCriterion("wzms is null");
            return (Criteria) this;
        }

        public Criteria andWzmsIsNotNull() {
            addCriterion("wzms is not null");
            return (Criteria) this;
        }

        public Criteria andWzmsEqualTo(String value) {
            addCriterion("wzms =", value, "wzms");
            return (Criteria) this;
        }

        public Criteria andWzmsNotEqualTo(String value) {
            addCriterion("wzms <>", value, "wzms");
            return (Criteria) this;
        }

        public Criteria andWzmsGreaterThan(String value) {
            addCriterion("wzms >", value, "wzms");
            return (Criteria) this;
        }

        public Criteria andWzmsGreaterThanOrEqualTo(String value) {
            addCriterion("wzms >=", value, "wzms");
            return (Criteria) this;
        }

        public Criteria andWzmsLessThan(String value) {
            addCriterion("wzms <", value, "wzms");
            return (Criteria) this;
        }

        public Criteria andWzmsLessThanOrEqualTo(String value) {
            addCriterion("wzms <=", value, "wzms");
            return (Criteria) this;
        }

        public Criteria andWzmsLike(String value) {
            addCriterion("wzms like", value, "wzms");
            return (Criteria) this;
        }

        public Criteria andWzmsNotLike(String value) {
            addCriterion("wzms not like", value, "wzms");
            return (Criteria) this;
        }

        public Criteria andWzmsIn(List<String> values) {
            addCriterion("wzms in", values, "wzms");
            return (Criteria) this;
        }

        public Criteria andWzmsNotIn(List<String> values) {
            addCriterion("wzms not in", values, "wzms");
            return (Criteria) this;
        }

        public Criteria andWzmsBetween(String value1, String value2) {
            addCriterion("wzms between", value1, value2, "wzms");
            return (Criteria) this;
        }

        public Criteria andWzmsNotBetween(String value1, String value2) {
            addCriterion("wzms not between", value1, value2, "wzms");
            return (Criteria) this;
        }

        public Criteria andFfzgnIsNull() {
            addCriterion("ffzgn is null");
            return (Criteria) this;
        }

        public Criteria andFfzgnIsNotNull() {
            addCriterion("ffzgn is not null");
            return (Criteria) this;
        }

        public Criteria andFfzgnEqualTo(Boolean value) {
            addCriterion("ffzgn =", value, "ffzgn");
            return (Criteria) this;
        }

        public Criteria andFfzgnNotEqualTo(Boolean value) {
            addCriterion("ffzgn <>", value, "ffzgn");
            return (Criteria) this;
        }

        public Criteria andFfzgnGreaterThan(Boolean value) {
            addCriterion("ffzgn >", value, "ffzgn");
            return (Criteria) this;
        }

        public Criteria andFfzgnGreaterThanOrEqualTo(Boolean value) {
            addCriterion("ffzgn >=", value, "ffzgn");
            return (Criteria) this;
        }

        public Criteria andFfzgnLessThan(Boolean value) {
            addCriterion("ffzgn <", value, "ffzgn");
            return (Criteria) this;
        }

        public Criteria andFfzgnLessThanOrEqualTo(Boolean value) {
            addCriterion("ffzgn <=", value, "ffzgn");
            return (Criteria) this;
        }

        public Criteria andFfzgnIn(List<Boolean> values) {
            addCriterion("ffzgn in", values, "ffzgn");
            return (Criteria) this;
        }

        public Criteria andFfzgnNotIn(List<Boolean> values) {
            addCriterion("ffzgn not in", values, "ffzgn");
            return (Criteria) this;
        }

        public Criteria andFfzgnBetween(Boolean value1, Boolean value2) {
            addCriterion("ffzgn between", value1, value2, "ffzgn");
            return (Criteria) this;
        }

        public Criteria andFfzgnNotBetween(Boolean value1, Boolean value2) {
            addCriterion("ffzgn not between", value1, value2, "ffzgn");
            return (Criteria) this;
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table config
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
     * This class corresponds to the database table config
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