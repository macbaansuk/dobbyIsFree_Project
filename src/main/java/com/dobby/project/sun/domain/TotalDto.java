package com.dobby.project.sun.domain;

import org.springframework.web.multipart.MultipartFile;

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
    private Date UPD_DTM;
    private Date REG_DTM;

    private Integer PROD_DC_ID;
    private Integer DC_RATE;

    private Integer PROD_FILE_ID;
    private String FILE_PATH;
    private String KIND;


    private MultipartFile file;
    private  MultipartFile detailFile;
    private  String oldFilePath;

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public MultipartFile getDetailFile() {
        return detailFile;
    }

    public void setDetailFile(MultipartFile detailFile) {
        this.detailFile = detailFile;
    }

    public String getOldFilePath() {
        return oldFilePath;
    }

    public void setOldFilePath(String oldFilePath) {
        this.oldFilePath = oldFilePath;
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

    public Integer getPROD_DC_ID() {
        return PROD_DC_ID;
    }

    public void setPROD_DC_ID(Integer PROD_DC_ID) {
        this.PROD_DC_ID = PROD_DC_ID;
    }

    public Integer getDC_RATE() {
        return DC_RATE;
    }

    public void setDC_RATE(Integer DC_RATE) {
        this.DC_RATE = DC_RATE;
    }





    public Integer getPROD_FILE_ID() {
        return PROD_FILE_ID;
    }

    public void setPROD_FILE_ID(Integer PROD_FILE_ID) {
        this.PROD_FILE_ID = PROD_FILE_ID;
    }

    public String getFILE_PATH() {
        return FILE_PATH;
    }

    public void setFILE_PATH(String FILE_PATH) {
        this.FILE_PATH = FILE_PATH;
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
                ", CATE_CD=" + CATE_CD +
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
                ", UPD_DTM=" + UPD_DTM +
                ", REG_DTM=" + REG_DTM +
                ", PROD_DC_ID=" + PROD_DC_ID +

                ", DC_RATE=" + DC_RATE +



                ", PROD_FILE_ID=" + PROD_FILE_ID +
                ", FILE_PATH='" + FILE_PATH + '\'' +
                ", KIND='" + KIND + '\'' +
                ", file=" + file +
                ", detailFile=" + detailFile +
                ", oldFilePath='" + oldFilePath + '\'' +
                '}';
    }
}