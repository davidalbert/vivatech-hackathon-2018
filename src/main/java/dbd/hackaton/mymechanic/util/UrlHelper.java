package dbd.hackaton.mymechanic.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class UrlHelper {

	public static String addParameterToUrl(
			String url,
			String paramterName,
			String parameterValue) {
		
		if(url.contains("?")) {
			url+="&";
		}else {
			url+="?";
		}
		
		try {
			url+=paramterName+"="+URLEncoder.encode(parameterValue, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return url;
	}
}
