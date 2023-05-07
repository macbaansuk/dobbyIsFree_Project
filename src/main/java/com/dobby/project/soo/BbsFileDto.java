package com.dobby.project.soo;

import java.util.Date;

public class BbsFileDto {
    private Integer FILE_ID;
    private String BBS_ID;
    private Integer CNSL_ID;
    private Integer NB_ID;
    private String NM;
    private String PATH;
    private int SIZE;
    private String TYPE;
    private Date REG_DTM;

    public BbsFileDto(){};
    public BbsFileDto(Integer FILE_ID, String BBS_ID, Integer CNSL_ID, Integer NB_ID, String NM, String PATH, int SIZE, String TYPE, Date REG_DTM) {
        this.FILE_ID = FILE_ID;
        this.BBS_ID = BBS_ID;
        this.CNSL_ID = CNSL_ID;
        this.NB_ID = NB_ID;
        this.NM = NM;
        this.PATH = PATH;
        this.SIZE = SIZE;
        this.TYPE = TYPE;
        this.REG_DTM = REG_DTM;
    }

    public Integer getFILE_ID() {
        return FILE_ID;
    }

    public void setFILE_ID(Integer FILE_ID) {
        this.FILE_ID = FILE_ID;
    }

    public String getBBS_ID() {
        return BBS_ID;
    }

    public void setBBS_ID(String BBS_ID) {
        this.BBS_ID = BBS_ID;
    }

    public Integer getCNSL_ID() {
        return CNSL_ID;
    }

    public void setCNSL_ID(Integer CNSL_ID) {
        this.CNSL_ID = CNSL_ID;
    }

    public Integer getNB_ID() {
        return NB_ID;
    }

    public void setNB_ID(Integer NB_ID) {
        this.NB_ID = NB_ID;
    }

    public String getNM() {
        return NM;
    }

    public void setNM(String NM) {
        this.NM = NM;
    }

    public String getPATH() {
        return PATH;
    }

    public void setPATH(String PATH) {
        this.PATH = PATH;
    }

    public int getSIZE() {
        return SIZE;
    }

    public void setSIZE(int SIZE) {
        this.SIZE = SIZE;
    }

    public String getTYPE() {
        return TYPE;
    }

    public void setTYPE(String TYPE) {
        this.TYPE = TYPE;
    }

    public Date getREG_DTM() {
        return REG_DTM;
    }

    public void setREG_DTM(Date REG_DTM) {
        this.REG_DTM = REG_DTM;
    }

    @Override
    public String toString() {
        return "BbsFileDto{" +
                "FILE_ID=" + FILE_ID +
                ", BBS_ID='" + BBS_ID + '\'' +
                ", CNSL_ID=" + CNSL_ID +
                ", NB_ID=" + NB_ID +
                ", NM='" + NM + '\'' +
                ", PATH='" + PATH + '\'' +
                ", SIZE=" + SIZE +
                ", TYPE='" + TYPE + '\'' +
                ", REG_DTM=" + REG_DTM +
                '}';
    }
}
