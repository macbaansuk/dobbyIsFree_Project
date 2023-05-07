package com.dobby.project.hoon.domain;

import org.springframework.web.util.UriComponentsBuilder;

import java.util.Date;

public class invSearchCondition {
   private Integer page = 1;
   private Integer pageSize = 10;

   private String keyword = "";
   private String option = "";

    private String sortType = "";

    private String category = "";

    private Integer period = null;

    private String dateField = null;

    private String startDate = null;

    private String endDate = null;
   public invSearchCondition(){}

    @Override
    public String toString() {
        return "invSearchCondition{" +
                "page=" + page +
                ", pageSize=" + pageSize +
                ", offset=" + getOffset() +
                ", keyword='" + keyword + '\'' +
                ", option='" + option + '\'' +
                ", sortType='" + sortType + '\'' +
                ", category='" + category + '\'' +
                ", period=" + period +
                ", dateField='" + dateField + '\'' +
                ", startDate='" + startDate + '\'' +
                ", endDate='" + endDate + '\'' +
                '}';
    }

    public invSearchCondition(Integer page, Integer pageSize, String keyword, String option, String sortType, String category ,Integer period, String dateField,String startDate, String endDate) {


        if (page == null || page <= 0) {
            this.page = 1;
        } else {
            this.page = page;
        }

        if (pageSize == null || pageSize <= 10) {
            this.pageSize = 10;
        } else {
            this.pageSize = pageSize;
        }

        this.keyword = keyword;
        this.option = option;
        this.sortType = sortType;
        this.category = category;
        this.period = period;
        this.dateField = dateField;
        this.startDate = startDate;
        this.endDate = endDate;
    }
    public String getQueryString(Integer page){
        if (page == null || page <= 0) {
            page = 1;
        }
        if (pageSize == null || pageSize <=10) {
            this.pageSize = 10;
        } else {
            this.pageSize = pageSize;
        }
        String tmp =
            UriComponentsBuilder.newInstance()
                .queryParam("page", page)
                .queryParam("pageSize",pageSize)
                .queryParam("option", option)
                .queryParam("keyword", keyword)
                .queryParam("sortType", sortType)
                .queryParam("category", category)
                .queryParam("period", period)
                .queryParam("dateField", dateField)
                .queryParam("startDate", startDate)
                .queryParam("endDate", endDate)

                .build().toString();
//        System.out.println("tmp = " + tmp);
        return tmp;
    }

    public String getQueryString () {
        // ?page=1&pageSize=10&option=T&keyword="title"
        return  getQueryString(page);

    }


    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getOffset() {
        if (pageSize == null  || pageSize <= 10) {
            this.pageSize = 10;
        }
        if (page == null || page <= 0) {
            page = 1;
        }
        return (page - 1) * pageSize;

    }

//    public void setOffset(Integer offset) {
//        this.offset = offset;
//    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getOption() {
        return option;
    }

    public void setOption(String option) {
        this.option = option;
    }

    public String getSortType() {
        return sortType;
    }

    public void setSortType(String sortType) {
        this.sortType = sortType;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Integer getPeriod() {
        return period;
    }

    public void setPeriod(Integer period) {
        this.period = period;
    }

    public String getDateField() {
        return dateField;
    }

    public void setDateField(String dateField) {
        this.dateField = dateField;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }
}
