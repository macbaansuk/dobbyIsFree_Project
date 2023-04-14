package com.dobby.project.soo;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Repository
public class NoticeDaoImpl implements NoticeDao {
    @Autowired
    private SqlSession session;
    private static String namespace = "com.dobby.project.NoticeMapper.";

    @Override //게시물 번호로 게시물을 조회
    public NoticeDto select(Integer NB_ID) throws Exception{
        return session.selectOne(namespace+"select",NB_ID);
    }
    @Override //게시물 번호, 작성자로 게시물 삭제// 나중에 String WRTR 추가하기, 관리자 계정(이름)
    public int delete(Integer NB_ID) throws Exception{
//        Map<String, Object> map = new HashMap<String, Object>();
//        map.put("NB_ID",NB_ID);
//        map.put("WRTR",WRTR);
//        return session.delete(namespace+"delete", map);

        return session.delete(namespace+"delete", NB_ID);
    }
    @Override // 게시물 작성
    public int insert(NoticeDto dto) throws Exception{
        return session.insert(namespace+"insert", dto);
    }
    @Override // 게시물 수정
    public int update(NoticeDto dto) throws Exception{
        return session.update(namespace+"update", dto);
    }
    @Override // 게시물별 조회수
    public int increaseViewCnt(Integer NB_ID) throws Exception{
        return session.update(namespace+"increaseViewCnt", NB_ID);
    }
    @Override  // 페이지 단위로 게시물 조회, Map = 페이지번호, 페이지 당 게시물 수
    public List<NoticeDto> selectPage(Map map) throws Exception{
        return session.selectList(namespace+"selectPage",map);
    }
    @Override // 모든 게시물 조회
    public List<NoticeDto> selectAll() throws Exception{
        return session.selectList(namespace+"selectAll");
    }
    @Override // 카테고리별 게시물 조회
    public List<NoticeDto> selectByCate(String BBS_CATE) throws Exception{
        return session.selectList(namespace+"selectByCate",BBS_CATE);
    }
    @Override // 모든 게시물 삭제
    public int deleteAll() {
        return session.delete(namespace + "deleteAll");
    }
    @Override  // 게시물 전체 개수
    public int countAll() throws Exception {
        return session.selectOne(namespace+"countAll");
    }

    @Override  // 카테고리별 게시물 개수
    public int countByCate(String BBS_CATE) throws Exception{
        return session.selectOne(namespace+"countByCate",BBS_CATE);
    }

    @Override // 검색 결과의 총 개수
    public int searchResultCnt(SearchCondition sc) throws Exception {
//        System.out.println("sc in searchResultCnt() = " + sc);
//        System.out.println("session = " + session);
        return session.selectOne(namespace+"searchResultCnt", sc);
    }

    @Override // 검색 결과 목록
    public List<NoticeDto> searchSelectPage(SearchCondition sc) throws Exception {
        return session.selectList(namespace+"searchSelectPage", sc);
    }
}
