package com.dobby.project.soo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Repository
public class CounselServiceImpl implements CounselService {
    @Autowired
    private CounselDao counselDao;

    @Override // 1:1 상담 작성 전 회원 조회
    public MemberDto getMember(String MBR_ID) throws Exception {
        MemberDto memberDto = counselDao.selectFromMember(MBR_ID);
            return memberDto;
    }
    @Override // 1:1 상담 작성
    public void writeCounsel (CounselDto counselDto) throws Exception {
        counselDao.insertCounsel(counselDto);
    }
    @Override // 문의 제품 목록 불러오기
    public List<ProdDto> getProdList(Map map) throws Exception{
        return counselDao.selectProdList(map);
    }

    @Override // 1:1 상담 총 개수
    public int getCountAllCounsel() throws Exception{
        return counselDao.countAllCounsel();
    }

    @Override // 회원별 1:1 상담 개수
    public int getCountCounselByMember(String MBR_ID) throws Exception{
        return counselDao.countCounselByMember(MBR_ID);
    }

    @Override // 상품 총 개수
    public int getCountProd() throws Exception{
        return counselDao.countProd();
    }

    @Override // 회원별 상담 목록 조회
    public List<CounselDto> getListByMemberId(Map map) throws Exception {
        return counselDao.selectListByMemberId(map);
    }

    @Override   // 답변 조회
    public AnswerDto getAnswerByCnsldId(int CNSL_ID) throws Exception {
        return counselDao.selectAnswerByCnsldId(CNSL_ID);
    }
//    @Transactional
//    public void writeCounsel(CounselDto counselDto, List<BbsFileDto> fileList) throws Exception {
//
//        counselDao.insertCounsel(counselDto);
//        if(fileList != null && fileList.size() > 0) {
//            for(BbsFileDto bbsFileDto : fileList) {
//                counselDao.insertFile(bbsFileDto);
//            }
//        }
//    }

//    @Override
//    public void writeCounsel(CounselDto counselDto, List<BbsFileDto> bbsFileList) throws Exception {
//        // 회원 정보 조회
//        MemberDto memberDto = counselDao.selectFromMember(counselDto.getMBR_ID());
//
//        // 게시물 작성자와 조회된 회원 정보의 일치 여부 확인
//        if (!memberDto.getMBR_ID().equals(counselDto.getMBR_ID())) {
//            throw new Exception("작성자 정보가 일치하지 않습니다.");
//        }
//
//        // 1:1 상담 게시물 작성
//        counselDao.insertCounsel(counselDto);
//
//        // 첨부파일 등록
//        if (bbsFileList != null && !bbsFileList.isEmpty()) {
//            for (BbsFileDto bbsFileDto : bbsFileList) {
//                bbsFileDto.setCNSL_ID(counselDto.getCNSL_ID());
//                counselDao.insertFile(bbsFileDto);
//            }
//        }
//    }



}

