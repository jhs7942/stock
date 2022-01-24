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

@WebServlet("/Memo_delete")
public class Memo_delete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String code = request.getParameter("code");
		String[] memocodes = request.getParameterValues("memocode");
		
		try {
			Connection conn = DBcon.getConnection();
			String sql = "delete memo where code = ? and memocode = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, code);
			
			for(String memocode : memocodes) {
				pstmt.setString(2, memocode);
				pstmt.executeUpdate();
			}
			
			conn.close();
			pstmt.close();
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		response.sendRedirect("result.jsp");
		
		
	}

}
