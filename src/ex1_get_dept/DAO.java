package ex1_get_dept;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DAO {
    private DataSource ds;

    public DAO() {
        try {
            Context init = new InitialContext();
            ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
        } catch (Exception ex) {
            System.out.println("DB 연결 실패" + ex);
            return;
        }
    }

    public JsonArray getList_lib() {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        JsonArray array = new JsonArray();
        try {
            con = ds.getConnection();

            String sql = "select * from dept order by deptno";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                JsonObject obj = new JsonObject();
                obj.addProperty("deptno", rs.getInt(1));
                obj.addProperty("dname", rs.getString(2));
                obj.addProperty("loc", rs.getString(3));
                array.add(obj);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } finally {
            if(rs != null)
                try {
                    rs.close();
                } catch (SQLException ex) {
                }
            if(pstmt != null)
                try {
                    pstmt.close();
                } catch (SQLException ex) {
                }
            if(con != null)
                try {
                    con.close();
                } catch (SQLException ex) {
                }
        }
        return array;
    }

    public int insert(VO vo) {
        Connection con = null;
        PreparedStatement pstmt = null;
        int result = 0;
        try {
            con = ds.getConnection();

            String sql = "insert into products valuse((select nvl(max(id),0)+1 from products), ?, ?, ?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, vo.getName());
            pstmt.setInt(2, vo.getPrice());
            pstmt.setString(3, vo.getMaker());
            result = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(pstmt != null)
                try {
                    pstmt.close();
                } catch (SQLException ex) {
                }
            if(con != null)
                try {
                    con.close();
                } catch (SQLException ex) {
                }
        }
        return result;
    }

    public JsonArray getList() {
        return null;
    }
}
