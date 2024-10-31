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
			sql="insert into users values(users_seq.NEXTVAL,?,?,?,?,'N',sysdate,'profile-image.png')";
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getUserPw());
			pstmt.setString(3, dto.getUserNick());
			pstmt.setString(4, dto.getEmail());
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
			sql = "select count(*) from users where userId=?";
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
	// 유저 정보 획득 메서드
	public UserDTO getUserInfo(String userId) {
		UserDTO dto = new UserDTO();
		
		try {
			conn = getConn();
			sql = "select * from users where userid = ?";
			pstmt = conn.prepareCall(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setUserId(rs.getString("userid"));
				dto.setIdx(rs.getInt("idx"));
				dto.setUserNick(rs.getString("usernick"));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(conn, pstmt, rs);
		}
		
		return dto;
	}
	/* 회원 탈퇴 */
	private String sqlCheck=null;
	private String sqlDelete=null;
	public boolean deleteUser(String userId, String userPw) {
		boolean isDel = false;
		try {
			conn = getConn();
			
			//로그인 상태와 입력 받은 비밀번호 확인
			String sqlCheck = "select count(*) From users where userId=? and userPw=?";
			pstmt = conn.prepareStatement(sqlCheck);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPw);
			
			rs= pstmt.executeQuery();
			
			if(rs.next()&&rs.getInt(1)>0) { //비밀번호가 일치 하면
				sqlDelete = "update users set userPw=null, userNick=null, email=null, isDel='Y', where userId=?";
				pstmt = conn.prepareStatement(sqlDelete);
				pstmt.setString(1, userId); //로그인한 아이디로 조회
				
				int rows = pstmt.executeUpdate();
				isDel=(rows>0);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(conn, pstmt, rs);
		}
		return isDel; //탈퇴 여부 반환
	}
	
	/* 마이페이지 */
	// 로그인한 회원 정보 꺼내오기
	public UserDTO userInfo(String id) {
		UserDTO dto = new UserDTO();
		try {
			conn=getConn();
			sql="select * from users where userId=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto.setUserPw(rs.getString("userPw"));
				dto.setUserNick(rs.getString("userNick"));
				dto.setEmail(rs.getString("email"));
				dto.setSignInDate(rs.getTimestamp("signinDate"));
				dto.setProfileImg(rs.getString("profileImg"));		
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(conn,pstmt,rs);
		}
		return dto;
	}
	
	/* 회원정보 수정*/
	//정보 수정하기
	public void updateUser(UserDTO dto) {
		try {
			conn=getConn();
			sql="update users set userNick=?, email=?, proFileImg=? where userId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserNick());
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getProfileImg());
			pstmt.setString(4, dto.getUserId());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(conn,pstmt,rs);
		}
		
	}
}//UserDAO
