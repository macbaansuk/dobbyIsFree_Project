package com.dobby.project.sun.domain;

import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

public class ProductFileDto {

    private Integer prod_file_id;
    private Integer prod_id;
    private String file_nm;
    private String path;
    private String kind;
    private Date reg_dtm;
    private Date upd_dtm;


    public Integer getProd_file_id() {
        return prod_file_id;
    }

    public void setProd_file_id(Integer prod_file_id) {
        this.prod_file_id = prod_file_id;
    }

    public Integer getProd_id() {
        return prod_id;
    }

    public void setProd_id(Integer prod_id) {
        this.prod_id = prod_id;
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

    public Date getReg_dtm() {
        return reg_dtm;
    }

    public void setReg_dtm(Date reg_dtm) {
        this.reg_dtm = reg_dtm;
    }

    public Date getUpd_dtm() {
        return upd_dtm;
    }

    public void setUpd_dtm(Date upd_dtm) {
        this.upd_dtm = upd_dtm;
    }

    @Override
    public String toString() {
        return "ProductFileDto{" +
                "prod_file_id=" + prod_file_id +
                ", prod_id=" + prod_id +
                ", file_nm='" + file_nm + '\'' +
                ", path='" + path + '\'' +
                ", kind='" + kind + '\'' +
                ", reg_dtm=" + reg_dtm +
                ", upd_dtm=" + upd_dtm +
                '}';
    }
}
