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
	//�����ͺ��̽� ����
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
	//�α���
	public int login(String userID, String userPass) {
		String SQL = "SELECT userPass FROM USER WHERE userID = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(userPass))
					return 1; // �α��� ����
				else
					return 0; // ��й�ȣ ����ġ
			}
			return -1; // ���̵� ����
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // �����ͺ��̽� ����
	}
	//ȸ������
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
		return -1;	//�����ͺ��̽� ����
	}
	
	//ȸ������ ����
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
            return -1; // �����ͺ��̽� ����
        }

  //ȸ�������� �ҷ����� ����
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
  //���� ����
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
        return -1; // �����ͺ��̽� ����
    }
}
