package com.dobby.project.soo;
import java.util.List;
import java.util.Map;

public interface CounselDao {

    MemberDto selectFromMember(String MBR_ID) throws Exception; // 1:1 상담 작성 전 회원 조회
    void insertCounsel(CounselDto counselDto) throws Exception; // 1:1 상담 작성
    List<ProdDto> selectProdList(Map map) throws Exception; // 문의 제품 목록
    int countAllCounsel() throws Exception; // 1:1 상담 총 개수
    int countCounselByMember(String MBR_ID) throws Exception; // 회원별  1:1 상담 총 개수
    int countProd() throws Exception;   // 상품 총 개수
    void insertFile(BbsFileDto bbsFileDto) throws Exception; // 1:1 상담 첨부파일
//    List<BbsFileDto> insertFile(Map map) throws Exception;
    List<CounselDto> selectListByMemberId(Map map); // 회원별 1:1 상담 목록 불러오기 (COUNSEL+ANSWER JOIN)
    AnswerDto selectAnswerByCnsldId(int CNSL_ID); // 1:1 상담 답변 불러오기
}
