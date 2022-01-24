package info;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import vo.Exchange_today;

public class exchange_rate {

	public static Exchange_today today(String contry) throws IOException {
		Exchange_today et = new Exchange_today();
		
		String URL = "https://finance.naver.com/marketindex/?tabSel=exchange#tab_section";
		
		Document doc = Jsoup.connect(URL).get();
		Elements e1 = doc.getElementsByAttributeValue("class", "data");
		Elements e2 = e1.select("#exchangeList>li");

		for(Element e : e2) {
			if(e.text().contains(contry)) {
				 if(e.select(".blind").text().contains("상승")) { 
					 et.setBlind("상승"); 
				}
				 else if(e.select(".blind").text().contains("하락")) {
					 et.setBlind("하락"); 
				}
				 else {
					 et.setBlind("보합");
				 }
				 et.setChange(e.select(".change").text());
				 et.setValue(e.select(".value").text());
			}
		}

		return et;
		
	}

}