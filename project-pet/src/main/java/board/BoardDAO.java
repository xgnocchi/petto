package board;
// 1. 임포트
import java.util.ArrayList;			// 
import java.sql.Connection;			// 데이터베이스 연결 객체
import java.sql.DriverManager;		// 
import java.sql.PreparedStatement;	// sql문 실행하기 위한 클래스
import java.sql.ResultSet;			// 쿼리문 실행 후 결과를 저장하는 클래스 (Select 문)
import java.sql.SQLException;		// SQL 작업 중 발생하는 예외 처리하는 클래스
public class BoardDAO {
	private static BoardDAO instance = new BoardDAO();    // 하나의 객체를 담을 정적 변수 선언
	private BoardDAO() {}    // 외부에서 객체 생성하지 못함
	public static BoardDAO getInstance() { return instance; }    // 정적 메서드
	
	private Connection conn;			// 사용할 객체 변수 선언 conn
	private PreparedStatement pstmt;	// 사용할 객체 변수 선언 pstmt
	private ResultSet rs;				// 사용할 객체 변수 선언 rs
	private String sql;					// 사용할 객체 변수 선언 sql
	
	private Connection getConn() throws Exception {    // 공통으로 사용할 메서드 (DB 연결, 끊는 메서드)
	
	// 2. 드라이버 로딩
		Class.forName("oracle.jdbc..driver.OracleDriver");
		String url = "";
		String user = "";
		String pw = "";
	
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
	// 글 작성
	// 글 개수
	// 글 목록
	// 글 내용 + 조회수
	// 글 수정 Form
	// 글 수정 Pro
	// 글 삭제
	// 
}
