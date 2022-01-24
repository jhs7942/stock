package service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.print.Doc;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import DB.DBcon;
import vo.Company;

public class MyList {

	public ArrayList<Company> List() throws IOException{
	
	ArrayList<Company> company = new ArrayList<>(); //관심종목 리스트
	
	try {
		Connection conn = DBcon.getConnection();
		String sql = "select * from mylist";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			
			Company com = new Company(); //관심종목
			
			String code = rs.getString("code");
			
			com.setCode(code);//관심종목 코드를 관심종목 리스트에 추가
			
			String URL = "https://finance.naver.com/item/main.naver?code="+code;
			
			Document doc;
			
			//주가
			doc = Jsoup.connect(URL).get();
			Elements price_e1 = doc.getElementsByAttributeValue("class", "no_today");
			Element price_e2 = price_e1.get(0);
			Elements price_e3 = price_e2.select("span");
			Element price_e4 = price_e3.get(0);
			
			com.setPrice(price_e4.text());//관심종목 객체에 주가 등록
			
			//회사명
//			Elements name_e1 = doc.getElementsByAttributeValue("class", "wrap_company");
//			Elements name_e2 = name_e1.select("h2");

			com.setName(rs.getString("name"));//관심종목 객체에 회사이름 등록
			company.add(com);//관심종목 객체를 관심종목 리스트에 추가
			
		}
		
		conn.close();
		pstmt.close();
		
	} catch (ClassNotFoundException | SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return company;
	
//	request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	
}
