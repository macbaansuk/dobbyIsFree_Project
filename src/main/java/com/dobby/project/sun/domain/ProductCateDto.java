package com.dobby.project.sun.domain;

import java.sql.Date;
import java.util.Objects;

public class ProductCateDto {

//    private Integer PROD_ID;
//    private Integer CATE_CD;
//    private Integer AMT;
//    private String PROD_NM;
//    private String REP_IMG;
//    private String CATE_REP_IMG;
//    private Integer AVG_ASCR;
//    private Integer REVW_NCNT;
//    private Integer INV_QTY;
//    private String NEW_YN;
//    private String PROD_STUS;
//    private String OPT_YN;
//    private String PROD_DESC;
//    private String DC_YN;
//    private String MAI_YN;
//    private String FGIFT_YN;
//    private Date UPD_DTM;
//    private Date REG_DTM;
//    private String NOTICE;
//    private Date SLE_BGN_DTM;
//    private Date SLE_END_DTM;
//    private String INV_LOC;
//    private Integer SAFE_INV;
//    private String INV_STUS_CD;
//    private Date FST_REG_DTM;
//    private String FST_REGR_DCMT_NO;
//    private Date LAST_UPD_DTM;
//    private String LAST_UPDR_DCMT_NO;
//    private String CATE_NM;
//    private String CATE_DESC;
//    private String PARENT_ID;
//    private String CATE_STUS;

//    public ProductCateDto() {
//    }
//
//    public ProductCateDto(Integer PROD_ID, Integer CATE_CD, Integer AMT, String PROD_NM, String REP_IMG, String CATE_REP_IMG, Integer AVG_ASCR, Integer REVW_NCNT, Integer INV_QTY, String NEW_YN, String PROD_STUS, String OPT_YN, String PROD_DESC, String DC_YN, String MAI_YN, String FGIFT_YN, Date UPD_DTM, Date REG_DTM, String NOTICE, Date SLE_BGN_DTM, Date SLE_END_DTM, String INV_LOC, Integer SAFE_INV, String INV_STUS_CD, Date FST_REG_DTM, String FST_REGR_DCMT_NO, Date LAST_UPD_DTM, String LAST_UPDR_DCMT_NO, String CATE_NM, String CATE_DESC, String PARENT_ID, String CATE_STUS) {
//
//        this.PROD_ID = PROD_ID;
//        this.CATE_CD = CATE_CD;
//        this.AMT = AMT;
//        this.PROD_NM = PROD_NM;
//        this.REP_IMG = REP_IMG;
//        this.CATE_REP_IMG = CATE_REP_IMG;
//        this.AVG_ASCR = AVG_ASCR;
//        this.REVW_NCNT = REVW_NCNT;
//        this.INV_QTY = INV_QTY;
//        this.NEW_YN = NEW_YN;
//        this.PROD_STUS = PROD_STUS;
//        this.OPT_YN = OPT_YN;
//        this.PROD_DESC = PROD_DESC;
//        this.DC_YN = DC_YN;
//        this.MAI_YN = MAI_YN;
//        this.FGIFT_YN = FGIFT_YN;
//        this.UPD_DTM = UPD_DTM;
//        this.REG_DTM = REG_DTM;
//        this.NOTICE = NOTICE;
//        this.SLE_BGN_DTM = SLE_BGN_DTM;
//        this.SLE_END_DTM = SLE_END_DTM;
//        this.INV_LOC = INV_LOC;
//        this.SAFE_INV = SAFE_INV;
//        this.INV_STUS_CD = INV_STUS_CD;
//        this.FST_REG_DTM = FST_REG_DTM;
//        this.FST_REGR_DCMT_NO = FST_REGR_DCMT_NO;
//        this.LAST_UPD_DTM = LAST_UPD_DTM;
//        this.LAST_UPDR_DCMT_NO = LAST_UPDR_DCMT_NO;
//        this.CATE_NM = CATE_NM;
//        this.CATE_DESC = CATE_DESC;
//        this.PARENT_ID = PARENT_ID;
//        this.CATE_STUS = CATE_STUS;
//    }
//
//    public Integer getPROD_ID() {
//        return PROD_ID;
//    }
//
//    public void setPROD_ID(Integer PROD_ID) {
//        this.PROD_ID = PROD_ID;
//    }
//
//    public Integer getCATE_CD() {
//        return CATE_CD;
//    }
//
//    public void setCATE_CD(Integer CATE_CD) {
//        this.CATE_CD = CATE_CD;
//    }
//
//    public Integer getAMT() {
//        return AMT;
//    }
//
//    public void setAMT(Integer AMT) {
//        this.AMT = AMT;
//    }
//
//    public String getPROD_NM() {
//        return PROD_NM;
//    }
//
//    public void setPROD_NM(String PROD_NM) {
//        this.PROD_NM = PROD_NM;
//    }
//
//    public String getREP_IMG() {
//        return REP_IMG;
//    }
//
//    public void setREP_IMG(String REP_IMG) {
//        this.REP_IMG = REP_IMG;
//    }
//
//    public String getCATE_REP_IMG() {
//        return CATE_REP_IMG;
//    }
//
//    public void setCATE_REP_IMG(String CATE_REP_IMG) {
//        this.CATE_REP_IMG = CATE_REP_IMG;
//    }
//
//    public Integer getAVG_ASCR() {
//        return AVG_ASCR;
//    }
//
//    public void setAVG_ASCR(Integer AVG_ASCR) {
//        this.AVG_ASCR = AVG_ASCR;
//    }
//
//    public Integer getREVW_NCNT() {
//        return REVW_NCNT;
//    }
//
//    public void setREVW_NCNT(Integer REVW_NCNT) {
//        this.REVW_NCNT = REVW_NCNT;
//    }
//
//    public Integer getINV_QTY() {
//        return INV_QTY;
//    }
//
//    public void setINV_QTY(Integer INV_QTY) {
//        this.INV_QTY = INV_QTY;
//    }
//
//    public String getNEW_YN() {
//        return NEW_YN;
//    }
//
//    public void setNEW_YN(String NEW_YN) {
//        this.NEW_YN = NEW_YN;
//    }
//
//    public String getPROD_STUS() {
//        return PROD_STUS;
//    }
//
//    public void setPROD_STUS(String PROD_STUS) {
//        this.PROD_STUS = PROD_STUS;
//    }
//
//    public String getOPT_YN() {
//        return OPT_YN;
//    }
//
//    public void setOPT_YN(String OPT_YN) {
//        this.OPT_YN = OPT_YN;
//    }
//
//    public String getPROD_DESC() {
//        return PROD_DESC;
//    }
//
//    public void setPROD_DESC(String PROD_DESC) {
//        this.PROD_DESC = PROD_DESC;
//    }
//
//    public String getDC_YN() {
//        return DC_YN;
//    }
//
//    public void setDC_YN(String DC_YN) {
//        this.DC_YN = DC_YN;
//    }
//
//    public String getMAI_YN() {
//        return MAI_YN;
//    }
//
//    public void setMAI_YN(String MAI_YN) {
//        this.MAI_YN = MAI_YN;
//    }
//
//    public String getFGIFT_YN() {
//        return FGIFT_YN;
//    }
//
//    public void setFGIFT_YN(String FGIFT_YN) {
//        this.FGIFT_YN = FGIFT_YN;
//    }
//
//    public Date getUPD_DTM() {
//        return UPD_DTM;
//    }
//
//    public void setUPD_DTM(Date UPD_DTM) {
//        this.UPD_DTM = UPD_DTM;
//    }
//
//    public Date getREG_DTM() {
//        return REG_DTM;
//    }
//
//    public void setREG_DTM(Date REG_DTM) {
//        this.REG_DTM = REG_DTM;
//    }
//
//    public String getNOTICE() {
//        return NOTICE;
//    }
//
//    public void setNOTICE(String NOTICE) {
//        this.NOTICE = NOTICE;
//    }
//
//    public Date getSLE_BGN_DTM() {
//        return SLE_BGN_DTM;
//    }
//
//    public void setSLE_BGN_DTM(Date SLE_BGN_DTM) {
//        this.SLE_BGN_DTM = SLE_BGN_DTM;
//    }
//
//    public Date getSLE_END_DTM() {
//        return SLE_END_DTM;
//    }
//
//    public void setSLE_END_DTM(Date SLE_END_DTM) {
//        this.SLE_END_DTM = SLE_END_DTM;
//    }
//
//    public String getINV_LOC() {
//        return INV_LOC;
//    }
//
//    public void setINV_LOC(String INV_LOC) {
//        this.INV_LOC = INV_LOC;
//    }
//
//    public Integer getSAFE_INV() {
//        return SAFE_INV;
//    }
//
//    public void setSAFE_INV(Integer SAFE_INV) {
//        this.SAFE_INV = SAFE_INV;
//    }
//
//    public String getINV_STUS_CD() {
//        return INV_STUS_CD;
//    }
//
//    public void setINV_STUS_CD(String INV_STUS_CD) {
//        this.INV_STUS_CD = INV_STUS_CD;
//    }
//
//    public Date getFST_REG_DTM() {
//        return FST_REG_DTM;
//    }
//
//    public void setFST_REG_DTM(Date FST_REG_DTM) {
//        this.FST_REG_DTM = FST_REG_DTM;
//    }
//
//    public String getFST_REGR_DCMT_NO() {
//        return FST_REGR_DCMT_NO;
//    }
//
//    public void setFST_REGR_DCMT_NO(String FST_REGR_DCMT_NO) {
//        this.FST_REGR_DCMT_NO = FST_REGR_DCMT_NO;
//    }
//
//    public Date getLAST_UPD_DTM() {
//        return LAST_UPD_DTM;
//    }
//
//    public void setLAST_UPD_DTM(Date LAST_UPD_DTM) {
//        this.LAST_UPD_DTM = LAST_UPD_DTM;
//    }
//
//    public String getLAST_UPDR_DCMT_NO() {
//        return LAST_UPDR_DCMT_NO;
//    }
//
//    public void setLAST_UPDR_DCMT_NO(String LAST_UPDR_DCMT_NO) {
//        this.LAST_UPDR_DCMT_NO = LAST_UPDR_DCMT_NO;
//    }
//
//    public String getCATE_NM() {
//        return CATE_NM;
//    }
//
//    public void setCATE_NM(String CATE_NM) {
//        this.CATE_NM = CATE_NM;
//    }
//
//    public String getCATE_DESC() {
//        return CATE_DESC;
//    }
//
//    public void setCATE_DESC(String CATE_DESC) {
//        this.CATE_DESC = CATE_DESC;
//    }
//
//    public String getPARENT_ID() {
//        return PARENT_ID;
//    }
//
//    public void setPARENT_ID(String PARENT_ID) {
//        this.PARENT_ID = PARENT_ID;
//    }
//
//    public String getCATE_STUS() {
//        return CATE_STUS;
//    }
//
//    public void setCATE_STUS(String CATE_STUS) {
//        this.CATE_STUS = CATE_STUS;
//    }
//
//    @Override
//    public String toString() {
//        return "ProductCateDto{" +
//                "PROD_ID=" + PROD_ID +
//                ", CATE_CD=" + CATE_CD +
//                ", AMT=" + AMT +
//                ", PROD_NM='" + PROD_NM + '\'' +
//                ", REP_IMG='" + REP_IMG + '\'' +
//                ", CATE_REP_IMG='" + CATE_REP_IMG + '\'' +
//                ", AVG_ASCR=" + AVG_ASCR +
//                ", REVW_NCNT=" + REVW_NCNT +
//                ", INV_QTY=" + INV_QTY +
//                ", NEW_YN='" + NEW_YN + '\'' +
//                ", PROD_STUS='" + PROD_STUS + '\'' +
//                ", OPT_YN='" + OPT_YN + '\'' +
//                ", PROD_DESC='" + PROD_DESC + '\'' +
//                ", DC_YN='" + DC_YN + '\'' +
//                ", MAI_YN='" + MAI_YN + '\'' +
//                ", FGIFT_YN='" + FGIFT_YN + '\'' +
//                ", UPD_DTM=" + UPD_DTM +
//                ", REG_DTM=" + REG_DTM +
//                ", NOTICE='" + NOTICE + '\'' +
//                ", SLE_BGN_DTM=" + SLE_BGN_DTM +
//                ", SLE_END_DTM=" + SLE_END_DTM +
//                ", INV_LOC='" + INV_LOC + '\'' +
//                ", SAFE_INV=" + SAFE_INV +
//                ", INV_STUS_CD='" + INV_STUS_CD + '\'' +
//                ", FST_REG_DTM=" + FST_REG_DTM +
//                ", FST_REGR_DCMT_NO='" + FST_REGR_DCMT_NO + '\'' +
//                ", LAST_UPD_DTM=" + LAST_UPD_DTM +
//                ", LAST_UPDR_DCMT_NO='" + LAST_UPDR_DCMT_NO + '\'' +
//                ", CATE_NM='" + CATE_NM + '\'' +
//                ", CATE_DESC='" + CATE_DESC + '\'' +
//                ", PARENT_ID='" + PARENT_ID + '\'' +
//                ", CATE_STUS='" + CATE_STUS + '\'' +
//                '}';
//    }


    private Integer prod_id;
    private Integer cate_cd;
    private Integer amt;
    private String prod_nm;
    private String rep_img;
    private String cate_rep_img;
    private Integer avg_ascr;
    private Integer revw_ncnt;
    private Integer inv_qty;
    private String new_yn;
    private String prod_stus;
    private String opt_yn;
    private String prod_desc;
    private String dc_yn;
    private String mai_yn;
    private String fgift_yn;
    private Date upd_dtm;
    private Date reg_dtm;
    private String notice;
    private Date sle_bgn_dtm;
    private Date sle_end_dtm;
    private String inv_loc;
    private Integer safe_inv;
    private String inv_stus_cd;
    private Date fst_reg_dtm;
    private String fst_regr_dcmt_no;
    private Date last_upd_dtm;
    private String last_updr_dcmt_no;
    private String cate_nm;
    private String cate_desc;
    private String parent_id;
    private String cate_stus;


    public Integer getProd_id() {
        return prod_id;
    }

    public void setProd_id(Integer prod_id) {
        this.prod_id = prod_id;
    }

    public Integer getCate_cd() {
        return cate_cd;
    }

    public void setCate_cd(Integer cate_cd) {
        this.cate_cd = cate_cd;
    }

    public Integer getAmt() {
        return amt;
    }

    public void setAmt(Integer amt) {
        this.amt = amt;
    }

    public String getProd_nm() {
        return prod_nm;
    }

    public void setProd_nm(String prod_nm) {
        this.prod_nm = prod_nm;
    }

    public String getRep_img() {
        return rep_img;
    }

    public void setRep_img(String rep_img) {
        this.rep_img = rep_img;
    }

    public String getCate_rep_img() {
        return cate_rep_img;
    }

    public void setCate_rep_img(String cate_rep_img) {
        this.cate_rep_img = cate_rep_img;
    }

    public Integer getAvg_ascr() {
        return avg_ascr;
    }

    public void setAvg_ascr(Integer avg_ascr) {
        this.avg_ascr = avg_ascr;
    }

    public Integer getRevw_ncnt() {
        return revw_ncnt;
    }

    public void setRevw_ncnt(Integer revw_ncnt) {
        this.revw_ncnt = revw_ncnt;
    }

    public Integer getInv_qty() {
        return inv_qty;
    }

    public void setInv_qty(Integer inv_qty) {
        this.inv_qty = inv_qty;
    }

    public String getNew_yn() {
        return new_yn;
    }

    public void setNew_yn(String new_yn) {
        this.new_yn = new_yn;
    }

    public String getProd_stus() {
        return prod_stus;
    }

    public void setProd_stus(String prod_stus) {
        this.prod_stus = prod_stus;
    }

    public String getOpt_yn() {
        return opt_yn;
    }

    public void setOpt_yn(String opt_yn) {
        this.opt_yn = opt_yn;
    }

    public String getProd_desc() {
        return prod_desc;
    }

    public void setProd_desc(String prod_desc) {
        this.prod_desc = prod_desc;
    }

    public String getDc_yn() {
        return dc_yn;
    }

    public void setDc_yn(String dc_yn) {
        this.dc_yn = dc_yn;
    }

    public String getMai_yn() {
        return mai_yn;
    }

    public void setMai_yn(String mai_yn) {
        this.mai_yn = mai_yn;
    }

    public String getFgift_yn() {
        return fgift_yn;
    }

    public void setFgift_yn(String fgift_yn) {
        this.fgift_yn = fgift_yn;
    }

    public Date getUpd_dtm() {
        return upd_dtm;
    }

    public void setUpd_dtm(Date upd_dtm) {
        this.upd_dtm = upd_dtm;
    }

    public Date getReg_dtm() {
        return reg_dtm;
    }

    public void setReg_dtm(Date reg_dtm) {
        this.reg_dtm = reg_dtm;
    }

    public String getNotice() {
        return notice;
    }

    public void setNotice(String notice) {
        this.notice = notice;
    }

    public Date getSle_bgn_dtm() {
        return sle_bgn_dtm;
    }

    public void setSle_bgn_dtm(Date sle_bgn_dtm) {
        this.sle_bgn_dtm = sle_bgn_dtm;
    }

    public Date getSle_end_dtm() {
        return sle_end_dtm;
    }

    public void setSle_end_dtm(Date sle_end_dtm) {
        this.sle_end_dtm = sle_end_dtm;
    }

    public String getInv_loc() {
        return inv_loc;
    }

    public void setInv_loc(String inv_loc) {
        this.inv_loc = inv_loc;
    }

    public Integer getSafe_inv() {
        return safe_inv;
    }

    public void setSafe_inv(Integer safe_inv) {
        this.safe_inv = safe_inv;
    }

    public String getInv_stus_cd() {
        return inv_stus_cd;
    }

    public void setInv_stus_cd(String inv_stus_cd) {
        this.inv_stus_cd = inv_stus_cd;
    }

    public Date getFst_reg_dtm() {
        return fst_reg_dtm;
    }

    public void setFst_reg_dtm(Date fst_reg_dtm) {
        this.fst_reg_dtm = fst_reg_dtm;
    }

    public String getFst_regr_dcmt_no() {
        return fst_regr_dcmt_no;
    }

    public void setFst_regr_dcmt_no(String fst_regr_dcmt_no) {
        this.fst_regr_dcmt_no = fst_regr_dcmt_no;
    }

    public Date getLast_upd_dtm() {
        return last_upd_dtm;
    }

    public void setLast_upd_dtm(Date last_upd_dtm) {
        this.last_upd_dtm = last_upd_dtm;
    }

    public String getLast_updr_dcmt_no() {
        return last_updr_dcmt_no;
    }

    public void setLast_updr_dcmt_no(String last_updr_dcmt_no) {
        this.last_updr_dcmt_no = last_updr_dcmt_no;
    }

    public String getCate_nm() {
        return cate_nm;
    }

    public void setCate_nm(String cate_nm) {
        this.cate_nm = cate_nm;
    }

    public String getCate_desc() {
        return cate_desc;
    }

    public void setCate_desc(String cate_desc) {
        this.cate_desc = cate_desc;
    }

    public String getParent_id() {
        return parent_id;
    }

    public void setParent_id(String parent_id) {
        this.parent_id = parent_id;
    }

    public String getCate_stus() {
        return cate_stus;
    }

    public void setCate_stus(String cate_stus) {
        this.cate_stus = cate_stus;


    }

    @Override
    public String toString() {
        return "ProductCateDto{" +
                "prod_id=" + prod_id +
                ", cate_cd=" + cate_cd +
                ", amt=" + amt +
                ", prod_nm='" + prod_nm + '\'' +
                ", rep_img='" + rep_img + '\'' +
                ", cate_rep_img='" + cate_rep_img + '\'' +
                ", avg_ascr=" + avg_ascr +
                ", revw_ncnt=" + revw_ncnt +
                ", inv_qty=" + inv_qty +
                ", new_yn='" + new_yn + '\'' +
                ", prod_stus='" + prod_stus + '\'' +
                ", opt_yn='" + opt_yn + '\'' +
                ", prod_desc='" + prod_desc + '\'' +
                ", dc_yn='" + dc_yn + '\'' +
                ", mai_yn='" + mai_yn + '\'' +
                ", fgift_yn='" + fgift_yn + '\'' +
                ", upd_dtm=" + upd_dtm +
                ", reg_dtm=" + reg_dtm +
                ", notice='" + notice + '\'' +
                ", sle_bgn_dtm=" + sle_bgn_dtm +
                ", sle_end_dtm=" + sle_end_dtm +
                ", inv_loc='" + inv_loc + '\'' +
                ", safe_inv=" + safe_inv +
                ", inv_stus_cd='" + inv_stus_cd + '\'' +
                ", fst_reg_dtm=" + fst_reg_dtm +
                ", fst_regr_dcmt_no='" + fst_regr_dcmt_no + '\'' +
                ", last_upd_dtm=" + last_upd_dtm +
                ", last_updr_dcmt_no='" + last_updr_dcmt_no + '\'' +
                ", cate_nm='" + cate_nm + '\'' +
                ", cate_desc='" + cate_desc + '\'' +
                ", parent_id='" + parent_id + '\'' +
                ", cate_stus='" + cate_stus + '\'' +
                '}';
    }
}