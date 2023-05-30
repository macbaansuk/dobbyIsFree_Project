package com.dobby.project.order.dto;

public class OrderDone { // 주문 상품제외 주문 정보

    private String  inputOrdId; //주문아이디
    private String  inputOrdNmTxt; //주문자명
    private String  inputOrdMblNo;  //주문자연락처
    private String  inputEmailTxt;  //주문자이메일
    private String  inputRcvNmTxt ;  //수령자명
    private String  inputMblNoVal ; //수령자번호
    private String  inputDlvNmTxt;  //배송지명
    private String  inputOrdzipTxt ;  //우편번호
    private String  inputDlvAddr1stTxt; //기본주소
    private String  inputDlvAddr2ndTxt ; //상세주소
    private String  inputDlvReqCntTxt; //배송요청사항
    private String  inputBank; //은행
    private String  inputTempAccNo; //계좌번호
    private String  inputTempDpoSiTr; //예금주
    private Integer  inputTotPrdPrcTxt; // 주문금액
    private Integer  inputTotPurPrcTxt; //결제금액
    private Integer  inputTotDcCpnPrcTxt; //할인금액
    private Integer  inputTotReservePtTxt; //적립금
    private Integer  inputTotPurDlvPrcTxt; //배송비


    public OrderDone(){}

    public OrderDone(String inputOrdId, String inputOrdNmTxt, String inputOrdMblNo, String inputEmailTxt, String inputRcvNmTxt,
                     String inputMblNoVal, String inputDlvNmTxt, String inputOrdzipTxt, String inputDlvAddr1stTxt,
                     String inputDlvAddr2ndTxt, String inputDlvReqCntTxt, String inputBank, String inputTempAccNo, String inputTempDpoSiTr,
                     Integer inputTotPrdPrcTxt, Integer inputTotPurPrcTxt, Integer inputTotDcCpnPrcTxt, Integer inputTotReservePtTxt,
                     Integer inputTotPurDlvPrcTxt) {
        this.inputOrdId = inputOrdId;
        this.inputOrdNmTxt = inputOrdNmTxt;
        this.inputOrdMblNo = inputOrdMblNo;
        this.inputEmailTxt = inputEmailTxt;
        this.inputRcvNmTxt = inputRcvNmTxt;
        this.inputMblNoVal = inputMblNoVal;
        this.inputDlvNmTxt = inputDlvNmTxt;
        this.inputOrdzipTxt = inputOrdzipTxt;
        this.inputDlvAddr1stTxt = inputDlvAddr1stTxt;
        this.inputDlvAddr2ndTxt = inputDlvAddr2ndTxt;
        this.inputDlvReqCntTxt = inputDlvReqCntTxt;
        this.inputBank = inputBank;
        this.inputTempAccNo = inputTempAccNo;
        this.inputTempDpoSiTr = inputTempDpoSiTr;
        this.inputTotPrdPrcTxt = inputTotPrdPrcTxt;
        this.inputTotPurPrcTxt = inputTotPurPrcTxt;
        this.inputTotDcCpnPrcTxt = inputTotDcCpnPrcTxt;
        this.inputTotReservePtTxt = inputTotReservePtTxt;
        this.inputTotPurDlvPrcTxt = inputTotPurDlvPrcTxt;
    }

    @Override
    public String toString() {
        return "OrderDone{" +
                "inputOrdId='" + inputOrdId + '\'' +
                ", inputOrdNmTxt='" + inputOrdNmTxt + '\'' +
                ", inputOrdMblNo='" + inputOrdMblNo + '\'' +
                ", inputEmailTxt='" + inputEmailTxt + '\'' +
                ", inputRcvNmTxt='" + inputRcvNmTxt + '\'' +
                ", inputMblNoVal='" + inputMblNoVal + '\'' +
                ", inputDlvNmTxt='" + inputDlvNmTxt + '\'' +
                ", inputOrdzipTxt='" + inputOrdzipTxt + '\'' +
                ", inputDlvAddr1stTxt='" + inputDlvAddr1stTxt + '\'' +
                ", inputDlvAddr2ndTxt='" + inputDlvAddr2ndTxt + '\'' +
                ", inputDlvReqCntTxt='" + inputDlvReqCntTxt + '\'' +
                ", inputBank='" + inputBank + '\'' +
                ", inputTempAccNo='" + inputTempAccNo + '\'' +
                ", inputTempDpoSiTr='" + inputTempDpoSiTr + '\'' +
                ", inputTotPrdPrcTxt=" + inputTotPrdPrcTxt +
                ", inputTotPurPrcTxt=" + inputTotPurPrcTxt +
                ", inputTotDcCpnPrcTxt=" + inputTotDcCpnPrcTxt +
                ", inputTotReservePtTxt=" + inputTotReservePtTxt +
                ", inputTotPurDlvPrcTxt=" + inputTotPurDlvPrcTxt +
                '}';
    }

    public String getInputOrdId() {
        return inputOrdId;
    }

    public void setInputOrdId(String inputOrdId) {
        this.inputOrdId = inputOrdId;
    }

    public String getInputOrdNmTxt() {
        return inputOrdNmTxt;
    }

    public void setInputOrdNmTxt(String inputOrdNmTxt) {
        this.inputOrdNmTxt = inputOrdNmTxt;
    }

    public String getInputOrdMblNo() {
        return inputOrdMblNo;
    }

    public void setInputOrdMblNo(String inputOrdMblNo) {
        this.inputOrdMblNo = inputOrdMblNo;
    }

    public String getInputEmailTxt() {
        return inputEmailTxt;
    }

    public void setInputEmailTxt(String inputEmailTxt) {
        this.inputEmailTxt = inputEmailTxt;
    }

    public String getInputRcvNmTxt() {
        return inputRcvNmTxt;
    }

    public void setInputRcvNmTxt(String inputRcvNmTxt) {
        this.inputRcvNmTxt = inputRcvNmTxt;
    }

    public String getInputMblNoVal() {
        return inputMblNoVal;
    }

    public void setInputMblNoVal(String inputMblNoVal) {
        this.inputMblNoVal = inputMblNoVal;
    }

    public String getInputDlvNmTxt() {
        return inputDlvNmTxt;
    }

    public void setInputDlvNmTxt(String inputDlvNmTxt) {
        this.inputDlvNmTxt = inputDlvNmTxt;
    }

    public String getInputOrdzipTxt() {
        return inputOrdzipTxt;
    }

    public void setInputOrdzipTxt(String inputOrdzipTxt) {
        this.inputOrdzipTxt = inputOrdzipTxt;
    }

    public String getInputDlvAddr1stTxt() {
        return inputDlvAddr1stTxt;
    }

    public void setInputDlvAddr1stTxt(String inputDlvAddr1stTxt) {
        this.inputDlvAddr1stTxt = inputDlvAddr1stTxt;
    }

    public String getInputDlvAddr2ndTxt() {
        return inputDlvAddr2ndTxt;
    }

    public void setInputDlvAddr2ndTxt(String inputDlvAddr2ndTxt) {
        this.inputDlvAddr2ndTxt = inputDlvAddr2ndTxt;
    }

    public String getInputDlvReqCntTxt() {
        return inputDlvReqCntTxt;
    }

    public void setInputDlvReqCntTxt(String inputDlvReqCntTxt) {
        this.inputDlvReqCntTxt = inputDlvReqCntTxt;
    }

    public String getInputBank() {
        return inputBank;
    }

    public void setInputBank(String inputBank) {
        this.inputBank = inputBank;
    }

    public String getInputTempAccNo() {
        return inputTempAccNo;
    }

    public void setInputTempAccNo(String inputTempAccNo) {
        this.inputTempAccNo = inputTempAccNo;
    }

    public String getInputTempDpoSiTr() {
        return inputTempDpoSiTr;
    }

    public void setInputTempDpoSiTr(String inputTempDpoSiTr) {
        this.inputTempDpoSiTr = inputTempDpoSiTr;
    }

    public Integer getInputTotPrdPrcTxt() {
        return inputTotPrdPrcTxt;
    }

    public void setInputTotPrdPrcTxt(Integer inputTotPrdPrcTxt) {
        this.inputTotPrdPrcTxt = inputTotPrdPrcTxt;
    }

    public Integer getInputTotPurPrcTxt() {
        return inputTotPurPrcTxt;
    }

    public void setInputTotPurPrcTxt(Integer inputTotPurPrcTxt) {
        this.inputTotPurPrcTxt = inputTotPurPrcTxt;
    }

    public Integer getInputTotDcCpnPrcTxt() {
        return inputTotDcCpnPrcTxt;
    }

    public void setInputTotDcCpnPrcTxt(Integer inputTotDcCpnPrcTxt) {
        this.inputTotDcCpnPrcTxt = inputTotDcCpnPrcTxt;
    }

    public Integer getInputTotReservePtTxt() {
        return inputTotReservePtTxt;
    }

    public void setInputTotReservePtTxt(Integer inputTotReservePtTxt) {
        this.inputTotReservePtTxt = inputTotReservePtTxt;
    }

    public Integer getInputTotPurDlvPrcTxt() {
        return inputTotPurDlvPrcTxt;
    }

    public void setInputTotPurDlvPrcTxt(Integer inputTotPurDlvPrcTxt) {
        this.inputTotPurDlvPrcTxt = inputTotPurDlvPrcTxt;
    }
}
