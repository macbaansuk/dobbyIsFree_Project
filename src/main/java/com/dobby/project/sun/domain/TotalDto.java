package com.dobby.project.sun.domain;

import java.sql.Date;
import java.util.Objects;

public class TotalDto {
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



    private Integer prod_dc_id;
    private String dc_typ;
    private Integer dc_rate;
    private Integer dc_amt;
    private Integer dc_price;
    private Date bgn_dtm;
    private Date end_dtm;
    private String dc_stus;


    private Integer opt_id;
    private String opt_nm;
    private String opt_val;
    private String opt_stus;


    private Integer hashtag_id;
    private String hashtag_nm;


    private Integer prod_file_id;
    private String file_nm;
    private String path;
    private String kind;




    public TotalDto() {
    }


    public TotalDto(Integer prod_id, String cate_cd, Integer amt, String prod_nm, String rep_img, Integer avg_ascr, Integer revw_ncnt, Integer inv_qty, String new_yn, String prod_stus, String opt_yn, String prod_desc, String dc_yn, String mai_yn, String fgift_yn, Date upd_dtm, Date reg_dtm, String notice, Date sle_bgn_dtm, Date sle_end_dtm, Integer prod_dc_id, String dc_typ, Integer dc_rate, Integer dc_amt, Integer dc_price, Date bgn_dtm, Date end_dtm, String dc_stus, Integer opt_id, String opt_nm, String opt_val, String opt_stus, Integer hashtag_id, String hashtag_nm,Integer prod_file_id, String file_nm, String path, String kind) {

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
        this.prod_dc_id = prod_dc_id;
        this.dc_typ = dc_typ;
        this.dc_rate = dc_rate;
        this.dc_amt = dc_amt;
        this.dc_price = dc_price;
        this.bgn_dtm = bgn_dtm;
        this.end_dtm = end_dtm;
        this.dc_stus = dc_stus;
        this.opt_id = opt_id;
        this.opt_nm = opt_nm;
        this.opt_val = opt_val;
        this.opt_stus = opt_stus;
        this.hashtag_id = hashtag_id;
        this.hashtag_nm = hashtag_nm;
        this.prod_file_id = prod_file_id;
        this.file_nm = file_nm;
        this.path = path;
        this.kind = kind;
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

    public Integer getProd_dc_id() {
        return prod_dc_id;
    }

    public void setProd_dc_id(Integer prod_dc_id) {
        this.prod_dc_id = prod_dc_id;
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

    public Integer getOpt_id() {
        return opt_id;
    }

    public void setOpt_id(Integer opt_id) {
        this.opt_id = opt_id;
    }

    public String getOpt_nm() {
        return opt_nm;
    }

    public void setOpt_nm(String opt_nm) {
        this.opt_nm = opt_nm;
    }

    public String getOpt_val() {
        return opt_val;
    }

    public void setOpt_val(String opt_val) {
        this.opt_val = opt_val;
    }

    public String getOpt_stus() {
        return opt_stus;
    }

    public void setOpt_stus(String opt_stus) {
        this.opt_stus = opt_stus;
    }

    public Integer getHashtag_id() {
        return hashtag_id;
    }

    public void setHashtag_id(Integer hashtag_id) {
        this.hashtag_id = hashtag_id;
    }

    public String getHashtag_nm() {
        return hashtag_nm;
    }

    public void setHashtag_nm(String hashtag_nm) {
        this.hashtag_nm = hashtag_nm;
    }


    public Integer getProd_file_id() {
        return prod_file_id;
    }

    public void setProd_file_id(Integer prod_file_id) {
        this.prod_file_id = prod_file_id;
    }

    public String getFile_nm() {
        return file_nm;
    }

    public void setFile_nm(String file_nm) {
        this.file_nm = file_nm;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    @Override
    public String toString() {
        return "TotalDto{" +
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
                ", notice='" + notice + '\'' +
                ", sle_bgn_dtm=" + sle_bgn_dtm +
                ", sle_end_dtm=" + sle_end_dtm +
                ", prod_dc_id=" + prod_dc_id +
                ", dc_typ='" + dc_typ + '\'' +
                ", dc_rate=" + dc_rate +
                ", dc_amt=" + dc_amt +
                ", dc_price=" + dc_price +
                ", bgn_dtm=" + bgn_dtm +
                ", end_dtm=" + end_dtm +
                ", dc_stus='" + dc_stus + '\'' +
                ", opt_id=" + opt_id +
                ", opt_nm='" + opt_nm + '\'' +
                ", opt_val='" + opt_val + '\'' +
                ", opt_stus='" + opt_stus + '\'' +
                ", hashtag_id=" + hashtag_id +
                ", hashtag_nm='" + hashtag_nm + '\'' +
                "prod_file_id=" + prod_file_id +
                ", file_nm='" + file_nm + '\'' +
                ", path='" + path + '\'' +
                ", kind='" + kind + '\'' +
                '}';
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TotalDto totalDto = (TotalDto) o;
        return Objects.equals(prod_id, totalDto.prod_id);
    }

    @Override
    public int hashCode() {
        return Objects.hash(prod_id);
    }
}
