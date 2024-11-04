package secondhand;

// import
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

// 싱글톤 방식을 사용하여 DB에 연결함

public class ItemInfoDAO {
	
	// 생성자 싱글톤 처리
	private static ItemInfoDAO instance = new ItemInfoDAO();
	private ItemInfoDAO() {}
	public static ItemInfoDAO getInstance() {
		return instance;
	}
	
	// 사용 변수 선언
	private Connection conn = null;
	private String sql = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	// 연결 메서드
	private Connection getConn() throws Exception{
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@192.168.0.140:1521:orcl";
		String user = "petto";
		String pw = "2222";
		
		conn = DriverManager.getConnection(url, user, pw);
		
		return conn;
	}
	
	// 연결 해제 메서드
	private void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		if (conn != null) {try {conn.close();} catch (SQLException e) {e.printStackTrace();}}
		if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}}
		if (rs != null) {try {rs.close();} catch (SQLException e) {e.printStackTrace();}}
	}
	
	// 판매 상태 리턴 메서드
	public int getSellingStatus(int itemNum) {
		int result = 0;
		
		try {
			conn = getConn();
			sql = "select is_selling from item_info where item_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, itemNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt("is_selling");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	// 글 목록
	public ArrayList<ItemInfoDTO> list(int start, int end, int onlySell) {
		ArrayList<ItemInfoDTO> list = new ArrayList<ItemInfoDTO>();
		String namePre = null;
		
		try {
			conn=getConn();
			sql = "select * from (select n.*, rownum r from (select * from item_info";
			sql += (onlySell == 1) ? " where is_selling = 1" : "" ;
			sql += " order by  re_reg desc) n) where r >= ? and r <= ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs=pstmt.executeQuery();
			while( rs.next() ) {
				ItemInfoDTO dto = new ItemInfoDTO();
				dto.setItemNum(rs.getInt("item_num"));
				dto.setIsSelling(rs.getInt("is_selling"));
				namePre = rs.getString("name");
				if(namePre.length() > 10) {
					dto.setName(namePre.substring(0, 9) + "...");
				} else {
					dto.setName(namePre);
				}
				dto.setPrice(rs.getInt("price"));
				dto.setNick(rs.getString("nick"));
				dto.setViewCount(rs.getInt("view_count"));
				dto.setReg(rs.getTimestamp("reg"));
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
	public int count(int onlySell) {
		int result = 0;
		try {
			conn=getConn();
			sql="select count(*) from item_info";
			sql += (onlySell == 1) ? " where is_selling = 1" : "" ;
			pstmt=conn.prepareStatement(sql);
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
	
	// 글 보기 메서드
	public ItemInfoDTO itemContent(int itemNum) {
		ItemInfoDTO dto = new ItemInfoDTO();
		
		try {
			conn = getConn();
			sql = "select * from item_info where item_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, itemNum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setName(rs.getString("name"));
				dto.setItemId(rs.getInt("item_id"));
				dto.setAnimId(rs.getInt("anim_id"));
				dto.setIsSelling(rs.getInt("is_selling"));
				dto.setCondition(rs.getInt("condition"));
				dto.setPrice(rs.getInt("price"));
				dto.setContent(rs.getString("content"));
				dto.setImg(rs.getString("img"));
				dto.setItemNum(rs.getInt("item_num"));
				dto.setNick(rs.getString("nick"));
				dto.setReg(rs.getTimestamp("reg"));
				dto.setViewCount(rs.getInt("view_count"));
				dto.setIdx(rs.getInt("idx"));
			}
			sql = "update item_info set view_count=? where item_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getViewCount() + 1);
			pstmt.setInt(2, itemNum);
			pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		
		return dto;
	}
	
	// 판매글 삭제 메서드
	public boolean deleteSell(int itemNum) {
		int check = 0;
		boolean result = false;
		
		try {
			conn = getConn();
			sql = "delete from item_info where item_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, itemNum);
			check = pstmt.executeUpdate();
			
			result = (check == 1);
			System.out.println(result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		
		return result;
	}
	
	// 판매글 수정에서 쓸 정보 불러오기 메서드
	public ItemInfoDTO updateLoad(int itemNum) {
		ItemInfoDTO dto = new ItemInfoDTO();
		
		try {
			conn = getConn();
			sql = "select * from item_info where item_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, itemNum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto.setName(rs.getString("name"));
				dto.setItemId(rs.getInt("item_id"));
				dto.setAnimId(rs.getInt("anim_id"));
				dto.setCondition(rs.getInt("condition"));
				dto.setPrice(rs.getInt("price"));
				dto.setContent(rs.getString("content"));
				dto.setImg(rs.getString("img"));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		
		return dto;
	}
	
	// 판매글 수정 메서드
	public boolean updateSell(ItemInfoDTO dto, int isRegUpdate) {
		int check = 0;
		boolean result = false;
		
		try {
			conn = getConn();
			sql = "update item_info set name=?, price=?, content=?, img=?, is_selling=?, condition=?, re_reg=";
			sql += (isRegUpdate == 1) ? "sysdate where item_num=?" : "(select re_reg from item_info where item_num=?) where item_num=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setInt(2, dto.getPrice());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getImg());
			pstmt.setInt(5, dto.getIsSelling());
			pstmt.setInt(6, dto.getCondition());
			pstmt.setInt(7, dto.getItemNum());
			if (isRegUpdate == 0) {
				pstmt.setInt(8, dto.getItemNum());
			}
			
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
	
	// 판매글 작성 메서드
	public boolean writeSell(ItemInfoDTO dto) {
		int check = 0;
		boolean result = false;
		
		try {
			conn = getConn();
			sql = "insert into item_info values(item_info_seq.nextval, ?, ?, ?, 1, ?, ?, ?, ?, ?, ?, 0, sysdate, sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getIdx());
			pstmt.setInt(2, dto.getItemId());
			pstmt.setInt(3, dto.getAnimId());
			pstmt.setInt(4, dto.getCondition());
			pstmt.setString(5, dto.getName());
			pstmt.setInt(6, dto.getPrice());
			pstmt.setString(7, dto.getNick());
			pstmt.setString(8, dto.getContent());
			pstmt.setString(9, dto.getImg());
			check = pstmt.executeUpdate();
			
			if (check == 1) {
				result = true;
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		
		return result;
	}
}
