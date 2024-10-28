package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {

	private static UserDAO instance = new UserDAO();
	private UserDAO(){}
	public static UserDAO getInstance() {
		return instance;
	}
	
	private Connection conn=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private String sql=null;
	
	/* getConn */
	private Connection getConn() throws Exception{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@192.168.0.140:1521:orcl";
		String user = "petto";
		String pw = "2222";
		conn = DriverManager.getConnection(url, user, pw);
		return conn;
	}//getConn
	
	/* close */
	private void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		if(conn!=null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
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
	}//close
	
	/* 회원가입 insert */
	// 유저 등록
	public void insertUser(UserDTO dto) {
		try {
			conn = getConn();
			sql="insert into users values(users_seq.NEXTVAL,?,?,?)";
			pstmt =conn.prepareStatement(sql);
			/*pstmt.setInt(1,dto.getIdx()); 키값처리어케하는지 찾아봐야함*/
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getUserPw());
			pstmt.setString(3, dto.getUserNick());
			/*
			pstmt.setString(5, dto.getUser_name());
			pstmt.setString(6, dto.getEmail());
			pstmt.setString(7, dto.getPhone());
			pstmt.setString(8, dto.getPhone_agency());
			pstmt.setString(9, dto.getAddress());
			pstmt.setTimestamp(10, dto.getBirth());
			pstmt.setString(11, dto.getGender());
			pstmt.setString(12,dto.getProfile_img());
			pstmt.setTimestamp(13, dto.getLast_date());
*/
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//6. 연결 끊기
			close(conn,pstmt,rs);
		}
	}//insertUser
	
	// 아이디 중복 확인
	public boolean confirmId(String id) {
		boolean result = false;
		try {
			conn=getConn();
			sql = "select * from users where userId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result= rs.getInt(1)>0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(conn,pstmt,rs);
		}
		return result;
	}//confirmId
	
	
	/* 로그인 login */
	// 로그인 확인
	public boolean loginCheck(UserDTO dto) {
		boolean result = false;
		try {
			conn = getConn();
			sql="select idx from users where userId=? and userPw=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getUserPw());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				int r = rs.getInt(1);
				if(r!=0) {
				result = true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			//DB 연결 끊기
			close(conn, pstmt, rs);
		}
		return result;
	}
	
}//UserDAO
