package dao;

import dto.Bbs;

import java.sql.*;
import java.util.ArrayList;

public class BbsDAO {
    private Connection conn;
    private ResultSet rs;

    public BbsDAO() {
        try {
            String dbURL = "jdbc:mysql://localhost:3306/termProject?characterEncoding=euckr";
            String dbID = "root";
            String dbPassword = "xorkd13579!";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String getDate() {
        String SQL = "SELECT NOW()"; // 현재 시간 가져오기
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    public int getNext() { // 다음 글 가지고 오기.
        String SQL = "SELECT bbsID FROM bbs ORDER BY bbsID DESC";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) + 1;
            }
            return 1; // 첫 번째 게시물인 경우
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }

    public int write(String bbsTitle, String userID, String bbsContent) {
        String SQL = "INSERT INTO bbs VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext());
            pstmt.setString(2, bbsTitle);
            pstmt.setString(3, userID);
            pstmt.setString(4, getDate());
            pstmt.setString(5, bbsContent);
            pstmt.setInt(6, 1);

            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }

    public ArrayList<Bbs> getList(int pageNumber) {
        String SQL = "SELECT * FROM bbs WHERE bbsID < ? AND bbsAvailable = 1 ORDER BY bbsID DESC LIMIT 10";
        ArrayList<Bbs> list = new ArrayList<Bbs>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Bbs bbs = new Bbs();
                bbs.setBbsID(rs.getInt(1));
                bbs.setBbsTitle(rs.getString(2));
                bbs.setUserID(rs.getString(3));
                bbs.setBbsDate(rs.getString(4));
                bbs.setBbsContent(rs.getString(5));
                bbs.setBbsAvailable(rs.getInt(1));
                list.add(bbs);
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean nextPage(int pageNumber) {
        String SQL = "SELECT * FROM bbs WHERE bbsID < ? AND bbsAvailable = 1";

        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext() - (pageNumber -1) * 10);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public Bbs getBbs(int bbsID) {
        String SQL = "SELECT * FROM bbs WHERE bbsID = ?";

        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, bbsID);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                Bbs bbs = new Bbs();
                bbs.setBbsID(rs.getInt(1));
                bbs.setBbsTitle(rs.getString(2));
                bbs.setUserID(rs.getString(3));
                bbs.setBbsDate(rs.getString(4));
                bbs.setBbsContent(rs.getString(5));
                bbs.setBbsAvailable(rs.getInt(1));
                return bbs;
            }
        } catch(Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public int update(int bbsID, String bbsTitle, String bbsContent) {
        String SQL = "UPDATE bbs SET bbsTitle = ?, bbsContent = ? WHERE bbsID =?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, bbsTitle);
            pstmt.setString(2, bbsContent);
            pstmt.setInt(3, bbsID);

            return pstmt.executeUpdate();
        } catch(Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }

    public int delete(int bbsID, String userID) {
        ResultSet rs = null;
        Statement stmt = null;

        try {
            String sql = "select bbsID from bbs where bbsID = '" + bbsID + "'";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            if (rs.next()) {
                int bbsID1 = rs.getInt("bbsID");
                if (bbsID == (bbsID1)) {
                    sql = "delete from bbs where bbsID = '" + bbsID + "'";
                    stmt = conn.createStatement();
                    stmt.executeUpdate(sql);
                    System.out.println("user를 삭제했습니다.");
                } else {
                    System.out.println("일치하는 비밀번호가 아닙니다.");
                }
            } else
                System.out.println("일치하는 아이디가 없습니다.");
        } catch (SQLException exception) {
            System.out.print("SQLException : " + exception.getMessage());
        }
        return 1;
    }
}
