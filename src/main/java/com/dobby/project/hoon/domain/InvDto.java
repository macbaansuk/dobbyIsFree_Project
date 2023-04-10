package com.dobby.project.hoon.domain;

import java.util.Date;
import java.util.Objects;

public class InvDto {

    private Integer PROD_ID;
    private String CATE_CD;
    private Integer AMT;
    private String PROD_NM;
    private String REP_IMG;
    private Integer AVG_ASCR;
    private Integer REVW_NCNT;
    private Integer INV_QTY;
    private String NEW_YN;
    private String PROD_STUS;
    private String OPT_YN;
    private String DESC_1;
    private String DC_YN;
    private Integer DC_APLY;
    private String MAI_YN;
    private String FGIFT_YN;
    private Date UPD_DTM;
    private Date REG_DTM;
    private String NOTICE;
    private Date SLE_BGN_DTM;
    private Date SLE_END_DTM;
    private String INV_LOC;
    private Integer SAFE_INV;
    private String INV_STUS_CD;
    private Date FST_REG_DTM;
    private String FST_REGR_DCMT_NO;
    private Date LAST_UPD_DTM;
    private String LAST_UPDR_DCMT_NO;

//    public  InvDto() {}
//    public InvDto(Integer PROD_ID, String CATE_CD, Integer AMT, String PROD_NM, String REP_IMG) {
//        this.PROD_ID = PROD_ID;
//        this.CATE_CD = CATE_CD;
//        this.AMT = AMT;
//        this.PROD_NM = PROD_NM;
//        this.REP_IMG = REP_IMG;
//
//    }

    public InvDto(Integer PROD_ID, String CATE_CD, Integer AMT, String PROD_NM, String REP_IMG, Integer AVG_ASCR, Integer REVW_NCNT, Integer INV_QTY, String NEW_YN, String PROD_STUS, String OPT_YN, String DESC_1, String DC_YN, Integer DC_APLY, String MAI_YN, String FGIFT_YN, Date UPD_DTM, Date REG_DTM, String NOTICE, Date SLE_BGN_DTM, Date SLE_END_DTM, String INV_LOC, Integer SAFE_INV, String INV_STUS_CD, Date FST_REG_DTM, String FST_REGR_DCMT_NO, Date LAST_UPD_DTM, String LAST_UPDR_DCMT_NO) {
        this.PROD_ID = PROD_ID;
        this.CATE_CD = CATE_CD;
        this.AMT = AMT;
        this.PROD_NM = PROD_NM;
        this.REP_IMG = REP_IMG;
        this.AVG_ASCR = AVG_ASCR;
        this.REVW_NCNT = REVW_NCNT;
        this.INV_QTY = INV_QTY;
        this.NEW_YN = NEW_YN;
        this.PROD_STUS = PROD_STUS;
        this.OPT_YN = OPT_YN;
        this.DESC_1 = DESC_1;
        this.DC_YN = DC_YN;
        this.DC_APLY = DC_APLY;
        this.MAI_YN = MAI_YN;
        this.FGIFT_YN = FGIFT_YN;
        this.UPD_DTM = UPD_DTM;
        this.REG_DTM = REG_DTM;
        this.NOTICE = NOTICE;
        this.SLE_BGN_DTM = SLE_BGN_DTM;
        this.SLE_END_DTM = SLE_END_DTM;
        this.INV_LOC = INV_LOC;
        this.SAFE_INV = SAFE_INV;
        this.INV_STUS_CD = INV_STUS_CD;
        this.FST_REG_DTM = FST_REG_DTM;
        this.FST_REGR_DCMT_NO = FST_REGR_DCMT_NO;
        this.LAST_UPD_DTM = LAST_UPD_DTM;
        this.LAST_UPDR_DCMT_NO = LAST_UPDR_DCMT_NO;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        InvDto invDto = (InvDto) o;
        return Objects.equals(PROD_ID, invDto.PROD_ID) && Objects.equals(CATE_CD, invDto.CATE_CD) && Objects.equals(AMT, invDto.AMT) && Objects.equals(PROD_NM, invDto.PROD_NM) && Objects.equals(REP_IMG, invDto.REP_IMG) && Objects.equals(AVG_ASCR, invDto.AVG_ASCR) && Objects.equals(REVW_NCNT, invDto.REVW_NCNT) && Objects.equals(INV_QTY, invDto.INV_QTY) && Objects.equals(NEW_YN, invDto.NEW_YN) && Objects.equals(PROD_STUS, invDto.PROD_STUS) && Objects.equals(OPT_YN, invDto.OPT_YN) && Objects.equals(DESC_1, invDto.DESC_1) && Objects.equals(DC_YN, invDto.DC_YN) && Objects.equals(DC_APLY, invDto.DC_APLY) && Objects.equals(MAI_YN, invDto.MAI_YN) && Objects.equals(FGIFT_YN, invDto.FGIFT_YN) && Objects.equals(NOTICE, invDto.NOTICE) && Objects.equals(INV_LOC, invDto.INV_LOC) && Objects.equals(SAFE_INV, invDto.SAFE_INV) && Objects.equals(INV_STUS_CD, invDto.INV_STUS_CD) && Objects.equals(FST_REGR_DCMT_NO, invDto.FST_REGR_DCMT_NO) && Objects.equals(LAST_UPDR_DCMT_NO, invDto.LAST_UPDR_DCMT_NO);
    }

    @Override
    public int hashCode() {
        return Objects.hash(PROD_ID, CATE_CD, AMT, PROD_NM, REP_IMG, AVG_ASCR, REVW_NCNT, INV_QTY, NEW_YN, PROD_STUS, OPT_YN, DESC_1, DC_YN, DC_APLY, MAI_YN, FGIFT_YN, NOTICE, INV_LOC, SAFE_INV, INV_STUS_CD, FST_REGR_DCMT_NO, LAST_UPDR_DCMT_NO);
    }

    @Override
    public String toString() {
        return "InvDto{" +
                "PROD_ID=" + PROD_ID +
                ", CATE_CD='" + CATE_CD + '\'' +
                ", AMT=" + AMT +
                ", PROD_NM='" + PROD_NM + '\'' +
                ", REP_IMG='" + REP_IMG + '\'' +
                ", AVG_ASCR=" + AVG_ASCR +
                ", REVW_NCNT=" + REVW_NCNT +
                ", INV_QTY=" + INV_QTY +
                ", NEW_YN='" + NEW_YN + '\'' +
                ", PROD_STUS='" + PROD_STUS + '\'' +
                ", OPT_YN='" + OPT_YN + '\'' +
                ", DESC_1='" + DESC_1 + '\'' +
                ", DC_YN='" + DC_YN + '\'' +
                ", DC_APLY=" + DC_APLY +
                ", MAI_YN='" + MAI_YN + '\'' +
                ", FGIFT_YN='" + FGIFT_YN + '\'' +
                ", UPD_DTM=" + UPD_DTM +
                ", REG_DTM=" + REG_DTM +
                ", NOTICE='" + NOTICE + '\'' +
                ", SLE_BGN_DTM=" + SLE_BGN_DTM +
                ", SLE_END_DTM=" + SLE_END_DTM +
                ", INV_LOC='" + INV_LOC + '\'' +
                ", SAFE_INV=" + SAFE_INV +
                ", INV_STUS_CD='" + INV_STUS_CD + '\'' +
                ", FST_REG_DTM=" + FST_REG_DTM +
                ", FST_REGR_DCMT_NO='" + FST_REGR_DCMT_NO + '\'' +
                ", LAST_UPD_DTM=" + LAST_UPD_DTM +
                ", LAST_UPDR_DCMT_NO='" + LAST_UPDR_DCMT_NO + '\'' +
                '}';
    }

    public Integer getPROD_ID() {
        return PROD_ID;
    }

    public void setPROD_ID(Integer PROD_ID) {
        this.PROD_ID = PROD_ID;
    }

    public String getCATE_CD() {
        return CATE_CD;
    }

    public void setCATE_CD(String CATE_CD) {
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

    public Integer getREVW_NCNT() {
        return REVW_NCNT;
    }

    public void setREVW_NCNT(Integer REVW_NCNT) {
        this.REVW_NCNT = REVW_NCNT;
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

    public String getDESC_1() {
        return DESC_1;
    }

    public void setDESC_1(String DESC_1) {
        this.DESC_1 = DESC_1;
    }

    public String getDC_YN() {
        return DC_YN;
    }

    public void setDC_YN(String DC_YN) {
        this.DC_YN = DC_YN;
    }

    public Integer getDC_APLY() {
        return DC_APLY;
    }

    public void setDC_APLY(Integer DC_APLY) {
        this.DC_APLY = DC_APLY;
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

    public String getINV_LOC() {
        return INV_LOC;
    }

    public void setINV_LOC(String INV_LOC) {
        this.INV_LOC = INV_LOC;
    }

    public Integer getSAFE_INV() {
        return SAFE_INV;
    }

    public void setSAFE_INV(Integer SAFE_INV) {
        this.SAFE_INV = SAFE_INV;
    }

    public String getINV_STUS_CD() {
        return INV_STUS_CD;
    }

    public void setINV_STUS_CD(String INV_STUS_CD) {
        this.INV_STUS_CD = INV_STUS_CD;
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

    public String getLAST_UPDR_DCMT_NO() {
        return LAST_UPDR_DCMT_NO;
    }

    public void setLAST_UPDR_DCMT_NO(String LAST_UPDR_DCMT_NO) {
        this.LAST_UPDR_DCMT_NO = LAST_UPDR_DCMT_NO;
    }

}
