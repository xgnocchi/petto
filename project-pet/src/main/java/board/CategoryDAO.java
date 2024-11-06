package board;

import java.util.ArrayList;			// 
import java.sql.Connection;			// 데이터베이스 연결 객체
import java.sql.DriverManager;		// 
import java.sql.PreparedStatement;	// sql문 실행하기 위한 클래스
import java.sql.ResultSet;			// 쿼리문 실행 후 결과를 저장하는 클래스 (Select 문)
import java.sql.SQLException;	// SQL 작업 중 발생하는 예외 처리하는 클래스

public class CategoryDAO {
	private static CategoryDAO instance = new CategoryDAO();    // 하나의 객체를 담을 정적 변수 선언
	private CategoryDAO() {}    // 외부에서 객체 생성하지 못함
	public static CategoryDAO getInstance() { return instance; }    // 정적 메서드
	private Connection conn;			// 사용할 객체 변수 선언 conn
	private PreparedStatement pstmt;	// 사용할 객체 변수 선언 pstmt
	private ResultSet rs;				// 사용할 객체 변수 선언 rs
	private String sql;					// 사용할 객체 변수 선언 sql
	private Connection getConn() throws Exception {    // 공통으로 사용할 메서드 (DB 연결, 끊는 메서드)
	
	// 2. 드라이버 로딩
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@192.168.0.140:1521:orcl";
		String user = "petto";
		String pw = "2222";
	
	// 3. DB 연결 객체 생성
		conn = DriverManager.getConnection(url, user, pw);
		return conn;
	}
	
	// 6. 연결 끊는 메서드
	private void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		if( conn != null ) { try { conn.close(); } catch ( SQLException e ) { e.printStackTrace(); } }
		if( pstmt != null ) { try { pstmt.close(); } catch ( SQLException e ) { e.printStackTrace(); } }
		if( rs != null ) { try { rs.close(); } catch ( SQLException e ) { e.printStackTrace(); } }
	}
	
	// 동물 분류 꺼내는 메서드
	public String getAnim(int animId) {
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
			close(conn, pstmt, rs);
		}
		
		return anim;
	} 
		
}
