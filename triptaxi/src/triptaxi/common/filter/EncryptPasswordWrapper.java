package triptaxi.common.filter;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncryptPasswordWrapper extends HttpServletRequestWrapper {

	public EncryptPasswordWrapper(HttpServletRequest request) {
		super(request);
	}
	
	//암호화를 하기 위해 client가 보낸 데이터를 불러오는
	//getParameter매소드를 오버라이딩 처리
	@Override
	public String getParameter(String key) {
		String value="";
		if(key!=null && (key.equals("password")||key.equals("enroll_password")
				/*||key.equals("cPw")
				||key.equals("nPw")*/)){
			value=getSha512(super.getParameter(key));
			
		}else {
			value=super.getParameter(key);
		}
		return value;
	}
	
	private static String getSha512(String password) {
		
		MessageDigest md=null;
		try {
			md=MessageDigest.getInstance("SHA-512");
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		byte[] bytes;
		try {
			
			bytes=password.getBytes("UTF-8");
			md.update(bytes);
		}catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String encPw=Base64.getEncoder().encodeToString(md.digest());
		
		return encPw;		
		
	}
	
	
}





