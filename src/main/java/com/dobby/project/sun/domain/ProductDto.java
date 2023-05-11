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

    public ProductDto() {
    }

    public ProductDto(Integer prod_id, String cate_cd, Integer amt, String prod_nm, String rep_img, Integer avg_ascr, Integer revw_ncnt, Integer inv_qty, String new_yn, String prod_stus, String opt_yn, String prod_desc, String dc_yn, String mai_yn, String fgift_yn, Date upd_dtm, Date reg_dtm) {

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

    @Override
    public String toString() {
        return "ProductDto{" +
                "prod_id=" + prod_id +
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
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ProductDto that = (ProductDto) o;
        return Objects.equals(prod_id, that.prod_id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(prod_id);
    }
}
