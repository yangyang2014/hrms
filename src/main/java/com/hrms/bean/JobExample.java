package com.hrms.bean;

import java.util.ArrayList;
import java.util.List;

public class JobExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public JobExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

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

        public Criteria andJobidIsNull() {
            addCriterion("JobID is null");
            return (Criteria) this;
        }

        public Criteria andJobidIsNotNull() {
            addCriterion("JobID is not null");
            return (Criteria) this;
        }

        public Criteria andJobidEqualTo(Short value) {
            addCriterion("JobID =", value, "jobid");
            return (Criteria) this;
        }

        public Criteria andJobidNotEqualTo(Short value) {
            addCriterion("JobID <>", value, "jobid");
            return (Criteria) this;
        }

        public Criteria andJobidGreaterThan(Short value) {
            addCriterion("JobID >", value, "jobid");
            return (Criteria) this;
        }

        public Criteria andJobidGreaterThanOrEqualTo(Short value) {
            addCriterion("JobID >=", value, "jobid");
            return (Criteria) this;
        }

        public Criteria andJobidLessThan(Short value) {
            addCriterion("JobID <", value, "jobid");
            return (Criteria) this;
        }

        public Criteria andJobidLessThanOrEqualTo(Short value) {
            addCriterion("JobID <=", value, "jobid");
            return (Criteria) this;
        }

        public Criteria andJobidIn(List<Short> values) {
            addCriterion("JobID in", values, "jobid");
            return (Criteria) this;
        }

        public Criteria andJobidNotIn(List<Short> values) {
            addCriterion("JobID not in", values, "jobid");
            return (Criteria) this;
        }

        public Criteria andJobidBetween(Short value1, Short value2) {
            addCriterion("JobID between", value1, value2, "jobid");
            return (Criteria) this;
        }

        public Criteria andJobidNotBetween(Short value1, Short value2) {
            addCriterion("JobID not between", value1, value2, "jobid");
            return (Criteria) this;
        }

        public Criteria andJobnoIsNull() {
            addCriterion("JobNO is null");
            return (Criteria) this;
        }

        public Criteria andJobnoIsNotNull() {
            addCriterion("JobNO is not null");
            return (Criteria) this;
        }

        public Criteria andJobnoEqualTo(String value) {
            addCriterion("JobNO =", value, "jobno");
            return (Criteria) this;
        }

        public Criteria andJobnoNotEqualTo(String value) {
            addCriterion("JobNO <>", value, "jobno");
            return (Criteria) this;
        }

        public Criteria andJobnoGreaterThan(String value) {
            addCriterion("JobNO >", value, "jobno");
            return (Criteria) this;
        }

        public Criteria andJobnoGreaterThanOrEqualTo(String value) {
            addCriterion("JobNO >=", value, "jobno");
            return (Criteria) this;
        }

        public Criteria andJobnoLessThan(String value) {
            addCriterion("JobNO <", value, "jobno");
            return (Criteria) this;
        }

        public Criteria andJobnoLessThanOrEqualTo(String value) {
            addCriterion("JobNO <=", value, "jobno");
            return (Criteria) this;
        }

        public Criteria andJobnoLike(String value) {
            addCriterion("JobNO like", value, "jobno");
            return (Criteria) this;
        }

        public Criteria andJobnoNotLike(String value) {
            addCriterion("JobNO not like", value, "jobno");
            return (Criteria) this;
        }

        public Criteria andJobnoIn(List<String> values) {
            addCriterion("JobNO in", values, "jobno");
            return (Criteria) this;
        }

        public Criteria andJobnoNotIn(List<String> values) {
            addCriterion("JobNO not in", values, "jobno");
            return (Criteria) this;
        }

        public Criteria andJobnoBetween(String value1, String value2) {
            addCriterion("JobNO between", value1, value2, "jobno");
            return (Criteria) this;
        }

        public Criteria andJobnoNotBetween(String value1, String value2) {
            addCriterion("JobNO not between", value1, value2, "jobno");
            return (Criteria) this;
        }

        public Criteria andDeptnoIsNull() {
            addCriterion("DeptNO is null");
            return (Criteria) this;
        }

        public Criteria andDeptnoIsNotNull() {
            addCriterion("DeptNO is not null");
            return (Criteria) this;
        }

        public Criteria andDeptnoEqualTo(String value) {
            addCriterion("DeptNO =", value, "deptno");
            return (Criteria) this;
        }

        public Criteria andDeptnoNotEqualTo(String value) {
            addCriterion("DeptNO <>", value, "deptno");
            return (Criteria) this;
        }

        public Criteria andDeptnoGreaterThan(String value) {
            addCriterion("DeptNO >", value, "deptno");
            return (Criteria) this;
        }

        public Criteria andDeptnoGreaterThanOrEqualTo(String value) {
            addCriterion("DeptNO >=", value, "deptno");
            return (Criteria) this;
        }

        public Criteria andDeptnoLessThan(String value) {
            addCriterion("DeptNO <", value, "deptno");
            return (Criteria) this;
        }

        public Criteria andDeptnoLessThanOrEqualTo(String value) {
            addCriterion("DeptNO <=", value, "deptno");
            return (Criteria) this;
        }

        public Criteria andDeptnoLike(String value) {
            addCriterion("DeptNO like", value, "deptno");
            return (Criteria) this;
        }

        public Criteria andDeptnoNotLike(String value) {
            addCriterion("DeptNO not like", value, "deptno");
            return (Criteria) this;
        }

        public Criteria andDeptnoIn(List<String> values) {
            addCriterion("DeptNO in", values, "deptno");
            return (Criteria) this;
        }

        public Criteria andDeptnoNotIn(List<String> values) {
            addCriterion("DeptNO not in", values, "deptno");
            return (Criteria) this;
        }

        public Criteria andDeptnoBetween(String value1, String value2) {
            addCriterion("DeptNO between", value1, value2, "deptno");
            return (Criteria) this;
        }

        public Criteria andDeptnoNotBetween(String value1, String value2) {
            addCriterion("DeptNO not between", value1, value2, "deptno");
            return (Criteria) this;
        }

        public Criteria andJobremarkIsNull() {
            addCriterion("JobRemark is null");
            return (Criteria) this;
        }

        public Criteria andJobremarkIsNotNull() {
            addCriterion("JobRemark is not null");
            return (Criteria) this;
        }

        public Criteria andJobremarkEqualTo(String value) {
            addCriterion("JobRemark =", value, "jobremark");
            return (Criteria) this;
        }

        public Criteria andJobremarkNotEqualTo(String value) {
            addCriterion("JobRemark <>", value, "jobremark");
            return (Criteria) this;
        }

        public Criteria andJobremarkGreaterThan(String value) {
            addCriterion("JobRemark >", value, "jobremark");
            return (Criteria) this;
        }

        public Criteria andJobremarkGreaterThanOrEqualTo(String value) {
            addCriterion("JobRemark >=", value, "jobremark");
            return (Criteria) this;
        }

        public Criteria andJobremarkLessThan(String value) {
            addCriterion("JobRemark <", value, "jobremark");
            return (Criteria) this;
        }

        public Criteria andJobremarkLessThanOrEqualTo(String value) {
            addCriterion("JobRemark <=", value, "jobremark");
            return (Criteria) this;
        }

        public Criteria andJobremarkLike(String value) {
            addCriterion("JobRemark like", value, "jobremark");
            return (Criteria) this;
        }

        public Criteria andJobremarkNotLike(String value) {
            addCriterion("JobRemark not like", value, "jobremark");
            return (Criteria) this;
        }

        public Criteria andJobremarkIn(List<String> values) {
            addCriterion("JobRemark in", values, "jobremark");
            return (Criteria) this;
        }

        public Criteria andJobremarkNotIn(List<String> values) {
            addCriterion("JobRemark not in", values, "jobremark");
            return (Criteria) this;
        }

        public Criteria andJobremarkBetween(String value1, String value2) {
            addCriterion("JobRemark between", value1, value2, "jobremark");
            return (Criteria) this;
        }

        public Criteria andJobremarkNotBetween(String value1, String value2) {
            addCriterion("JobRemark not between", value1, value2, "jobremark");
            return (Criteria) this;
        }

        public Criteria andJobplannumIsNull() {
            addCriterion("JobPlanNum is null");
            return (Criteria) this;
        }

        public Criteria andJobplannumIsNotNull() {
            addCriterion("JobPlanNum is not null");
            return (Criteria) this;
        }

        public Criteria andJobplannumEqualTo(Short value) {
            addCriterion("JobPlanNum =", value, "jobplannum");
            return (Criteria) this;
        }

        public Criteria andJobplannumNotEqualTo(Short value) {
            addCriterion("JobPlanNum <>", value, "jobplannum");
            return (Criteria) this;
        }

        public Criteria andJobplannumGreaterThan(Short value) {
            addCriterion("JobPlanNum >", value, "jobplannum");
            return (Criteria) this;
        }

        public Criteria andJobplannumGreaterThanOrEqualTo(Short value) {
            addCriterion("JobPlanNum >=", value, "jobplannum");
            return (Criteria) this;
        }

        public Criteria andJobplannumLessThan(Short value) {
            addCriterion("JobPlanNum <", value, "jobplannum");
            return (Criteria) this;
        }

        public Criteria andJobplannumLessThanOrEqualTo(Short value) {
            addCriterion("JobPlanNum <=", value, "jobplannum");
            return (Criteria) this;
        }

        public Criteria andJobplannumIn(List<Short> values) {
            addCriterion("JobPlanNum in", values, "jobplannum");
            return (Criteria) this;
        }

        public Criteria andJobplannumNotIn(List<Short> values) {
            addCriterion("JobPlanNum not in", values, "jobplannum");
            return (Criteria) this;
        }

        public Criteria andJobplannumBetween(Short value1, Short value2) {
            addCriterion("JobPlanNum between", value1, value2, "jobplannum");
            return (Criteria) this;
        }

        public Criteria andJobplannumNotBetween(Short value1, Short value2) {
            addCriterion("JobPlanNum not between", value1, value2, "jobplannum");
            return (Criteria) this;
        }

        public Criteria andJobnameIsNull() {
            addCriterion("JobName is null");
            return (Criteria) this;
        }

        public Criteria andJobnameIsNotNull() {
            addCriterion("JobName is not null");
            return (Criteria) this;
        }

        public Criteria andJobnameEqualTo(String value) {
            addCriterion("JobName =", value, "jobname");
            return (Criteria) this;
        }

        public Criteria andJobnameNotEqualTo(String value) {
            addCriterion("JobName <>", value, "jobname");
            return (Criteria) this;
        }

        public Criteria andJobnameGreaterThan(String value) {
            addCriterion("JobName >", value, "jobname");
            return (Criteria) this;
        }

        public Criteria andJobnameGreaterThanOrEqualTo(String value) {
            addCriterion("JobName >=", value, "jobname");
            return (Criteria) this;
        }

        public Criteria andJobnameLessThan(String value) {
            addCriterion("JobName <", value, "jobname");
            return (Criteria) this;
        }

        public Criteria andJobnameLessThanOrEqualTo(String value) {
            addCriterion("JobName <=", value, "jobname");
            return (Criteria) this;
        }

        public Criteria andJobnameLike(String value) {
            addCriterion("JobName like", value, "jobname");
            return (Criteria) this;
        }

        public Criteria andJobnameNotLike(String value) {
            addCriterion("JobName not like", value, "jobname");
            return (Criteria) this;
        }

        public Criteria andJobnameIn(List<String> values) {
            addCriterion("JobName in", values, "jobname");
            return (Criteria) this;
        }

        public Criteria andJobnameNotIn(List<String> values) {
            addCriterion("JobName not in", values, "jobname");
            return (Criteria) this;
        }

        public Criteria andJobnameBetween(String value1, String value2) {
            addCriterion("JobName between", value1, value2, "jobname");
            return (Criteria) this;
        }

        public Criteria andJobnameNotBetween(String value1, String value2) {
            addCriterion("JobName not between", value1, value2, "jobname");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

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