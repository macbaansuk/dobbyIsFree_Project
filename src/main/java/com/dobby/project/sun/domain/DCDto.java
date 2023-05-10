package com.dobby.project.sun.domain;

import java.sql.Date;

public class DCDto {
    private Integer PROD_DC_ID;
    private Integer PROD_ID;
    private String DC_TYP;
    private Integer DC_RATE;
    private Integer DC_AMT;
    private Integer DC_PRICE;
    private Date BGN_DTM;
    private Date END_DTM;
    private String DC_STUS;


    public DCDto() {
    }

    public DCDto(Integer PROD_DC_ID, Integer PROD_ID,String DC_TYP, Integer DC_RATE, Integer DC_AMT, Integer DC_PRICE, Date BGN_DTM, Date END_DTM, String DC_STUS) {

        this.PROD_DC_ID = PROD_DC_ID;
        this.PROD_ID = PROD_ID;
        this.DC_TYP = DC_TYP;
        this.DC_RATE = DC_RATE;
        this.DC_AMT = DC_AMT;
        this.DC_PRICE = DC_PRICE;
        this.BGN_DTM = BGN_DTM;
        this.END_DTM = END_DTM;
        this.DC_STUS = DC_STUS;
    }

    public Integer getPROD_DC_ID() {
        return PROD_DC_ID;
    }

    public void setPROD_DC_ID(Integer PROD_DC_ID) {
        this.PROD_DC_ID = PROD_DC_ID;
    }

    public Integer getPROD_ID() {
        return PROD_ID;
    }

    public void setPROD_ID(Integer PROD_ID) {
        this.PROD_ID = PROD_ID;
    }

    public String getDC_TYP() {
        return DC_TYP;
    }

    public void setDC_TYP(String DC_TYP) {
        this.DC_TYP = DC_TYP;
    }

    public Integer getDC_RATE() {
        return DC_RATE;
    }

    public void setDC_RATE(Integer DC_RATE) {
        this.DC_RATE = DC_RATE;
    }

    public Integer getDC_AMT() {
        return DC_AMT;
    }

    public void setDC_AMT(Integer DC_AMT) {
        this.DC_AMT = DC_AMT;
    }

    public Integer getDC_PRICE() {
        return DC_PRICE;
    }

    public void setDC_PRICE(Integer DC_PRICE) {
        this.DC_PRICE = DC_PRICE;
    }

    public Date getBGN_DTM() {
        return BGN_DTM;
    }

    public void setBGN_DTM(Date BGN_DTM) {
        this.BGN_DTM = BGN_DTM;
    }

    public Date getEND_DTM() {
        return END_DTM;
    }

    public void setEND_DTM(Date END_DTM) {
        this.END_DTM = END_DTM;
    }

    public String getDC_STUS() {
        return DC_STUS;
    }

    public void setDC_STUS(String DC_STUS) {
        this.DC_STUS = DC_STUS;
    }

    @Override
    public String toString() {
        return "DCDto{" +
                "PROD_DC_ID=" + PROD_DC_ID +
                ", PROD_ID=" + PROD_ID +
                ", DC_TYP='" + DC_TYP + '\'' +
                ", DC_RATE=" + DC_RATE +
                ", DC_AMT=" + DC_AMT +
                ", DC_PRICE=" + DC_PRICE +
                ", BGN_DTM=" + BGN_DTM +
                ", END_DTM=" + END_DTM +
                ", DC_STUS='" + DC_STUS + '\'' +
                '}';
    }
}
