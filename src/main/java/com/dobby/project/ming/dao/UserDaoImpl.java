//package com.dobby.project.ming.dao;
//
//import com.dobby.project.ming.domain.User;
//import org.springframework.beans.factory.annotation.Autowired;
//import javax.sql.DataSource;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.Date;
//
//public class UserDaoImpl implements UserDao {
//    @Autowired
//    DataSource ds;
//    final int FAIL = 0;
//
//    @Override
//    public int deleteUser(String MBR_ID) {
//        int rowCnt = FAIL; //  insert, delete, update
//
//        Connection conn = null;
//        PreparedStatement pstmt = null;
//
//        String sql = "delete from member_info where MBR_ID= ? ";
//
//        try {
//            conn = ds.getConnection();
//            pstmt = conn.prepareStatement(sql);
//            pstmt.setString(1, MBR_ID);
////        int rowCnt = pstmt.executeUpdate(); //  insert, delete, update
////        return rowCnt;
//            return pstmt.executeUpdate(); //  insert, delete, update
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return FAIL;
//        } finally {
//            // close()를 호출하다가 예외가 발생할 수 있으므로, try-catch로 감싸야함.
////            try { if(pstmt!=null) pstmt.close(); } catch (SQLException e) { e.printStackTrace();}
////            try { if(conn!=null)  conn.close();  } catch (SQLException e) { e.printStackTrace();}
//            close(pstmt, conn); //     private void close(AutoCloseable... acs) {
//        }
//    }
//
//    @Override
//    public User selectUser(String MBR_ID) throws Exception {
//        User user = null;
//
//        Connection conn = null;
//        PreparedStatement pstmt = null;
//        ResultSet rs = null;
//
//        String sql = "select * from user_info where MBR_ID= ? ";
//
//        try {
//            conn = ds.getConnection();
//            pstmt = conn.prepareStatement(sql); // SQL Injection공격, 성능향상
//            pstmt.setString(1, MBR_ID);
//
//            rs = pstmt.executeQuery(); //  select
//
//            if (rs.next()) {
//                user = new User();
//                user.setMBR_ID(rs.getString(1));
//                user.setPWD(rs.getString(2));
//                user.setMBR_GRD(rs.getString(3));
//                user.setMBR_TYPE_CD(rs.getString(4));
//                user.setMBR_STUS_CD(rs.getString(5));
//                user.setMBR_NM(rs.getString(6));
//                user.setEMAIL(rs.getString(7));
//                user.setMPNO(rs.getString(8));
//                user.setBD(new Date(rs.getTimestamp(9).getTime()));
//                user.setSEX(rs.getString(10));
//                user.setADDR_ID(rs.getString(11));
//                user.setMBR_PT(rs.getInt(12));
//                user.setMBR_COUPN(rs.getString(13));
//                user.setCOMMENT(rs.getString(14));
//                user.setMBR_SNS(rs.getString(15));
//                user.setSNS_DTM(new Date(rs.getTimestamp(16).getTime()));
//                user.setSNS_YN(rs.getString(17));
//                user.setSUBS_DTM(new Date(rs.getTimestamp(18).getTime()));
//                user.setMBR_GRD_DTM(new Date(rs.getTimestamp(19).getTime()));
//                user.setCONN_TMS(rs.getString(20));
//                user.setLAST_LOGIN_DTM(new Date(rs.getTimestamp(21).getTime()));
//                user.setFST_REG_DTM(new Date(rs.getTimestamp(22).getTime()));
//                user.setFST_REGR_DCMT_NO(rs.getString(23));
//                user.setLAST_UPD_DTM(new Date(rs.getTimestamp(24).getTime()));
//                user.setLAST_UPDR_DCMT_NO(rs.getString(25));
//            }
//        } catch (SQLException e) {
//            return null;
//        } finally {
//            // close()를 호출하다가 예외가 발생할 수 있으므로, try-catch로 감싸야함.
//            // close()의 호출순서는 생성된 순서의 역순
////            try { if(rs!=null)    rs.close();    } catch (SQLException e) { e.printStackTrace();}
////            try { if(pstmt!=null) pstmt.close(); } catch (SQLException e) { e.printStackTrace();}
////            try { if(conn!=null)  conn.close();  } catch (SQLException e) { e.printStackTrace();}
//            close(rs, pstmt, conn);  //     private void close(AutoCloseable... acs) {
//        }
//
//        return user;
//    }
//
//    // 사용자 정보를 user_info테이블에 저장하는 메서드
//    @Override
//    public int insertUser(User user) {
//        int rowCnt = FAIL;
//
//        Connection conn = null;
//        PreparedStatement pstmt = null;
//
//        //insert into member_info (MBR_ID, PWD, MBR_GRD, MBR_TYPE_CD, MBR_STUS_CD, MBR_NM, EMAIL, MPNO, BD, SEX, SNS_YN, SUBS_DTM, MBR_GRD_DTM)
//        //values ('test_hwa', '5555', '웰컴', '2', '1', '테스트계정5', 'hwahwa@naver.com', '010-1234-1234', '1995-08-12', 'F', 'N', NOW(), NOW());
//
//        String sql = "insert into member_info values (?, ?, ?, ?, ?, ?, ?, ?, new Date(), ?, ?, new Date(), new Date()) ";
//
//        try {
//            conn = ds.getConnection();
//            pstmt = conn.prepareStatement(sql); // SQL Injection공격, 성능향상
//            pstmt.setString(1,user.getMBR_ID());
//            pstmt.setString(2,user.getPWD());
//            pstmt.setString(3,user.getMBR_GRD());
//            pstmt.setString(4,user.getMBR_TYPE_CD());
//            pstmt.setString(5,user.getMBR_STUS_CD());
//            pstmt.setString(6,user.getMBR_NM());
//            pstmt.setString(7,user.getEMAIL());
//            pstmt.setString(8,user.getMPNO());
//            pstmt.setDate(9,new java.sql.Date(user.getBD().getTime()));
//            pstmt.setString(10,user.getSEX());
//            pstmt.setString(11,user.getSNS_YN());
//            pstmt.setDate(12,new java.sql.Date(user.getSUBS_DTM().getTime()));
//            pstmt.setDate(13,new java.sql.Date(user.getMBR_GRD_DTM().getTime()));
//            return pstmt.executeUpdate(); //  insert, delete, update;
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return FAIL;
//        } finally {
//            close(pstmt, conn);  //     private void close(AutoCloseable... acs) {
//        }
//    }
//
//    // 매개변수로 받은 사용자 정보로 user_info테이블을 update하는 메서드
//    @Override
//    public int updateUser(User user) {
//        int rowCnt = FAIL; //  insert, delete, update
//
////        Connection conn = null;
////        PreparedStatement pstmt = null;
//
//        String sql = "update member_info " +
//                "set PWD=?, MBR_GRD=?, MBR_TYPE_CD=?, MBR_STUS_CD=?, MBR_NM =?, EMAIL=?, MPNO=?, BD=?, SEX=?, SNS_YN=?, SUBS_DTM=?, MBR_GRD_DTM=? " +
//                "where MBR_ID = ? ";
//
//        // try-with-resources - since jdk7
//        try (
//                Connection conn = ds.getConnection();
//                PreparedStatement pstmt = conn.prepareStatement(sql); // SQL Injection공격, 성능향상
//        ){
//            pstmt.setString(1,user.getPWD());
//            pstmt.setString(2,user.getMBR_GRD());
//            pstmt.setString(3,user.getMBR_TYPE_CD());
//            pstmt.setString(4,user.getMBR_STUS_CD());
//            pstmt.setString(5,user.getMBR_NM());
//            pstmt.setString(6,user.getEMAIL());
//            pstmt.setString(7,user.getMPNO());
//            pstmt.setDate(8,new java.sql.Date(user.getBD().getTime()));
//            pstmt.setString(9,user.getSEX());
//            // pstmt.setDate(11, new java.sql.Date(user.getSNS_DTM().getTime()));
//            pstmt.setString(10,user.getSNS_YN());
//            pstmt.setDate(11, new java.sql.Date(user.getSUBS_DTM().getTime()));
//            pstmt.setDate(12,new java.sql.Date(user.getMBR_GRD_DTM().getTime()));
//            pstmt.setString(13, user.getMBR_ID());
//
//            rowCnt = pstmt.executeUpdate();
//        } catch (SQLException e) {
//            e.printStackTrace();
//            return FAIL;
//        }
//
//        return rowCnt;
//    }
//
//    public void deleteAll() throws Exception {
//        Connection conn = ds.getConnection();
//
//        String sql = "delete from member_info ";
//
//        PreparedStatement pstmt = conn.prepareStatement(sql); // SQL Injection공격, 성능향상
//        pstmt.executeUpdate(); //  insert, delete, update
//    }
//
//    private void close(AutoCloseable... acs) {
//        for(AutoCloseable ac :acs)
//            try { if(ac!=null) ac.close(); } catch(Exception e) { e.printStackTrace(); }
//    }
//}