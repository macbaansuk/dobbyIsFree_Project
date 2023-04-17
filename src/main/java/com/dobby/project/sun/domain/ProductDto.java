package com.dobby.project.sun.domain;

import java.sql.Date;
import java.util.Objects;


public class ProductDto {
    private Integer prod_id;
    private String cate_cd;
    private Integer amt;
    private String prod_nm;
    private String rep_img;
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
    private String last_updr_dcmt_No;

    public ProductDto() {
    }

    public ProductDto(Integer prod_id, String cate_cd, Integer amt, String prod_nm, String rep_img, Integer avg_ascr, Integer revw_ncnt, Integer inv_qty, String new_yn, String prod_stus, String opt_yn, String prod_desc, String dc_yn, String mai_yn, String fgift_yn, Date upd_dtm, Date reg_dtm, String notice, Date sle_bgn_dtm, Date sle_end_dtm, String inv_loc, Integer safe_inv, String inv_stus_cd, Date fst_reg_dtm, String fst_regr_dcmt_no, Date last_upd_dtm, String last_updr_dcmt_No) {

        this.prod_id = prod_id;
        this.cate_cd = cate_cd;
        this.amt = amt;
        this.prod_nm = prod_nm;
        this.rep_img = rep_img;
        this.avg_ascr = avg_ascr;
        this.revw_ncnt = revw_ncnt;
        this.inv_qty = inv_qty;
        this.new_yn = new_yn;
        this.prod_stus = prod_stus;
        this.opt_yn = opt_yn;
        this.prod_desc = prod_desc;
        this.dc_yn = dc_yn;
        this.mai_yn = mai_yn;
        this.fgift_yn = fgift_yn;
        this.upd_dtm = upd_dtm;
        this.reg_dtm = reg_dtm;
        this.notice = notice;
        this.sle_bgn_dtm = sle_bgn_dtm;
        this.sle_end_dtm = sle_end_dtm;
        this.inv_loc = inv_loc;
        this.safe_inv = safe_inv;
        this.inv_stus_cd = inv_stus_cd;
        this.fst_reg_dtm = fst_reg_dtm;
        this.fst_regr_dcmt_no = fst_regr_dcmt_no;
        this.last_upd_dtm = last_upd_dtm;
        this.last_updr_dcmt_No = last_updr_dcmt_No;
    }

    public Integer getProd_id() {
        return prod_id;
    }

    public void setProd_id(Integer prod_id) {
        this.prod_id = prod_id;
    }

    public String getCate_cd() {
        return cate_cd;
    }

    public void setCate_cd(String cate_cd) {
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

    public String getLast_updr_dcmt_No() {
        return last_updr_dcmt_No;
    }

    public void setLast_updr_dcmt_No(String last_updr_dcmt_No) {
        this.last_updr_dcmt_No = last_updr_dcmt_No;
    }

    @Override
    public String toString() {
        return "ProductDto{" +
                "prod_id='" + prod_id + '\'' +
                ", cate_cd='" + cate_cd + '\'' +
                ", amt=" + amt +
                ", prod_nm='" + prod_nm + '\'' +
                ", rep_img='" + rep_img + '\'' +
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
                ", last_updr_dcmt_No='" + last_updr_dcmt_No + '\'' +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ProductDto that = (ProductDto) o;
        return Objects.equals(prod_id, that.prod_id) && Objects.equals(cate_cd, that.cate_cd) && Objects.equals(prod_nm, that.prod_nm);
    }

    @Override
    public int hashCode() {
        return Objects.hash(prod_id, cate_cd, prod_nm);
    }
}
    // 생성자, getter, setter, toString
