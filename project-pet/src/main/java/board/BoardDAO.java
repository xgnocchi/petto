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
	
	// 글 작성
	public int boardWrite(BoardDTO dto) throws SQLException {
	    int result = 0;
	    try {
	        conn = getConn();
	        sql = "insert into board_main (post_id, bo_view, bo_like, title_head, bo_title, bo_writer, bo_content, bo_img, bo_reg, bo_update, bo_deldate, bo_password)"
	        		+ "values (board_main_seq.nextval, ?, ?, '말머리', ?, ?, ?, ?, sysdate, ?, ?, ?)";
	        pstmt = conn.prepareStatement(sql);
	        // 글 작성할 데이터 설정
//	        pstmt.setInt(1, dto.getPost_id());		
	        pstmt.setInt(1, dto.getBo_view());        // 조회수 초기값 (예: 0)
	        pstmt.setString(2, dto.getBo_like());     // 좋아요 수 초기값 (예: "0")
//	        pstmt.setString(, dto.getTitle_head());  // 제목 앞머리
	        pstmt.setString(3, dto.getBo_title());    // 제목
	        pstmt.setString(4, dto.getBo_writer());   // 작성자
	        pstmt.setString(5, dto.getBo_content());  // 본문 내용
	        pstmt.setString(6, dto.getBo_img());	  // 이미지
//	        pstmt.setTimestamp(9, dto.getBo_reg());
	        pstmt.setTimestamp(7, dto.getBo_update());
	        pstmt.setTimestamp(8, dto.getBo_deldate());
	        pstmt.setString(9, dto.getBo_password());    // 비밀번호

	        result = pstmt.executeUpdate();  // 쿼리 실행 결과 반환
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        close(conn, pstmt, rs);  // 사용한 리소스 닫기
	    }
	    return result;  // 삽입된 행 수 반환 (성공 시 1, 실패 시 0)
	}

	// 글 개수
	public int count() {
		int result=0;
		try {
			conn=getConn();
			pstmt=conn.prepareStatement("select count(*) from board_main");
			rs=pstmt.executeQuery();
			if( rs.next() ) {
				result=rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return result;
	}
	// 글 목록
	public ArrayList<BoardDTO> boardList(int start, int end) {
		ArrayList<BoardDTO> contentList = new ArrayList<BoardDTO>();
		try {
			conn = getConn();
			sql ="select * from( select b.*, rownum r from(select * from board_main) b) where r >= ? and r <= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			while(rs.next()) {
					BoardDTO dto = new BoardDTO();
					dto.setPost_id(rs.getInt("post_id"));
					dto.setBo_view(rs.getInt("bo_view"));
					dto.setBo_like(rs.getString("bo_like"));
					dto.setTitle_head(rs.getString("title_head"));
					dto.setBo_title(rs.getString("bo_title"));
					dto.setBo_writer(rs.getString("bo_writer"));
					dto.setBo_content(rs.getString("bo_content"));
					dto.setBo_img(rs.getString("bo_img"));
					dto.setBo_reg(rs.getTimestamp("bo_reg"));
					dto.setBo_update(rs.getTimestamp("bo_update"));
					dto.setBo_deldate(rs.getTimestamp("bo_deldate"));
					dto.setBo_password(rs.getString("bo_password"));
					contentList.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return contentList;
	}
	// 글 내용 + 조회수
	public BoardDTO content(int num) {
		BoardDTO dto = new BoardDTO();
		try {
			conn = getConn();
			sql = "update board_main set bo_view=bo_view + 1 where post_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			sql = "select * from board_main where post_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if( rs.next() ) {
				dto.setPost_id(rs.getInt("post_id"));
				dto.setBo_view(rs.getInt("bo_view"));
				dto.setBo_like(rs.getString("bo_like"));
				dto.setTitle_head(rs.getString("title_head"));
				dto.setBo_title(rs.getString("bo_title"));
				dto.setBo_writer(rs.getString("bo_writer"));
				dto.setBo_content(rs.getString("bo_content"));
				dto.setBo_img(rs.getString("bo_img"));
				dto.setBo_reg(rs.getTimestamp("bo_reg"));
				dto.setBo_update(rs.getTimestamp("bo_update"));
				dto.setBo_deldate(rs.getTimestamp("bo_deldate"));
				dto.setBo_password(rs.getString("bo_password"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return dto;
	}
	// 글 수정 Form
    public BoardDTO boardUpForm(int post_id) {
        BoardDTO dto = new BoardDTO();
		try {
			conn=getConn();
			sql = "select * from board_main where post_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, post_id);
			rs = pstmt.executeQuery();
			if( rs.next() ) {
				dto.setPost_id(rs.getInt("post_id"));
				dto.setBo_view(rs.getInt("bo_view"));
				dto.setBo_like(rs.getString("bo_like"));
				dto.setTitle_head(rs.getString("title_head"));
				dto.setBo_title(rs.getString("bo_title"));
				dto.setBo_writer(rs.getString("bo_writer"));
				dto.setBo_content(rs.getString("bo_content"));
				dto.setBo_img(rs.getString("bo_img"));
				dto.setBo_reg(rs.getTimestamp("bo_reg"));
				dto.setBo_update(rs.getTimestamp("bo_update"));
				dto.setBo_deldate(rs.getTimestamp("bo_deldate"));
				dto.setBo_password(rs.getString("bo_password"));
            }
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return dto;
	}
	// 글 수정 Pro
	public int boardUpPro(BoardDTO dto) {
		int result =0;
		String dbpw="";
		try {
			conn=getConn();
			sql="select bo_password from board_main where post_id = ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getPost_id());
			rs = pstmt.executeQuery();
			if( rs.next() ) {
				dbpw=rs.getString("bo_password");
				if( dbpw.equals(dto.getBo_password()) ) {
                    sql = "update board_main set title_head=?, bo_title=?, bo_content, bo_img where post_id=?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setString(1, dto.getTitle_head());
					pstmt.setString(2, dto.getBo_title());
					pstmt.setString(3, dto.getBo_content());
					pstmt.setString(4, dto.getBo_img());
					pstmt.setInt(5, dto.getPost_id());
					result=pstmt.executeUpdate();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return result;
	}
	// 글 삭제
	public int boardDelete(int post_id, String bo_password) {    // 글 삭제(+ 파일이름 리턴)
		int result = 0;
		String dbpw = "";
		try {
			conn = getConn();
			sql = "select bo_password from board_main where post_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,post_id);
			rs = pstmt.executeQuery();
			if( rs.next() ) {
				dbpw=rs.getString("bo_password");    // 삭제할 파일이름 얻기위한 쿼리문
				if( dbpw.equals(bo_password) ) {
					sql="delete from board_main where post_id=?";    // post_id에 해당하는 글 삭제
					pstmt=conn.prepareStatement(sql);
					pstmt.setInt(1, post_id);
					result=pstmt.executeUpdate();
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return result;
	}
	// 
}