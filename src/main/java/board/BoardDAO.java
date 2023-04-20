package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardDAO {

	 private Connection conn;            // DB에 접근하는 객체
	    private ResultSet rs;                // DB data를 담을 수 있는 객체  (Ctrl + shift + 'o') -> auto import
	    
	    public BoardDAO(){ 
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
	    public String getDate() // 현재시간을 넣어주기위해
	    {
	        String SQL = "SELECT NOW()"; // 현재시간을 나타내는 mysql
	        try {
	            PreparedStatement pstmt = conn.prepareStatement(SQL);
	            rs = pstmt.executeQuery();
	            if(rs.next()) {
	                return rs.getString(1);
	            }
	            
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return ""; // 데이터베이스 오류
	    }
	    
	    public int getNext()
	    {
	        String SQL = "SELECT NUM FROM BOARD ORDER BY NUM DESC"; // 내림차순으로 가장 마지막에 쓰인 것을 가져온다
	        try {
	            PreparedStatement pstmt = conn.prepareStatement(SQL);
	            rs = pstmt.executeQuery();
	            if(rs.next()) {
	                return rs.getInt(1) + 1; // 그 다음 게시글의 번호
	            }
	            return 1; // 첫 번째 게시물인 경우
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return -1; // 데이터베이스 오류
	    }
	    public int write(String bbsTitle, String userID, String bbsContent) {
	        String SQL = "INSERT INTO BOARD VALUES (?,?,?,?,?,?)";
	        try {
	            PreparedStatement pstmt = conn.prepareStatement(SQL);
	            pstmt.setInt(1, getNext());
	            pstmt.setString(2, userID);
	            pstmt.setString(3, bbsTitle);
	            pstmt.setString(4, bbsContent);
	            pstmt.setString(5, getDate());
	            pstmt.setInt(6, 1);
	            return pstmt.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return -1; // 데이터베이스 오류
	        
	    }
	    public ArrayList<BoardDTO> getList(int pageNumber)
	    {
	        String SQL = "SELECT * FROM BOARD WHERE NUM < ? AND bbsAvailable = 1 ORDER BY NUM DESC LIMIT 10"; // 내림차순으로 가장 마지막에 쓰인 것을 가져온다
	        ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
	        try {
	            PreparedStatement pstmt = conn.prepareStatement(SQL);
	            pstmt.setInt(1, getNext() - (pageNumber - 1 ) * 10);
	            rs = pstmt.executeQuery();
	            while (rs.next()) {
	            	BoardDTO board = new BoardDTO();
	            	board.setNum(rs.getInt(1));
	            	board.setUserID(rs.getString(2));
	            	board.setBbsTitle(rs.getString(3));
	            	board.setBbsContent(rs.getString(4));
	            	board.setBbsDate(rs.getString(5));
	            	board.setBbsAvailable(rs.getInt(6));
	                list.add(board);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return list; 
	    }
	    //페이징 처리를 위한 함수
	    public boolean nextPage(int pageNumber) {
	        String SQL = "SELECT * FROM BOARD WHERE NUM < ? AND bbsAvailable = 1"; 
	        try {
	            PreparedStatement pstmt = conn.prepareStatement(SQL);
	            pstmt.setInt(1, getNext() - (pageNumber - 1 ) * 10);
	            rs = pstmt.executeQuery();
	            if (rs.next())
	            {
	                return true;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return false; 
	    }
	    //글내용을 불러오기 위해서
	    public BoardDTO getBoardDTO(int num)
	    {
	            String SQL = "SELECT * FROM BOARD WHERE NUM = ?"; 
	            try {
	                PreparedStatement pstmt = conn.prepareStatement(SQL);
	                pstmt.setInt(1, num);
	                rs = pstmt.executeQuery();
	                if (rs.next())
	                {
	                	BoardDTO board = new BoardDTO();
	                	board.setNum(rs.getInt(1));
	                	board.setUserID(rs.getString(2));
	                	board.setBbsTitle(rs.getString(3));
	                    board.setBbsContent(rs.getString(4));
	                    board.setBbsDate(rs.getString(5));
	                    board.setBbsAvailable(rs.getInt(6));
	                    return board;
	                }
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	            return null; 
	        }
	    //게시글 수정
	    public int update(int num, String bbsTitle, String bbsContent)
	    {
	            String SQL = "UPDATE BOARD SET bbsTitle = ?, bbsContent = ? WHERE num = ?";
	            try {
	                PreparedStatement pstmt = conn.prepareStatement(SQL);
	                pstmt.setString(1, bbsTitle);
	                pstmt.setString(2, bbsContent);
	                pstmt.setInt(3, num);
	                return pstmt.executeUpdate();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	            return -1; // 데이터베이스 오류
	        }
	    //게시글 삭제
	    public int delete(int num)
	    {
	        String SQL = "UPDATE BOARD SET bbsAvailable = 0  WHERE NUM = ?";
	        try {
	            PreparedStatement pstmt = conn.prepareStatement(SQL);
	            pstmt.setInt(1, num);
	            return pstmt.executeUpdate();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return -1; // 데이터베이스 오류
	    }
	}
