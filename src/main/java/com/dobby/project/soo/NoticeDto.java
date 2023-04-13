package com.dobby.project.soo;

import java.util.Date;
import java.util.Objects;

    public class NoticeDto {
        private Integer NB_ID;
        private String BBS_ID;
        private String BBS_CATE;
        private String TTL;
        private String CN;
        private String WRTR;
        private Date REG_DTM;
        private Date UPD_DTM;
        private Date DEL_DTM;
        private int VIEWS;
        private String STUS;
        private Date FST_REG_DTM;
        private String FST_REGR_DCMT_NO;
        private Date LAST_UPD_DTM;
        private String LAST_UPD_DCMT_NO;


        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;
            NoticeDto noticeDto = (NoticeDto) o;
            return Objects.equals(NB_ID, noticeDto.NB_ID) && Objects.equals(BBS_ID, noticeDto.BBS_ID) && Objects.equals(BBS_CATE, noticeDto.BBS_CATE) && Objects.equals(TTL, noticeDto.TTL) && Objects.equals(CN, noticeDto.CN) && Objects.equals(WRTR, noticeDto.WRTR);
        }

        @Override
        public int hashCode() {
            return Objects.hash(NB_ID, BBS_ID, BBS_CATE, TTL, CN, WRTR);
        }


//        public NoticeDto() {this("","","");}
//        public NoticeDto(String TTL, String CN, String WRTR) {
//
//            this.TTL = TTL;
//            this.CN = CN;
//            this.WRTR = WRTR;
//
//        }
    public NoticeDto() {
        this("", "", "", "","");
    }
            public NoticeDto(String BBS_CATE, String TTL, String CN, String WRTR, String STUS){

                this.BBS_CATE = BBS_CATE;
                this.TTL = TTL;
                this.CN = CN;
                this.WRTR = WRTR;
                this.STUS = STUS;

        }



        public NoticeDto(Integer NB_ID) { this.NB_ID = NB_ID; }

        public Integer getNB_ID() {
            return NB_ID;
        }

        public void setNB_ID(Integer NB_ID) {
            this.NB_ID = NB_ID;
        }

        public String getBBS_ID() {
            return BBS_ID;
        }

        public void setBBS_ID(String BBS_ID) {
            this.BBS_ID = BBS_ID;
        }

        public String getBBS_CATE() {
            return BBS_CATE;
        }

        public void setBBS_CATE(String BBS_CATE) {
            this.BBS_CATE = BBS_CATE;
        }

        public String getTTL() {
            return TTL;
        }

        public void setTTL(String TTL) {
            this.TTL = TTL;
        }

        public String getCN() {
            return CN;
        }

        public void setCN(String CN) {
            this.CN = CN;
        }

        public String getWRTR() { return WRTR; }

        public void setWRTR(String WRTR) {
            this.WRTR = WRTR;
        }

        public Date getREG_DTM() {
            return REG_DTM;
        }

        public void setREG_DTM(Date REG_DTM) {
            this.REG_DTM = REG_DTM;
        }

        public Date getUPD_DTM() {
            return UPD_DTM;
        }

        public void setUPD_DTM(Date UPD_DTM) {
            this.UPD_DTM = UPD_DTM;
        }

        public Date getDEL_DTM() {
            return DEL_DTM;
        }

        public void setDEL_DTM(Date DEL_DTM) {
            this.DEL_DTM = DEL_DTM;
        }

        public int getVIEWS() {
            return VIEWS;
        }

        public void setVIEWS(int VIEWS) {
            this.VIEWS = VIEWS;
        }

        public String getSTUS() { return STUS; }

        public void setSTUS(String STUS) {
            this.STUS = STUS;
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

        public String getLAST_UPD_DCMT_NO() {
            return LAST_UPD_DCMT_NO;
        }

        public void setLAST_UPD_DCMT_NO(String LAST_UPD_DCMT_NO) {
            this.LAST_UPD_DCMT_NO = LAST_UPD_DCMT_NO;
        }


        @Override
        public String toString() {
            return "NoticeDto{" +
                    "NB_ID=" + NB_ID +
                    ", BBS_ID='" + BBS_ID + '\'' +
                    ", BBS_CATE='" + BBS_CATE + '\'' +
                    ", TTL='" + TTL + '\'' +
                    ", CN='" + CN + '\'' +
                    ", WRTR='" + WRTR + '\'' +
                    ", REG_DTM=" + REG_DTM +
                    ", UPD_DTM=" + UPD_DTM +
                    ", DEL_DTM=" + DEL_DTM +
                    ", VIEWS=" + VIEWS +
                    ", STUS='" + STUS + '\'' +
                    ", FST_REG_DTM=" + FST_REG_DTM +
                    ", FST_REGR_DCMT_NO='" + FST_REGR_DCMT_NO + '\'' +
                    ", LAST_UPD_DTM=" + LAST_UPD_DTM +
                    ", LAST_UPD_DCMT_NO='" + LAST_UPD_DCMT_NO + '\'' +
                    '}';
        }
    }


