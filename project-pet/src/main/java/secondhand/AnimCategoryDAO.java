package secondhand;

//import
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


// 싱글톤 방식으로 DB에 연결
public class AnimCategoryDAO {
	
		// 생성자 싱글톤 처리
		private static AnimCategoryDAO instance = new AnimCategoryDAO();
		private AnimCategoryDAO() {}
		public static AnimCategoryDAO getInstance() {
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
		
		// 동물 분류 꺼내는 메서드
		public String getItem(int animId) {
			String anim = null;
			
			try {
				conn = getConn();
				sql = "select anim from anim_category where anim_id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, animId);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					anim = rs.getString("anim");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close();
			}
			
			return anim;
		}
		
}
