//package com.dobby.project.hoon.domain;
//
//import org.junit.Test;
//
//import static org.junit.Assert.*;
//
//public class PageHandlerTest {
//    @Test
//    public void test() {
//        PageHandler ph = new PageHandler( 250, new invSearchCondition());
//        ph.print();
//        System.out.println("ph = " + ph);
//        assertTrue(ph.getBeginPage() ==1);
//        assertTrue(ph.getEndPage() ==10);
//
//    }
//    @Test
//    public void test2() {
//        PageHandler ph = new PageHandler( 0,  new invSearchCondition());
//        ph.print();
//        System.out.println("ph = " + ph);
//        assertTrue(ph.getBeginPage() ==1);
//        assertTrue(ph.getEndPage() ==1);
//        assertFalse(ph.isShowPrev());
//        assertFalse(ph.isShowNext());
//
//    }
//    @Test
//    public void test3() {
//        PageHandler ph = new PageHandler( null,  new invSearchCondition());
//        ph.print();
//        System.out.println("ph = " + ph);
//        assertTrue(ph.getBeginPage() ==1);
//        assertTrue(ph.getEndPage() ==1);
//        assertFalse(ph.isShowPrev());
//        assertFalse(ph.isShowNext());
//
//    }
//}