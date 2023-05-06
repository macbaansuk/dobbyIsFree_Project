package com.dobby.project.hwa.order;

public class MbrDto { //주문 회원정보

    private String MBR_Id;
    private String MBR_NM;
    private String MPNO;
    private String EMAIL;

    public MbrDto(){}

    public MbrDto(String MBR_Id, String MBR_NM, String MPNO, String EMAIL) {
        this.MBR_Id = MBR_Id;
        this.MBR_NM = MBR_NM;
        this.MPNO = MPNO;
        this.EMAIL = EMAIL;
    }

    @Override
    public String toString() {
        return "MbrDto{" +
                "MBR_Id='" + MBR_Id + '\'' +
                ", MBR_NM='" + MBR_NM + '\'' +
                ", MPNO='" + MPNO + '\'' +
                ", EMAIL='" + EMAIL + '\'' +
                '}';
    }

    public String getMBR_Id() {
        return MBR_Id;
    }

    public void setMBR_Id(String MBR_Id) {
        this.MBR_Id = MBR_Id;
    }

    public String getMBR_NM() {
        return MBR_NM;
    }

    public void setMBR_NM(String MBR_NM) {
        this.MBR_NM = MBR_NM;
    }

    public String getMPNO() {
        return MPNO;
    }

    public void setMPNO(String MPNO) {
        this.MPNO = MPNO;
    }

    public String getEMAIL() {
        return EMAIL;
    }

    public void setEMAIL(String EMAIL) {
        this.EMAIL = EMAIL;
    }



}
