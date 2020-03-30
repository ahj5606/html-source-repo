package web.crawling;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class WebCrawling {
	void methodA() {
		try {
			//크롤링할 URL 입력받기
			URL url = new URL("http://localhost:8000/dev_html/day4/deptList2.jsp");
			InputStreamReader isr = new InputStreamReader(url.openStream());
			BufferedReader br = new BufferedReader(isr);
			String tags = null;
			StringBuilder sb = new StringBuilder();
			while((tags = br.readLine())!=null) {
				sb.append(tags);
			}
			br.close();
			//크롤링 시작 - 키(타이틀)
			List<String> titleList = new ArrayList<String>();
			String strs[] = sb.toString().split("<th>");
			String strs2[] = null;
			for(int i=1;i<strs.length;i++) {
				strs2 =strs[i].split("</th>");
				titleList.add(strs2[0]);
			}
			for(String str:titleList) {
				System.out.println(str);
			}
			List<String> dataList = new ArrayList<String>();
			String datas[] = sb.toString().split("<td>");
			String datas2[] = null;
			for(int i =1 ; i<datas.length;i++) {
				datas2 = datas[i].split("</td>");
				dataList.add(datas2[0]);
			}
			for(String str:dataList) {
				System.out.println(str);
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public static void main(String[] args) {
		WebCrawling wc = new WebCrawling();
		wc.methodA();
	}
}
