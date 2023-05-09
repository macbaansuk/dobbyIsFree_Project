package com.dobby.project.soo;

import java.util.Date;

public class AnswerDto {
    private Integer ANS_ID;
    private Integer CSNL_ID;
    private String CONTENT;
    private String WRTR;
    private Date REGISTER_DTM;
    private Date UPD_DTM;
    private String RMK;
    private Date FST_REG_DTM;
    private String FST_REGR_DCMT_NO;
    private Date LAST_UPD_DTM;
    private String LAST_UPD_DCMT_NO;

    public AnswerDto(){}
    public AnswerDto(Integer CSNL_ID, String CONTENT, String WRTR, String RMK) {
        this.CSNL_ID = CSNL_ID;
        this.CONTENT = CONTENT;
        this.WRTR = WRTR;
        this.RMK = RMK;
    }

    public Integer getANS_ID() {
        return ANS_ID;
    }

    public void setANS_ID(Integer ANS_ID) {
        this.ANS_ID = ANS_ID;
    }

    public Integer getCSNL_ID() {
        return CSNL_ID;
    }

    public void setCSNL_ID(Integer CSNL_ID) {
        this.CSNL_ID = CSNL_ID;
    }

    public String getCONTENT() {
        return CONTENT;
    }

    public void setCONTENT(String CONTENT) {
        this.CONTENT = CONTENT;
    }

    public String getWRTR() {
        return WRTR;
    }

    public void setWRTR(String WRTR) {
        this.WRTR = WRTR;
    }

    public Date getREGISTER_DTM() {
        return REGISTER_DTM;
    }

    public void setREGISTER_DTM(Date REGISTER_DTM) {
        this.REGISTER_DTM = REGISTER_DTM;
    }

    public Date getUPD_DTM() {
        return UPD_DTM;
    }

    public void setUPD_DTM(Date UPD_DTM) {
        this.UPD_DTM = UPD_DTM;
    }

    public String getRMK() {
        return RMK;
    }

    public void setRMK(String RMK) {
        this.RMK = RMK;
    }

    public Date getFST_REG_DTM() {
        return FST_REG_DTM;
    }

    public void setFST_REG_DTM(Date FST_REG_DTM) {
        this.FST_REG_DTM = FST_REG_DTM;
    }

    public String getFST_REGR_DCMT_NO() {
        return FST_REGR_DCMT_NO;
    }

    public void setFST_REGR_DCMT_NO(String FST_REGR_DCMT_NO) {
        this.FST_REGR_DCMT_NO = FST_REGR_DCMT_NO;
    }

    public Date getLAST_UPD_DTM() {
        return LAST_UPD_DTM;
    }

    public void setLAST_UPD_DTM(Date LAST_UPD_DTM) {
        this.LAST_UPD_DTM = LAST_UPD_DTM;
    }

    public String getLAST_UPD_DCMT_NO() {
        return LAST_UPD_DCMT_NO;
    }

    public void setLAST_UPD_DCMT_NO(String LAST_UPD_DCMT_NO) {
        this.LAST_UPD_DCMT_NO = LAST_UPD_DCMT_NO;
    }

    @Override
    public String toString() {
        return "AnswerDto{" +
                "ANS_ID=" + ANS_ID +
                ", CSNL_ID=" + CSNL_ID +
                ", CONTENT='" + CONTENT + '\'' +
                ", WRTR='" + WRTR + '\'' +
                ", REGISTER_DTM=" + REGISTER_DTM +
                ", UPD_DTM=" + UPD_DTM +
                ", RMK='" + RMK + '\'' +
                ", FST_REG_DTM=" + FST_REG_DTM +
                ", FST_REGR_DCMT_NO='" + FST_REGR_DCMT_NO + '\'' +
                ", LAST_UPD_DTM=" + LAST_UPD_DTM +
                ", LAST_UPD_DCMT_NO='" + LAST_UPD_DCMT_NO + '\'' +
                '}';
    }
}
