package com.dobby.project.ming.dao;

import com.dobby.project.ming.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

//
@Repository
public class UserDaoImpl implements UserDao {
    @Autowired
    DataSource ds;
    final int FAIL=0;

    @Override
    public int deleteUser(String MBR_ID) {
        int rowCnt = FAIL;

        Connection conn = null;
        PreparedStatement pstmt = null;

        String sql = "DELETE FROM member_info WHERE MBR_ID= ? ";

        try {  // try-with-resources - since jdk7
              conn = ds.getConnection();
              System.out.println("ds="+ds);
              System.out.println("conn="+conn);
              pstmt = conn.prepareStatement(sql);
              pstmt.setString(1, MBR_ID);

            return pstmt.executeUpdate(); //  insert, delete, update

        } catch (SQLException e) {
              e.printStackTrace();
              return FAIL;

        } finally {
              close(pstmt, conn);
        }
    }

    @Override
    public User selectUser(String MBR_ID) {
        User user = null;

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM member_info WHERE MBR_ID= ? ";

        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, MBR_ID);

            System.out.println("Select ds="+ds);
            System.out.println("Select conn="+conn);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setMBR_ID(rs.getString(1));
                user.setPWD(rs.getString(2));
                user.setMBR_NM(rs.getString(3));
                user.setEMAIL(rs.getString(4));
                user.setMPNO(rs.getString(5));
                user.setBD(new Date(rs.getTimestamp(6).getTime()));
                user.setSEX(rs.getString(7));
                user.setAGRE_YN(rs.getString(8));
            }
        }   catch (SQLException e) {
            return null;
        }   finally {
            close(rs, pstmt, conn);  //     private void close(AutoCloseable... acs) {
        }
        return user;
    }

    // 사용자 정보를 user_info테이블에 저장하는 메서드
    @Override
    public int insertUser(User user) {
        int rowCnt = FAIL;

        Connection conn = null;
        PreparedStatement pstmt = null;

        //String sql = "INSERT INTO member_info VALUE('test4', '2222', '테스트4', 'bbb@bbb.com', '010-1234-1234', '2022-02-22', 'F', 'Y');
        String sql = "INSERT INTO member_info (`MBR_ID`, `PWD`, `MBR_NM`, `EMAIL`, `MPNO`, `BD`, `SEX`, `AGRE_YN`) VALUES (?, ?, ?, ?, ?, ?, ?, ?) ";

        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, user.getMBR_ID());
            pstmt.setString(2, user.getPWD());
            pstmt.setString(3, user.getMBR_NM());
            pstmt.setString(4, user.getEMAIL());
            pstmt.setString(5, user.getMPNO());
            pstmt.setDate(6, new java.sql.Date(user.getBD().getTime()));
            pstmt.setString(7, user.getSEX());
            pstmt.setString(8, user.getAGRE_YN());
            return pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            return FAIL;
        } finally {
            close(pstmt, conn);  //     private void close(AutoCloseable... acs) {
        }
    }

    @Override
    public int updateUser(User user) {
        int rowCnt = FAIL;

        String sql = "UPDATE member_info " +
                "SET PWD = '1111', MBR_NM = '테스트' , EMAIL= 'aaa@aaa.com' , BD = '1994-11-24', SNS_YN= 'Y', SUBS_DTM= '2023-04-11' " +
                "WHERE MBR_ID = 'test3' ";


        try (
                Connection conn = ds.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
        ){
            pstmt.setString(2, user.getPWD());
            pstmt.setString(3, user.getMBR_NM());
            pstmt.setString(4, user.getEMAIL());
            pstmt.setString(5, user.getMPNO());
            pstmt.setDate(6, new java.sql.Date(user.getBD().getTime()));
            pstmt.setString(7, user.getSEX());
            pstmt.setString(8, user.getAGRE_YN());
            pstmt.setString(1, user.getMBR_ID());

            rowCnt = pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            return FAIL;
        }
        return rowCnt;
    }

    @Override
    public int count() throws Exception {
        String sql = "SELECT count(*) FROM member_info ";

        try(
                Connection conn = ds.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(sql);
                ResultSet rs = pstmt.executeQuery();
        ){
            rs.next();
            int result = rs.getInt(1);

            return result;
        }
    }

    @Override
    public void deleteAll() throws Exception {
        Connection conn = ds.getConnection();

        String sql = "delete from member_info";

        PreparedStatement pstmt = conn.prepareStatement(sql); // SQL Injection공격, 성능향상
        pstmt.executeUpdate(); //  insert, delete, update
    }

    private void close(AutoCloseable... acs) {
        for(AutoCloseable ac :acs)
            try { if(ac!=null) ac.close(); } catch(Exception e) { e.printStackTrace(); }
    }
}