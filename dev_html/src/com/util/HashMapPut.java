package com.util;

import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

public class HashMapPut {
	public Map<String,Object> putHashMap(Map<String,Object> pMap,String Key,String data){
		if(data!=null) {
			pMap.put(Key,data);
		}else {
			pMap.put(Key,"");
		}
		return pMap;
	}
}
