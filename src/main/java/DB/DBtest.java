package DB;

import java.sql.Connection;
import java.sql.SQLException;

public class DBtest {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		
		Connection conn = DBcon.getConnection();
		
		if(conn != null) {
			System.out.println("DB연결 성공");
		}
		else {
			System.out.println("DB연결 실패");
		}
		
	}
	
}
