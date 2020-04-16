package ajax.pizza;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class CustomerInfo {
	
	
	public static void main(String[] args) {
		List<Map<String,Object>> mList = new ArrayList<Map<String,Object>>();
		Map<String,Object> mMap = new HashMap<String,Object>();
		mMap.put("mem_name", "이순신");
		mMap.put("mem_addr", "서울시 구로구 고척동");
		mMap.put("mem_tel", "010-5555-5555");
		mList.add(mMap);
		mMap = null;
		mMap = new HashMap<String,Object>();
		mMap.put("mem_name", "이성계");
		mMap.put("mem_addr", "서울시 영등포구 당산동");
		mMap.put("mem_tel", "010-4444-4444");
		mList.add(mMap);
		mMap = null;
		mMap = new HashMap<String,Object>();
		mMap.put("mem_name", "김유신");
		mMap.put("mem_addr", "서울시 금천구 가산동");
		mMap.put("mem_tel", "010-3333-3333");
		mList.add(mMap);
		Gson g = new GsonBuilder().setPrettyPrinting().create();
		String temp = g.toJson(mList);
		System.out.println(temp);
		
	}
	
	
}
