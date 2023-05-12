package com.dobby.project.sun.domain;

import java.sql.Date;

public class SortDto {


    private Integer prod_dc_id;
    private String prod_nm;
    private Integer cate_cd;
    private Integer prod_id;
    private String dc_typ;
    private Integer dc_rate;
    private Integer dc_amt;
    private Integer dc_price;
    private Date bgn_dtm;
    private Date end_dtm;
    private String dc_stus;
    private Integer amt;
    private String dc_yn;
    private Date upd_dtm;
    private Date reg_dtm;

    private String rep_img;
    private Integer avg_ascr;
    private Integer revw_ncnt;
    private Integer inv_qty;
    private String new_yn;
    private String prod_stus;
    private String opt_yn;
    private String prod_desc;
    private String mai_yn;


    public SortDto() {
    }

    public SortDto(Integer prod_dc_id, String prod_nm, Integer cate_cd, Integer prod_id, String dc_typ, Integer dc_rate, Integer dc_amt, Integer dc_price, Date bgn_dtm, Date end_dtm, String dc_stus, Integer amt, String dc_yn, Date upd_dtm, Date reg_dtm, String rep_img, Integer avg_ascr, Integer revw_ncnt, Integer inv_qty, String new_yn, String prod_stus, String opt_yn, String prod_desc, String mai_yn) {
        this.prod_dc_id = prod_dc_id;
        this.prod_nm = prod_nm;
        this.cate_cd = cate_cd;
        this.prod_id = prod_id;
        this.dc_typ = dc_typ;
        this.dc_rate = dc_rate;
        this.dc_amt = dc_amt;
        this.dc_price = dc_price;
        this.bgn_dtm = bgn_dtm;
        this.end_dtm = end_dtm;
        this.dc_stus = dc_stus;
        this.amt = amt;
        this.dc_yn = dc_yn;
        this.upd_dtm = upd_dtm;
        this.reg_dtm = reg_dtm;
        this.rep_img = rep_img;
        this.avg_ascr = avg_ascr;
        this.revw_ncnt = revw_ncnt;
        this.inv_qty = inv_qty;
        this.new_yn = new_yn;
        this.prod_stus = prod_stus;
        this.opt_yn = opt_yn;
        this.prod_desc = prod_desc;
        this.mai_yn = mai_yn;
    }

    public Integer getProd_dc_id() {
        return prod_dc_id;
    }

    public void setProd_dc_id(Integer prod_dc_id) {
        this.prod_dc_id = prod_dc_id;
    }

    public String getProd_nm() {
        return prod_nm;
    }

    public void setProd_nm(String prod_nm) {
        this.prod_nm = prod_nm;
    }

    public Integer getCate_cd() {
        return cate_cd;
    }

    public void setCate_cd(Integer cate_cd) {
        this.cate_cd = cate_cd;
    }

    public Integer getProd_id() {
        return prod_id;
    }

    public void setProd_id(Integer prod_id) {
        this.prod_id = prod_id;
    }

    public String getDc_typ() {
        return dc_typ;
    }

    public void setDc_typ(String dc_typ) {
        this.dc_typ = dc_typ;
    }

    public Integer getDc_rate() {
        return dc_rate;
    }

    public void setDc_rate(Integer dc_rate) {
        this.dc_rate = dc_rate;
    }

    public Integer getDc_amt() {
        return dc_amt;
    }

    public void setDc_amt(Integer dc_amt) {
        this.dc_amt = dc_amt;
    }

    public Integer getDc_price() {
        return dc_price;
    }

    public void setDc_price(Integer dc_price) {
        this.dc_price = dc_price;
    }

    public Date getBgn_dtm() {
        return bgn_dtm;
    }

    public void setBgn_dtm(Date bgn_dtm) {
        this.bgn_dtm = bgn_dtm;
    }

    public Date getEnd_dtm() {
        return end_dtm;
    }

    public void setEnd_dtm(Date end_dtm) {
        this.end_dtm = end_dtm;
    }

    public String getDc_stus() {
        return dc_stus;
    }

    public void setDc_stus(String dc_stus) {
        this.dc_stus = dc_stus;
    }

    public Integer getAmt() {
        return amt;
    }

    public void setAmt(Integer amt) {
        this.amt = amt;
    }

    public String getDc_yn() {
        return dc_yn;
    }

    public void setDc_yn(String dc_yn) {
        this.dc_yn = dc_yn;
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

    public String getMai_yn() {
        return mai_yn;
    }

    public void setMai_yn(String mai_yn) {
        this.mai_yn = mai_yn;
    }


    @Override
    public String toString() {
        return "SortDto{" +
                "prod_dc_id=" + prod_dc_id +
                ", prod_nm='" + prod_nm + '\'' +
                ", cate_cd=" + cate_cd +
                ", prod_id=" + prod_id +
                ", dc_typ='" + dc_typ + '\'' +
                ", dc_rate=" + dc_rate +
                ", dc_amt=" + dc_amt +
                ", dc_price=" + dc_price +
                ", bgn_dtm=" + bgn_dtm +
                ", end_dtm=" + end_dtm +
                ", dc_stus='" + dc_stus + '\'' +
                ", amt=" + amt +
                ", dc_yn='" + dc_yn + '\'' +
                ", upd_dtm=" + upd_dtm +
                ", reg_dtm=" + reg_dtm +
                ", rep_img='" + rep_img + '\'' +
                ", avg_ascr=" + avg_ascr +
                ", revw_ncnt=" + revw_ncnt +
                ", inv_qty=" + inv_qty +
                ", new_yn='" + new_yn + '\'' +
                ", prod_stus='" + prod_stus + '\'' +
                ", opt_yn='" + opt_yn + '\'' +
                ", prod_desc='" + prod_desc + '\'' +
                ", mai_yn='" + mai_yn + '\'' +
                '}';
    }
}