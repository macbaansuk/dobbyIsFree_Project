package com.dobby.project.product.domain;

import java.sql.Date;

public class ProductDCDto {


    private Integer PROD_DC_ID;
    private String PROD_NM;
    private Integer CATE_CD;
    private Integer PROD_ID;
    private String DC_TYP;
    private Integer DC_RATE;
    private Integer DC_AMT;
    private Integer DC_PRICE;
    private Date BGN_DTM;
    private Date END_DTM;
    private String DC_STUS;
    private Integer AMT;
    private String DC_YN;
    private Date UPD_DTM;
    private Date REG_DTM;

    private String REP_IMG;
    private Integer AVG_ASCR;
    private Integer REVW_NCNT;
    private Integer INV_QTY;
    private String NEW_YN;
    private String PROD_STUS;
    private String OPT_YN;
    private String PROD_DESC;
    private String MAI_YN;



//    public ProductDCDto() {
//    }

//    public ProductDCDto(Integer PROD_DC_ID, String PROD_NM, Integer CATE_CD, Integer PROD_ID, String DC_TYP, Integer DC_RATE, Integer DC_AMT, Integer DC_PRICE, Date BGN_DTM, Date END_DTM, String DC_STUS, Integer AMT, String DC_YN, Date UPD_DTM, Date REG_DTM) {
//        this.PROD_DC_ID = PROD_DC_ID;
//        this.PROD_NM = PROD_NM;
//        this.CATE_CD = CATE_CD;
//        this.PROD_ID = PROD_ID;
//        this.DC_TYP = DC_TYP;
//        this.DC_RATE = DC_RATE;
//        this.DC_AMT = DC_AMT;
//        this.DC_PRICE = DC_PRICE;
//        this.BGN_DTM = BGN_DTM;
//        this.END_DTM = END_DTM;
//        this.DC_STUS = DC_STUS;
//        this.AMT = AMT;
//        this.DC_YN = DC_YN;
//        this.UPD_DTM = UPD_DTM;
//        this.REG_DTM = REG_DTM;
//    }
//


    public Integer getPROD_DC_ID() {
        return PROD_DC_ID;
    }

    public void setPROD_DC_ID(Integer PROD_DC_ID) {
        this.PROD_DC_ID = PROD_DC_ID;
    }

    public String getPROD_NM() {
        return PROD_NM;
    }

    public void setPROD_NM(String PROD_NM) {
        this.PROD_NM = PROD_NM;
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


    public Integer getAMT() {
        return AMT;
    }

    public void setAMT(Integer AMT) {
        this.AMT = AMT;
    }

    public String getDC_YN() {
        return DC_YN;
    }

    public void setDC_YN(String DC_YN) {
        this.DC_YN = DC_YN;
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

    public Integer getCATE_CD() {
        return CATE_CD;
    }

    public void setCATE_CD(Integer CATE_CD) {
        this.CATE_CD = CATE_CD;
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

    public String getPROD_DESC() {
        return PROD_DESC;
    }

    public void setPROD_DESC(String PROD_DESC) {
        this.PROD_DESC = PROD_DESC;
    }

    public String getMAI_YN() {
        return MAI_YN;
    }

    public void setMAI_YN(String MAI_YN) {
        this.MAI_YN = MAI_YN;
    }

    @Override
    public String toString() {
        return "ProductDCDto{" +
                "PROD_DC_ID=" + PROD_DC_ID +
                ", PROD_NM='" + PROD_NM + '\'' +
                ", CATE_CD=" + CATE_CD +
                ", PROD_ID=" + PROD_ID +
                ", DC_TYP='" + DC_TYP + '\'' +
                ", DC_RATE=" + DC_RATE +
                ", DC_AMT=" + DC_AMT +
                ", DC_PRICE=" + DC_PRICE +
                ", BGN_DTM=" + BGN_DTM +
                ", END_DTM=" + END_DTM +
                ", DC_STUS='" + DC_STUS + '\'' +
                ", AMT=" + AMT +
                ", DC_YN='" + DC_YN + '\'' +
                ", UPD_DTM=" + UPD_DTM +
                ", REG_DTM=" + REG_DTM +
                ", REP_IMG='" + REP_IMG + '\'' +
                ", AVG_ASCR=" + AVG_ASCR +
                ", REVW_NCNT=" + REVW_NCNT +
                ", INV_QTY=" + INV_QTY +
                ", NEW_YN='" + NEW_YN + '\'' +
                ", PROD_STUS='" + PROD_STUS + '\'' +
                ", OPT_YN='" + OPT_YN + '\'' +
                ", PROD_DESC='" + PROD_DESC + '\'' +
                ", MAI_YN='" + MAI_YN + '\'' +
                '}';
    }
//    @Override
//    public boolean equals(Object o) {
//        if (this == o) return true;
//        if (o == null || getClass() != o.getClass()) return false;
//        ProductDCDto that = (ProductDCDto) o;
//        return Objects.equals(PROD_DC_ID, that.PROD_DC_ID);
//    }
//
//    @Override
//    public int hashCode() {
//        return Objects.hash(PROD_DC_ID);
//    }
//}

}