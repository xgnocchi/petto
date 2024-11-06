package secondhand;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class FavListDAO {
	
	private static FavListDAO instance = new FavListDAO();
	private FavListDAO(){}
	public static FavListDAO getInstance() {
		return instance;
	}
	Connection conn = null;
	String sql = "";
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	
	// 연결 메서드
	private Connection getConn() throws Exception {
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@192.168.0.140:1521:orcl";
		String user = "petto";
		String pw = "2222";
		conn = DriverManager.getConnection(url, user, pw);
		
		return conn;
	}
	
	// 연결 해제 메서드
	private void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		if(conn!=null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(pstmt!=null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(rs!=null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	// 찜 메서드
	public int addFav(int itemNum, int idx, String name, int price) {
		int result = 0;
		
		try {
			conn = getConn();
			sql = "select item_num from fav_list where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				if(rs.getInt("item_num") == itemNum) {
					result = 2;
					return result;
				}
			}
			
			sql = "insert into fav_list values(fav_list_seq.nextval, ?, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, itemNum);
			pstmt.setInt(2, idx);
			pstmt.setString(3, name);
			pstmt.setInt(4, price);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	// 찜 목록 삭제
	public boolean deleteFav(int favNum, int idx) {
		int check = 0;
		boolean result = false;
		
		try {
			conn = getConn();
			sql = "delete from fav_list where fav_num=? and idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, favNum);
			pstmt.setInt(2, idx);
			
			check = pstmt.executeUpdate();
			
			result = (check == 1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	// 판매글 삭제시 찜목록 삭제 메서드
	public boolean deleteItem(int itemNum) {
		int check = 0;
		boolean result = false;
		
		try {
			conn = getConn();
			sql = "delete from fav_list where item_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, itemNum);
			
			check = pstmt.executeUpdate();
			
			result = (check == 1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	// 글 목록
	public ArrayList<FavListDTO> list(int start, int end, int idx) {
		ArrayList<FavListDTO> list = new ArrayList<FavListDTO>();
		
		try {
			conn = getConn();
			sql = "select * from (select n.*, rownum r from (select * from fav_list order by fav_num desc) n) where r >= ? and r <= ? and idx = ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			pstmt.setInt(3, idx);
			rs=pstmt.executeQuery();
			while( rs.next() ) {
				FavListDTO dto = new FavListDTO();
				dto.setFavNum(rs.getInt("fav_num"));
				dto.setItemNum(rs.getInt("item_num"));
				dto.setIdx(rs.getInt("idx"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getInt("price"));
				dto.setFavDate(rs.getTimestamp("fav_date"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return list;
	}
	
	// 글 개수
	public int count(int idx) {
		int result = 0;
		try {
			conn=getConn();
			sql="select count(*) from fav_list where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs=pstmt.executeQuery();
			if( rs.next() ) {
				result=rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			close(conn, pstmt, rs);
		}
		return result;
	}
}
