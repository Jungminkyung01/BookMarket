package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import board.BoardDTO;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	//데이터베이스 접속
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/bookdb";
			String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//로그인
	public int login(String userID, String userPass) {
		String SQL = "SELECT userPass FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(userPass))
					return 1; // 로그인 성공
				else
					return 0; // 비밀번호 불일치
			}
			return -1; // 아이디 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류
	}
	//회원가입
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES (?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPass());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserEmail());
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;	//데이터베이스 오류
	}
	
	//회원정보 수정
    public int update(String userID, String userPass, String userName, String userEmail)
    {
            String SQL = "UPDATE USER SET userPass = ?, userName = ?, userEmail = ? WHERE userID = ?";
            try {
                PreparedStatement pstmt = conn.prepareStatement(SQL);
                pstmt.setString(1, userPass);
                pstmt.setString(2, userName);
                pstmt.setString(3, userEmail);
                pstmt.setString(4, userID);
                return pstmt.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }
            return -1; // 데이터베이스 오류
        }

  //회원정보를 불러오기 위해
    public User getUser(String userID)
    {
            String SQL = "SELECT * FROM USER WHERE userID = ?"; 
            try {
                PreparedStatement pstmt = conn.prepareStatement(SQL);
                pstmt.setString(1, userID);
                rs = pstmt.executeQuery();
                if (rs.next())
                {
                	User user = new User();
                	user.setUserID(rs.getString(1));
                	user.setUserPass(rs.getString(2));
                	user.setUserName(rs.getString(3));
                	user.setUserEmail(rs.getString(4));
                    return user;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return null; 
        }
  //정보 삭제
    public int delete(String userID)
    {
        String SQL = "DELETE FROM USER WHERE userID = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }
}
