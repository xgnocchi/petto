package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CommentDAO {
	/* 싱글톤 */
	private static CommentDAO instance = new CommentDAO();
	private CommentDAO(){}
	public static CommentDAO getInstance() {
		return instance;
	}
	
	/* 공통 변수 선언 */
	private Connection conn=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private String sql=null;
	
	/* DB 연결 */
	private Connection getConn() throws Exception{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@192.168.0.140:1521:orcl";
		String user = "petto";
		String pw = "2222";
		conn = DriverManager.getConnection(url, user, pw);
		return conn;
	}//getConn
	
	/* 연결해제 */
	private void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		if(conn!=null) {try {conn.close();} catch (SQLException e) {e.printStackTrace();}
		if(pstmt!=null) {try {pstmt.close();} catch (SQLException e) {e.printStackTrace();}}
		if(rs!=null) {try {rs.close();} catch (SQLException e) {e.printStackTrace();}}}
	}//close
	
	
	/* 댓글 작성 */
	public int commentInsert(CommentDTO dto) {
		int result=0;
		
		int num = dto.getNum();	// 글번호 - 글번호가 0 : 새글 / 0이 아니면 답글
		int ref = dto.getRef();	// 그룹  - 새 글이면 새로운 그룹 번호가 필요 / 답글이면 기존 그룹 번호를 사용
		int re_level = dto.getRe_level();	// 답글의 레벨. 답글+1/답글의 답글+2/ 답글의 답글의 답글+3
		int re_step = dto.getRe_step();
		int number = 0;	// 새로운 그룹번호 처리를 위한 변수
		
		try {
			conn = getConn();
			sql="select max(num) from comment_main";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if( rs.next() ) {	// 새 글 추가될 때 기존 글+1 대입
				number = rs.getInt(1)+1;
			}else {	// 글이 없을때
				number =1;	// 기본값
			}
			if( num!=0 ) {	// 글번호 0 아님 -> 글번호 있다 -> 답글일 경우
				sql="update comment_main set re_step=re_step+1 where ref = ? and re_step > ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				pstmt.executeUpdate();
				re_step = re_step +1;
				re_level=re_level+1;
			}else {	// num == 0	새 글일 경우
				// 그룹번호 number 설정, lever, step = 0 초기화
				ref = number;
				re_level = 0;
				re_step = 0;
			}		
			sql="insert into comment_main(com_reg, com_content, com_img, com_update, com_delete, ref, re_step, re_level, num)"
				+ "values(sysdate, ?, ?, ?, 'N', ?, ?, ?,comment_main_seq.NEXTVAL)";
			pstmt=conn.prepareStatement(sql);
			/*
			 * pstmt.setString(1, dto.getWriter()); pstmt.setString(2, dto.getTitle());
			 * pstmt.setString(3, dto.getContent()); pstmt.setString(4, dto.getPasswd());
			 */
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setInt(7, re_level);
			result=pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		return result;
	}
	
}
