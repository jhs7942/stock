package service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import DB.DBcon;

@WebServlet("/search")
public class search extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{

		//二쇱떇 寃��깋
		HttpSession session = request.getSession(); //�꽭�뀡�쓣 �궗�슜
		
		String code = request.getParameter("code");
		
		session.setAttribute("code", code);
		String URL = "https://finance.naver.com/item/main.naver?code=" + code;
		Document doc;
		
		//二쇨�
		doc = Jsoup.connect(URL).get();
		Elements price_e1 = doc.getElementsByAttributeValue("class", "no_today");
		Element price_e2 = price_e1.get(0);
		Elements price_e3 = price_e2.select("span");
		Element price_e4 = price_e3.get(0);
		
		session.setAttribute("price", price_e4.text());
		
		//�쉶�궗紐�
		Elements name_e1 = doc.getElementsByAttributeValue("class", "wrap_company");
		Elements name_e2 = name_e1.select("h2");
		session.setAttribute("name", name_e2.text());
		
		
		//寃��깋 湲곕줉 ���옣
				Connection conn;
				try {
					conn = DBcon.getConnection();
					
					//중복 제거
					String code_sql = "select code from search_history where code =" + code;
				    PreparedStatement code_pstmt = conn.prepareStatement(code_sql);
				    ResultSet code_rs = code_pstmt.executeQuery();
					
				    if(!code_rs.next()) {
						String sql = "insert into search_history values(?,?)";
						PreparedStatement pstmt = conn.prepareStatement(sql);
						
						pstmt.setString(1, code);
						pstmt.setString(2, name_e2.text());
						pstmt.executeUpdate();
						
						conn.close();
						pstmt.close();
				    }
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		
		
		response.sendRedirect("result.jsp");

		
		
		
	}

}
