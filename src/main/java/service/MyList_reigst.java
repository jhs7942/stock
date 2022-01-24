package service;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.DBcon;

@WebServlet("/MyList_reigst")
public class MyList_reigst extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8");

		String code = request.getParameter("code");
		String name = request.getParameter("name");

		try {
			Connection conn = DBcon.getConnection(); 
			
			String sql = "select code from mylist where code= ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, code);
			ResultSet rs = pstmt.executeQuery();

			if(rs.next()) {
				response.sendRedirect("MyList_test.jsp");
				return;
				
			}else {
				sql = "insert into mylist values(?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, code);
				pstmt.setString(2, name);
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
