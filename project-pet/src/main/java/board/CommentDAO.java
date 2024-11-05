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
	
	/* 댓글 작성*/
	public void commentInsert(CommentDTO dto) {
		int num = dto.getNum(); // 글번호(새글인지 답글인지 구분) 
		int ref = dto.getRef(); // 그룹
		int re_level=dto.getRe_level(); // 답글 레벨
		int re_step=dto.getRe_step(); 
		int number=0;// 새로운 그룹번호 처리
		
		try {
			conn=getConn();
			sql="select max(num) from comment_main";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {//새 글 추가 될 때 기존글에 값 더함
				number=rs.getInt(1)+1;
			}else {
				number=1;
			}
		if(num!=0) {
			sql="update comment_main set re_step=re_step+1 where ref=? and re_step >?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, re_step);
			pstmt.executeUpdate();
			re_step=re_step+1;
			re_level=re_level+1;
		}else {
			ref=number;
			re_level=0;
			re_step=0;
		}
		sql="insert into comment_main(com_reg, com_content, com_img, com_update, com_delete, ref, re_step, re_level, num) "
		  + "values(sysdate,?,?,null,'N',?,?,?,comment_main_seq.nextval)";
		pstmt=conn.prepareStatement(sql);
		
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(conn,pstmt,rs);
		}
		
	}
	
	
}
