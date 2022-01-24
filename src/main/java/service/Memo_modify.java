package service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.DBcon;

@WebServlet("/Memo_modify")
public class Memo_modify extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
	
		Date d = new Date();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일");
		String date = sdf.format(d);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
				
		String title = request.getParameter("title");
		String text = request.getParameter("text");
		String code = request.getParameter("code");
		String memocode = request.getParameter("memocode");
		
		try {
			Connection conn = DBcon.getConnection();
			String sql = "update memo set "
					+ "title = ?, text = ?, regDate = ? where code = ? and memocode = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, title);
			pstmt.setString(2, text);
			pstmt.setString(3, date);
			pstmt.setString(4, code);
			pstmt.setString(5, memocode);
			
			pstmt.executeUpdate();
			
			conn.close();
			pstmt.close();
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
						
		response.sendRedirect("result.jsp");
		
	}

}
