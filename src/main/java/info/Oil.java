package info;

import java.io.IOException;
import java.util.Iterator;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import vo.Exchange_today;
import vo.Oil_today;

public class Oil {
	
	public static Oil_today today(String oil) throws IOException {
		Oil_today et = new Oil_today();
		
		String URL = "https://finance.naver.com/marketindex/?tabSel=gold#tab_section";
		
		Document doc = Jsoup.connect(URL).get();
		Elements elements = doc.select(".tbl_exchange>tbody>tr");

		for(Element e : elements) {
			
			if(e.select(".tit").text().contains(oil)) {
				if(e.className().equals("up")) {
					et.setBlind("상승");
				}
				else if(e.className().equals("down")) {
					et.setBlind("하락");
				}
				else {
					et.setBlind("보합");
				}
				et.setChange(e.select("td.num").get(1).text());
				et.setValue(e.select(".num").get(0).text());
			}
		}

		return et;
		
	}
	
}
