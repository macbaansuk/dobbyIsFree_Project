package com.dobby.project.sun.domain;

import java.sql.Date;
import java.util.Objects;

public class TotalDto {
    private Integer PROD_ID;
    private Integer CATE_CD;
    private Integer AMT;
    private String PROD_NM;
    private String REP_IMG;
    private Integer AVG_ASCR;
    private Integer REWV_NCNT;
    private Integer INV_QTY;
    private String NEW_YN;
    private String PROD_STUS;
    private String OPT_YN;
    private String PROD_DESC;
    private String DC_YN;
    private String MAI_YN;
    private String FGIFT_YN;
    private Date UPD_DTM;
    private Date REG_DTM;
    private String NOTICE;
    private Date SLE_BGN_DTM;
    private Date SLE_END_DTM;

    private Integer PROD_DC_ID;
    private String DC_TYP;
    private Integer DC_RATE;
    private Integer DC_AMT;
    private Integer DC_PRICE;
    private Date BGN_DTM;
    private Date END_DTM;
    private String DC_STUS;

    private Integer OPT_ID;
    private String OPT_NM;
    private String OPT_VAL;
    private String OPT_STUS;

    private Integer HASHTAG_ID;
    private String HASHTAG_NM;

    private Integer PROD_FILE_ID;
    private String FILE_NM;
    private String PATH;
    private String KIND;


    public TotalDto() {
    }

    public TotalDto(Integer PROD_ID, Integer CATE_CD, Integer AMT, String PROD_NM, String REP_IMG, Integer AVG_ASCR, Integer REWV_NCNT, Integer INV_QTY, String NEW_YN, String PROD_STUS, String OPT_YN, String PROD_DESC, String DC_YN, String MAI_YN, String FGIFT_YN, Date UPD_DTM, Date REG_DTM, String NOTICE, Date SLE_BGN_DTM, Date SLE_END_DTM, Integer PROD_DC_ID, String DC_TYP, Integer DC_RATE, Integer DC_AMT, Integer DC_PRICE, Date BGN_DTM, Date END_DTM, String DC_STUS, Integer OPT_ID, String OPT_NM, String OPT_VAL, String OPT_STUS, Integer HASHTAG_ID, String HASHTAG_NM, Integer PROD_FILE_ID, String FILE_NM, String PATH, String KIND) {

        this.PROD_ID = PROD_ID;
        this.CATE_CD = CATE_CD;
        this.AMT = AMT;
        this.PROD_NM = PROD_NM;
        this.REP_IMG = REP_IMG;
        this.AVG_ASCR = AVG_ASCR;
        this.REWV_NCNT = REWV_NCNT;
        this.INV_QTY = INV_QTY;
        this.NEW_YN = NEW_YN;
        this.PROD_STUS = PROD_STUS;
        this.OPT_YN = OPT_YN;
        this.PROD_DESC = PROD_DESC;
        this.DC_YN = DC_YN;
        this.MAI_YN = MAI_YN;
        this.FGIFT_YN = FGIFT_YN;
        this.UPD_DTM = UPD_DTM;
        this.REG_DTM = REG_DTM;
        this.NOTICE = NOTICE;
        this.SLE_BGN_DTM = SLE_BGN_DTM;
        this.SLE_END_DTM = SLE_END_DTM;
        this.PROD_DC_ID = PROD_DC_ID;
        this.DC_TYP = DC_TYP;
        this.DC_RATE = DC_RATE;
        this.DC_AMT = DC_AMT;
        this.DC_PRICE = DC_PRICE;
        this.BGN_DTM = BGN_DTM;
        this.END_DTM = END_DTM;
        this.DC_STUS = DC_STUS;
        this.OPT_ID = OPT_ID;
        this.OPT_NM = OPT_NM;
        this.OPT_VAL = OPT_VAL;
        this.OPT_STUS = OPT_STUS;
        this.HASHTAG_ID = HASHTAG_ID;
        this.HASHTAG_NM = HASHTAG_NM;
        this.PROD_FILE_ID = PROD_FILE_ID;
        this.FILE_NM = FILE_NM;
        this.PATH = PATH;
        this.KIND = KIND;
    }

    public Integer getPROD_ID() {
        return PROD_ID;
    }

    public void setPROD_ID(Integer PROD_ID) {
        this.PROD_ID = PROD_ID;
    }

    public Integer getCATE_CD() {
        return CATE_CD;
    }

    public void setCATE_CD(Integer CATE_CD) {
        this.CATE_CD = CATE_CD;
    }

    public Integer getAMT() {
        return AMT;
    }

    public void setAMT(Integer AMT) {
        this.AMT = AMT;
    }

    public String getPROD_NM() {
        return PROD_NM;
    }

    public void setPROD_NM(String PROD_NM) {
        this.PROD_NM = PROD_NM;
    }

    public String getREP_IMG() {
        return REP_IMG;
    }

    public void setREP_IMG(String REP_IMG) {
        this.REP_IMG = REP_IMG;
    }

    public Integer getAVG_ASCR() {
        return AVG_ASCR;
    }

    public void setAVG_ASCR(Integer AVG_ASCR) {
        this.AVG_ASCR = AVG_ASCR;
    }

    public Integer getREWV_NCNT() {
        return REWV_NCNT;
    }

    public void setREWV_NCNT(Integer REWV_NCNT) {
        this.REWV_NCNT = REWV_NCNT;
    }

    public Integer getINV_QTY() {
        return INV_QTY;
    }

    public void setINV_QTY(Integer INV_QTY) {
        this.INV_QTY = INV_QTY;
    }

    public String getNEW_YN() {
        return NEW_YN;
    }

    public void setNEW_YN(String NEW_YN) {
        this.NEW_YN = NEW_YN;
    }

    public String getPROD_STUS() {
        return PROD_STUS;
    }

    public void setPROD_STUS(String PROD_STUS) {
        this.PROD_STUS = PROD_STUS;
    }

    public String getOPT_YN() {
        return OPT_YN;
    }

    public void setOPT_YN(String OPT_YN) {
        this.OPT_YN = OPT_YN;
    }

    public String getPROD_DESC() {
        return PROD_DESC;
    }

    public void setPROD_DESC(String PROD_DESC) {
        this.PROD_DESC = PROD_DESC;
    }

    public String getDC_YN() {
        return DC_YN;
    }

    public void setDC_YN(String DC_YN) {
        this.DC_YN = DC_YN;
    }

    public String getMAI_YN() {
        return MAI_YN;
    }

    public void setMAI_YN(String MAI_YN) {
        this.MAI_YN = MAI_YN;
    }

    public String getFGIFT_YN() {
        return FGIFT_YN;
    }

    public void setFGIFT_YN(String FGIFT_YN) {
        this.FGIFT_YN = FGIFT_YN;
    }

    public Date getUPD_DTM() {
        return UPD_DTM;
    }

    public void setUPD_DTM(Date UPD_DTM) {
        this.UPD_DTM = UPD_DTM;
    }

    public Date getREG_DTM() {
        return REG_DTM;
    }

    public void setREG_DTM(Date REG_DTM) {
        this.REG_DTM = REG_DTM;
    }

    public String getNOTICE() {
        return NOTICE;
    }

    public void setNOTICE(String NOTICE) {
        this.NOTICE = NOTICE;
    }

    public Date getSLE_BGN_DTM() {
        return SLE_BGN_DTM;
    }

    public void setSLE_BGN_DTM(Date SLE_BGN_DTM) {
        this.SLE_BGN_DTM = SLE_BGN_DTM;
    }

    public Date getSLE_END_DTM() {
        return SLE_END_DTM;
    }

    public void setSLE_END_DTM(Date SLE_END_DTM) {
        this.SLE_END_DTM = SLE_END_DTM;
    }

    public Integer getPROD_DC_ID() {
        return PROD_DC_ID;
    }

    public void setPROD_DC_ID(Integer PROD_DC_ID) {
        this.PROD_DC_ID = PROD_DC_ID;
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

    public Integer getOPT_ID() {
        return OPT_ID;
    }

    public void setOPT_ID(Integer OPT_ID) {
        this.OPT_ID = OPT_ID;
    }

    public String getOPT_NM() {
        return OPT_NM;
    }

    public void setOPT_NM(String OPT_NM) {
        this.OPT_NM = OPT_NM;
    }

    public String getOPT_VAL() {
        return OPT_VAL;
    }

    public void setOPT_VAL(String OPT_VAL) {
        this.OPT_VAL = OPT_VAL;
    }

    public String getOPT_STUS() {
        return OPT_STUS;
    }

    public void setOPT_STUS(String OPT_STUS) {
        this.OPT_STUS = OPT_STUS;
    }

    public Integer getHASHTAG_ID() {
        return HASHTAG_ID;
    }

    public void setHASHTAG_ID(Integer HASHTAG_ID) {
        this.HASHTAG_ID = HASHTAG_ID;
    }

    public String getHASHTAG_NM() {
        return HASHTAG_NM;
    }

    public void setHASHTAG_NM(String HASHTAG_NM) {
        this.HASHTAG_NM = HASHTAG_NM;
    }

    public Integer getPROD_FILE_ID() {
        return PROD_FILE_ID;
    }

    public void setPROD_FILE_ID(Integer PROD_FILE_ID) {
        this.PROD_FILE_ID = PROD_FILE_ID;
    }

    public String getFILE_NM() {
        return FILE_NM;
    }

    public void setFILE_NM(String FILE_NM) {
        this.FILE_NM = FILE_NM;
    }

    public String getPATH() {
        return PATH;
    }

    public void setPATH(String PATH) {
        this.PATH = PATH;
    }

    public String getKIND() {
        return KIND;
    }

    public void setKIND(String KIND) {
        this.KIND = KIND;
    }

    @Override
    public String toString() {
        return "TotalDto{" +
                "PROD_ID=" + PROD_ID +
                ", CATE_CD='" + CATE_CD + '\'' +
                ", AMT=" + AMT +
                ", PROD_NM='" + PROD_NM + '\'' +
                ", REP_IMG='" + REP_IMG + '\'' +
                ", AVG_ASCR=" + AVG_ASCR +
                ", REWV_NCNT=" + REWV_NCNT +
                ", INV_QTY=" + INV_QTY +
                ", NEW_YN='" + NEW_YN + '\'' +
                ", PROD_STUS='" + PROD_STUS + '\'' +
                ", OPT_YN='" + OPT_YN + '\'' +
                ", PROD_DESC='" + PROD_DESC + '\'' +
                ", DC_YN='" + DC_YN + '\'' +
                ", MAI_YN='" + MAI_YN + '\'' +
                ", FGIFT_YN='" + FGIFT_YN + '\'' +
                ", UPD_DTM=" + UPD_DTM +
                ", REG_DTM=" + REG_DTM +
                ", NOTICE='" + NOTICE + '\'' +
                ", SLE_BGN_DTM=" + SLE_BGN_DTM +
                ", SLE_END_DTM=" + SLE_END_DTM +
                ", PROD_DC_ID=" + PROD_DC_ID +
                ", DC_TYP='" + DC_TYP + '\'' +
                ", DC_RATE=" + DC_RATE +
                ", DC_AMT=" + DC_AMT +
                ", DC_PRICE=" + DC_PRICE +
                ", BGN_DTM=" + BGN_DTM +
                ", END_DTM=" + END_DTM +
                ", DC_STUS='" + DC_STUS + '\'' +
                ", OPT_ID=" + OPT_ID +
                ", OPT_NM='" + OPT_NM + '\'' +
                ", OPT_VAL='" + OPT_VAL + '\'' +
                ", OPT_STUS='" + OPT_STUS + '\'' +
                ", HASHTAG_ID=" + HASHTAG_ID +
                ", HASHTAG_NM='" + HASHTAG_NM + '\'' +
                ", PROD_FILE_ID=" + PROD_FILE_ID +
                ", FILE_NM='" + FILE_NM + '\'' +
                ", PATH='" + PATH + '\'' +
                ", KIND='" + KIND + '\'' +
                '}';
    }



}