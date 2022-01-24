package service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.DBcon;

@WebServlet("/MyList_delete")
public class MyList_delete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String[] codes = request.getParameterValues("code");
		
		try {
			Connection conn = DBcon.getConnection();
			String sql = "delete mylist where code = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			for(String code : codes) {
				pstmt.setString(1, code);
				pstmt.executeUpdate();
			}
			
			conn.close();
			pstmt.close();
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.sendRedirect("index.jsp");
		
	}

}
