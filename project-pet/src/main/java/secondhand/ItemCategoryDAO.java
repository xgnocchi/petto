package secondhand;

//import
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


// 싱글톤 방식으로 DB에 연결
public class ItemCategoryDAO {
	
		// 생성자 싱글톤 처리
		private static ItemCategoryDAO instance = new ItemCategoryDAO();
		private ItemCategoryDAO() {}
		public static ItemCategoryDAO getInstance() {
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
		private void close() {
			if (conn != null) {try {conn.close();} catch (SQLException e) {e.printStackTrace();}}
			if (pstmt != null) {try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}}
			if (rs != null) {try {rs.close();} catch (SQLException e) {e.printStackTrace();}}
		}
		
		// 품목 꺼내는 메서드
		public String getItem(int itemId) {
			String item = null;
			
			try {
				conn = getConn();
				sql = "select item from item_category where item_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, itemId);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					item = rs.getString("item");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close();
			}
			
			return item;
		}
		
}
