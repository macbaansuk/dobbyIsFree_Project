package com.dobby.project.hoon.dao;

import com.dobby.project.hoon.domain.InvDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.*;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class InvDaoImplTest {

    @Autowired
    InvDao invDao;

    @Test
    public void insertTestData () throws Exception {
        invDao.deleteAll();
        for (int i = 1; i <=250 ; i++) {
            InvDto invDto = new InvDto(0, "11002", 28000, "스킨로션" + i, "", 4, 15, 120, "N", "판매중", "Y", "올인원 미니 스킨로션", "N", 0, "Y", "N", new Date(), new Date(), "최신 제품입니다.", new Date(), new Date(), "창고 1(3A-14)", 100, "여유", new Date(), "Dobby", new Date(), "Dobby");
            invDao.insert(invDto);
        }
    }
    @Test
    public void countTest() throws Exception {
        invDao.deleteAll();
        assertTrue(invDao.count()==0);

        InvDto invDto = new InvDto(0, "12001", 31000, "상품명", "", 0, 0, 0, "N", " ", "N", " ", "N", 0, "N", "N", new Date(), new Date(), " ", new Date(), new Date(), " ", 0, " ", new Date(), " ", new Date(), " ");
        assertTrue(invDao.insert(invDto)==1);
        assertTrue(invDao.count()==1);

        assertTrue(invDao.insert(invDto)==1);
        assertTrue(invDao.count()==2);
    }

    @Test
    public void deleteAllTest() throws Exception {
        invDao.deleteAll();
        assertTrue(invDao.count()==0);

        InvDto invDto = new InvDto(0, "12001", 31000, "상품명", "", 0, 0, 0, "N", " ", "N", " ", "N", 0, "N", "N", new Date(), new Date(), " ", new Date(), new Date(), " ", 0, " ", new Date(), " ", new Date(), " ");
        assertTrue(invDao.insert(invDto)==1);
        assertTrue(invDao.deleteAll()==1);
        assertTrue(invDao.count()==0);

        invDto = new InvDto(0, "12001", 31000, "상품명", "", 0, 0, 0, "N", " ", "N", " ", "N", 0, "N", "N", new Date(), new Date(), " ", new Date(), new Date(), " ", 0, " ", new Date(), " ", new Date(), " ");
        assertTrue(invDao.insert(invDto)==1);
        assertTrue(invDao.insert(invDto)==1);
        assertTrue(invDao.deleteAll()==2);
        assertTrue(invDao.count()==0);
    }

    @Test
    public void deleteTest() throws Exception {
        invDao.deleteAll();
        assertTrue(invDao.count()==0);

        InvDto invDto = new InvDto(0, "12001", 31000, "상품명", "", 0, 0, 0, "N", " ", "N", " ", "N", 0, "N", "N", new Date(), new Date(), " ", new Date(), new Date(), " ", 0, " ", new Date(), " ", new Date(), " ");
        assertTrue(invDao.insert(invDto)==1);
        Integer PROD_ID = invDao.selectAll().get(0).getPROD_ID();
        assertTrue(invDao.delete(PROD_ID, invDto.getPROD_NM())==1);
        assertTrue(invDao.count()==0);

        assertTrue(invDao.insert(invDto)==1);
        PROD_ID = invDao.selectAll().get(0).getPROD_ID();
        assertTrue(invDao.delete(PROD_ID, invDto.getPROD_NM()+"222")==0);
        assertTrue(invDao.count()==1);

        assertTrue(invDao.delete(PROD_ID, invDto.getPROD_NM())==1);
        assertTrue(invDao.count()==0);

        assertTrue(invDao.insert(invDto)==1);
        PROD_ID = invDao.selectAll().get(0).getPROD_ID();
        assertTrue(invDao.delete(PROD_ID+1, invDto.getPROD_NM())==0);
        assertTrue(invDao.count()==1);
    }

    @Test
    public void insertTest() throws Exception {
        invDao.deleteAll();
        InvDto invDto = new InvDto(0, "12001", 31000, "상품명", "", 0, 0, 0, "N", " ", "N", " ", "N", 0, "N", "N", new Date(), new Date(), " ", new Date(), new Date(), " ", 0, " ", new Date(), " ", new Date(), " ");
        assertTrue(invDao.insert(invDto)==1);

         invDto = new InvDto(0, "12001", 31000, "상품명", "", 0, 0, 0, "N", " ", "N", " ", "N", 0, "N", "N", new Date(), new Date(), " ", new Date(), new Date(), " ", 0, " ", new Date(), " ", new Date(), " ");
        assertTrue(invDao.insert(invDto)==1);
        assertTrue(invDao.count()==2);

        invDao.deleteAll();
         invDto = new InvDto(0, "12001", 31000, "상품명", "", 0, 0, 0, "N", " ", "N", " ", "N", 0, "N", "N", new Date(), new Date(), " ", new Date(), new Date(), " ", 0, " ", new Date(), " ", new Date(), " ");
        assertTrue(invDao.insert(invDto)==1);
        assertTrue(invDao.count()==1);
    }

    @Test
    public void selectAllTest() throws Exception {
        invDao.deleteAll();
        assertTrue(invDao.count()==0);

        List<InvDto> list = invDao.selectAll();
        assertTrue(list.size() == 0);

        InvDto invDto = new InvDto(0, "12001", 31000, "상품명", "", 0, 0, 0, "N", " ", "N", " ", "N", 0, "N", "N", new Date(), new Date(), " ", new Date(), new Date(), " ", 0, " ", new Date(), " ", new Date(), " ");
        assertTrue(invDao.insert(invDto)==1);

        list = invDao.selectAll();
        assertTrue(list.size() == 1);

        assertTrue(invDao.insert(invDto)==1);
        list = invDao.selectAll();
        assertTrue(list.size() == 2);
    }

    @Test
    public void selectTest() throws Exception {
        invDao.deleteAll();
        assertTrue(invDao.count()==0);
        InvDto invDto = new InvDto(0, "12001", 31000, "상품명", "", 0, 0, 0, "N", " ", "N", " ", "N", 0, "N", "N", new Date(), new Date(), " ", new Date(), new Date(), " ", 0, " ", new Date(), " ", new Date(), " ");
        assertTrue(invDao.insert(invDto)==1);
//
        Integer PROD_ID = invDao.selectAll().get(0).getPROD_ID();
        invDto.setPROD_ID(PROD_ID);
        InvDto invDto2 = invDao.select(PROD_ID);
        System.out.println("invDto2 = " + invDto2);
        System.out.println("InvDto = " + invDto);
        assertTrue(invDto.equals(invDto2));
    }

    @Test
    public void selectPageTest() throws Exception {
        invDao.deleteAll();

        for (int i = 1; i <= 10; i++) {
            InvDto invDto = new InvDto(0, "11002", 28000, "스킨로션" + i, "", 4, 15, 120, "N", "판매중", "Y", "올인원 미니 스킨로션", "N", 0, "Y", "N", new Date(), new Date(), "최신 제품입니다.", new Date(), new Date(), "창고 1(3A-14)", 100, "여유", new Date(), "Dobby", new Date(), "Dobby");
            invDao.insert(invDto);
        }

        Map map = new HashMap();
        map.put("offset", 0);
        map.put("pageSize", 3);

        List<InvDto> list = invDao.selectPage(map);
        assertTrue(list.get(0).getPROD_NM().equals("스킨로션10"));
        assertTrue(list.get(1).getPROD_NM().equals("스킨로션9"));
        assertTrue(list.get(2).getPROD_NM().equals("스킨로션8"));

        map = new HashMap();
        map.put("offset", 0);
        map.put("pageSize", 1);

        list = invDao.selectPage(map);
        assertTrue(list.get(0).getPROD_NM().equals("스킨로션10"));

        map = new HashMap();
        map.put("offset", 7);
        map.put("pageSize", 3);

        list = invDao.selectPage(map);
        assertTrue(list.get(0).getPROD_NM().equals("스킨로션3"));
        assertTrue(list.get(1).getPROD_NM().equals("스킨로션2"));
        assertTrue(list.get(2).getPROD_NM().equals("스킨로션1"));
    }

    @Test
    public void updateTest() throws Exception {
        invDao.deleteAll();
        InvDto invDto = new InvDto(0, "12001", 31000, "상품명", "", 0, 0, 0, "N", " ", "N", " ", "N", 0, "N", "N", new Date(), new Date(), " ", new Date(), new Date(), " ", 0, " ", new Date(), " ", new Date(), " ");
        assertTrue(invDao.insert(invDto)==1);

        Integer PROD_ID = invDao.selectAll().get(0).getPROD_ID();
        System.out.println("PROD_ID = " + PROD_ID);
        invDto.setPROD_ID(PROD_ID);
        invDto.setPROD_NM("변경된 상품명");
        assertTrue(invDao.update(invDto)==1);

        InvDto invDto2 = invDao.select(PROD_ID);
        assertTrue(invDto.equals(invDto2));
    }

//    @Test
//    public void increaseViewCntTest() throws Exception {
//        invDao.deleteAll();
//        assertTrue(invDao.count()==0);
//
//        InvDto invDto = new InvDto(1, "12001", 31000, "상품명", "", 0, 0, 0, "N", " ", "N", " ", "N", 0, "N", "N", new Date(), new Date(), " ", new Date(), new Date(), " ", 0, " ", new Date(), " ", new Date(), " ");
//        assertTrue(invDao.insert(InvDto)==1);
//        assertTrue(invDao.count()==1);
//
//        Integer PROD_ID = invDao.selectAll().get(0).getPROD_ID();
//        assertTrue(invDao.increaseViewCnt(PROD_ID)==1);
//
//        InvDto = invDao.select(PROD_ID);
//        assertTrue(InvDto!=null);
//        assertTrue(InvDto.getView_cnt() == 1);
//
//        assertTrue(invDao.increaseViewCnt(PROD_ID)==1);
//        InvDto = invDao.select(PROD_ID);
//        assertTrue(InvDto!=null);
//        assertTrue(InvDto.getView_cnt() == 2);
//    }
}