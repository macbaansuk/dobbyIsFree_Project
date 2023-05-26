package com.dobby.project.counsel.domain;

import java.util.Date;

public class AnswerDto {
    private Integer ANS_ID;
    private Integer CNSL_ID;
    private String CONTENT;

    public AnswerDto(){}
    public AnswerDto(Integer CNSL_ID, String CONTENT) {
        this.CNSL_ID = CNSL_ID;
        this.CONTENT = CONTENT;
    }


    public Integer getANS_ID() {
        return ANS_ID;
    }

    public void setANS_ID(Integer ANS_ID) {
        this.ANS_ID = ANS_ID;
    }

    public Integer getCNSL_ID() {
        return CNSL_ID;
    }

    public void setCNSL_ID(Integer CNSL_ID) {
        this.CNSL_ID = CNSL_ID;
    }

    public String getCONTENT() {
        return CONTENT;
    }

    public void setCONTENT(String CONTENT) {
        this.CONTENT = CONTENT;
    }

    @Override
    public String toString() {
        return "AnswerDto{" +
                "ANS_ID=" + ANS_ID +
                ", CNSL_ID=" + CNSL_ID +
                ", CONTENT='" + CONTENT + '\'' +
                '}';
    }
}
