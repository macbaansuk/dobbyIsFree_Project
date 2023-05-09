package com.dobby.project.soo;

import java.util.Date;

public class CounselAnswerDto {
    private Integer CNSL_ID;
    private String MBR_ID;
    private Integer PROD_ID;
    private String PROD_NM;
    private String CATE_ID;
    private String CATE_NM;
    private String BBS_ID;
    private String TTL;
    private String CN;
    private String RX;
    private Date REG_DTM;
    private String STUS;
    private String ANS_YN;
    private Integer ANS_ID;
    private String CONTENT;
    private String WRTR;
    private Date REGISTER_DTM;
    private String RMK;

    public CounselAnswerDto(){}

    public CounselAnswerDto(Integer CNSL_ID, String MBR_ID, Integer PROD_ID, String PROD_NM, String CATE_ID,
                            String CATE_NM, String BBS_ID, String TTL, String CN, String RX, Date REG_DTM,
                            String STUS, String ANS_YN, Integer ANS_ID, String CONTENT, String WRTR, Date REGISTER_DTM,
                            String RMK) {
        this.CNSL_ID = CNSL_ID;
        this.MBR_ID = MBR_ID;
        this.PROD_ID = PROD_ID;
        this.PROD_NM = PROD_NM;
        this.CATE_ID = CATE_ID;
        this.CATE_NM = CATE_NM;
        this.BBS_ID = BBS_ID;
        this.TTL = TTL;
        this.CN = CN;
        this.RX = RX;
        this.REG_DTM = REG_DTM;
        this.STUS = STUS;
        this.ANS_YN = ANS_YN;
        this.ANS_ID = ANS_ID;
        this.CONTENT = CONTENT;
        this.WRTR = WRTR;
        this.REGISTER_DTM = REGISTER_DTM;
        this.RMK = RMK;
    }

    public Integer getCNSL_ID() {
        return CNSL_ID;
    }

    public void setCNSL_ID(Integer CNSL_ID) {
        this.CNSL_ID = CNSL_ID;
    }

    public String getMBR_ID() {
        return MBR_ID;
    }

    public void setMBR_ID(String MBR_ID) {
        this.MBR_ID = MBR_ID;
    }

    public Integer getPROD_ID() {
        return PROD_ID;
    }

    public void setPROD_ID(Integer PROD_ID) {
        this.PROD_ID = PROD_ID;
    }

    public String getPROD_NM() {
        return PROD_NM;
    }

    public void setPROD_NM(String PROD_NM) {
        this.PROD_NM = PROD_NM;
    }

    public String getCATE_ID() {
        return CATE_ID;
    }

    public void setCATE_ID(String CATE_ID) {
        this.CATE_ID = CATE_ID;
    }

    public String getCATE_NM() {
        return CATE_NM;
    }

    public void setCATE_NM(String CATE_NM) {
        this.CATE_NM = CATE_NM;
    }

    public String getBBS_ID() {
        return BBS_ID;
    }

    public void setBBS_ID(String BBS_ID) {
        this.BBS_ID = BBS_ID;
    }

    public String getTTL() {
        return TTL;
    }

    public void setTTL(String TTL) {
        this.TTL = TTL;
    }

    public String getCN() {
        return CN;
    }

    public void setCN(String CN) {
        this.CN = CN;
    }

    public String getRX() {
        return RX;
    }

    public void setRX(String RX) {
        this.RX = RX;
    }

    public Date getREG_DTM() {
        return REG_DTM;
    }

    public void setREG_DTM(Date REG_DTM) {
        this.REG_DTM = REG_DTM;
    }

    public String getSTUS() {
        return STUS;
    }

    public void setSTUS(String STUS) {
        this.STUS = STUS;
    }

    public String getANS_YN() {
        return ANS_YN;
    }

    public void setANS_YN(String ANS_YN) {
        this.ANS_YN = ANS_YN;
    }

    public Integer getANS_ID() {
        return ANS_ID;
    }

    public void setANS_ID(Integer ANS_ID) {
        this.ANS_ID = ANS_ID;
    }

    public String getCONTENT() { return CONTENT; }

    public void setCONTENT(String CONTENT) {
        this.CONTENT = CONTENT;
    }

    public String getWRTR() {
        return WRTR;
    }

    public void setWRTR(String WRTR) {
        this.WRTR = WRTR;
    }

    public Date getA_REG_DTM() {
        return REGISTER_DTM;
    }

    public void setA_REG_DTM(Date A_REG_DTM) {
        this.REGISTER_DTM = A_REG_DTM;
    }

    public String getRMK() {
        return RMK;
    }

    public void setRMK(String RMK) {
        this.RMK = RMK;
    }

    @Override
    public String toString() {
        return "CounselAnswerDto{" +
                "CNSL_ID=" + CNSL_ID +
                ", MBR_ID='" + MBR_ID + '\'' +
                ", PROD_ID=" + PROD_ID +
                ", PROD_NM='" + PROD_NM + '\'' +
                ", CATE_ID='" + CATE_ID + '\'' +
                ", CATE_NM='" + CATE_NM + '\'' +
                ", BBS_ID='" + BBS_ID + '\'' +
                ", TTL='" + TTL + '\'' +
                ", CN='" + CN + '\'' +
                ", RX='" + RX + '\'' +
                ", REG_DTM=" + REG_DTM +
                ", STUS='" + STUS + '\'' +
                ", ANS_YN='" + ANS_YN + '\'' +
                ", ANS_ID=" + ANS_ID +
                ", CONTENT='" + CONTENT + '\'' +
                ", WRTR='" + WRTR + '\'' +
                ", REGISTER_DTM=" + REGISTER_DTM +
                ", RMK='" + RMK + '\'' +
                '}';
    }
}
