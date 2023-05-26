package com.dobby.project.counsel.domain;

import java.util.Date;
import java.util.Objects;

public class CounselDto {
    private Integer CNSL_ID;
    private String MBR_ID;
    private Integer PROD_ID;
    private String ORD_ID;
    private String CATE_ID;
    private String BBS_ID;
    private String TTL;
    private String CN;
    private String RX;
    private Date REG_DTM;
    private String STUS;
    private String ANS_YN;
    private Date FST_REG_DTM;
    private String FST_REGR_DCMT_NO;
    private Date LAST_UPD_DTM;
    private String LAST_UPD_DCMT_NO;

    public CounselDto(){}
    public CounselDto(String CATE_ID, String TTL, String CN, String RX) {
        this.CATE_ID = CATE_ID;
        this.TTL = TTL;
        this.CN = CN;
        this.RX = RX;
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
    public String getORD_ID() {
        return ORD_ID;
    }
    public void setORD_ID(String ORD_ID) {
        this.ORD_ID = ORD_ID;
    }
    public String getCATE_ID() {
        return CATE_ID;
    }

    public void setCATE_ID(String CATE_ID) {
        this.CATE_ID = CATE_ID;
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

    public Date getREG_DTM() { return REG_DTM; }

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
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CounselDto that = (CounselDto) o;
        return Objects.equals(CNSL_ID, that.CNSL_ID) && Objects.equals(MBR_ID, that.MBR_ID);
    }

    @Override
    public int hashCode() {
        return Objects.hash(CNSL_ID, MBR_ID);
    }

    @Override
    public String toString() {
        return "CounselDto{" +
                "CNSL_ID=" + CNSL_ID +
                ", MBR_ID='" + MBR_ID + '\'' +
                ", PROD_ID=" + PROD_ID +
                ", ORD_ID='" + ORD_ID + '\'' +
                ", CATE_ID='" + CATE_ID + '\'' +
                ", BBS_ID='" + BBS_ID + '\'' +
                ", TTL='" + TTL + '\'' +
                ", CN='" + CN + '\'' +
                ", RX='" + RX + '\'' +
                ", REG_DTM=" + REG_DTM +
                ", STUS='" + STUS + '\'' +
                ", ANS_YN='" + ANS_YN + '\'' +
                ", FST_REG_DTM=" + FST_REG_DTM +
                ", FST_REGR_DCMT_NO='" + FST_REGR_DCMT_NO + '\'' +
                ", LAST_UPD_DTM=" + LAST_UPD_DTM +
                ", LAST_UPD_DCMT_NO='" + LAST_UPD_DCMT_NO + '\'' +
                '}';
    }
}