
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

@WebServlet("/Memo_regist")
public class Memo_regist extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Date d = new Date();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년MM월dd일");
		String date = sdf.format(d);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String code = request.getParameter("code");
		String memocode = request.getParameter("memocode");
		String title = request.getParameter("title");
		String text = request.getParameter("text");
		
		try {
			Connection conn = DBcon.getConnection();
			String sql = "insert into memo values(?,?,?,?,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, code);
			pstmt.setString(2, memocode);
			pstmt.setString(3, title);
			pstmt.setString(4, text);
			pstmt.setString(5, date);
			
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
