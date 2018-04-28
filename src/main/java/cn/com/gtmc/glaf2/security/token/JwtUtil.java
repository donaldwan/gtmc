package cn.com.gtmc.glaf2.security.token;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSONObject;

import cn.com.gtmc.glaf2.entity.security.User;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

@Component
public class JwtUtil {
	
    private final static String PROFILE = "JOB_WEB_TOKEN";
	
	/**
	 * 由字符串生成加密key
	 * @return
	 */
	public SecretKey generalKey(){
		String stringKey = PROFILE+Constant.JWT_SECRET;
		byte[] encodedKey = Base64.decodeBase64(stringKey);
	    SecretKey key = new SecretKeySpec(encodedKey, 0, encodedKey.length, "AES");
	    return key;
	}

	/**
	 * 创建jwt
	 * @param id
	 * @param subject
	 * @param ttlMillis
	 * @return
	 * @throws Exception
	 */
	public String createJWT(String id, String subject, long ttlMillis) throws Exception {
		SignatureAlgorithm signatureAlgorithm = SignatureAlgorithm.HS256;
		long nowMillis = System.currentTimeMillis();
		Date now = new Date(nowMillis);
		SecretKey key = generalKey();
		JwtBuilder builder = Jwts.builder()
			.setId(id)
			.setIssuedAt(now)
			.setSubject(subject)
		    .signWith(signatureAlgorithm, key);
		
		if (ttlMillis >= 0) {
		    long expMillis = nowMillis + ttlMillis;
		    Date exp = new Date(expMillis);
		    builder.setExpiration(exp);
		}
		return builder.compact();
	}
	
	public String createJWT(String id, Map<String, Object> claims, long ttlMillis) throws Exception {
		SignatureAlgorithm signatureAlgorithm = SignatureAlgorithm.HS256;
		long nowMillis = System.currentTimeMillis();
		Date now = new Date(nowMillis);
		SecretKey key = generalKey();
		JwtBuilder builder = Jwts.builder()
			.setId(id)
			.setIssuedAt(now)
			.setClaims(claims)
			
		    .signWith(signatureAlgorithm, key);		
		if (ttlMillis >= 0) {
		    long expMillis = nowMillis + ttlMillis;
		    Date exp = new Date(expMillis);
		    builder.setExpiration(exp);
		}
		return builder.compact();
	}
	
	
	
	/**
	 * 解密jwt
	 * @param jwt
	 * @return
	 * @throws Exception
	 */
	public Claims parseJWT(String jwt) throws Exception{
		SecretKey key = generalKey();
		Claims claims = Jwts.parser()         
		   .setSigningKey(key)
		   .parseClaimsJws(jwt).getBody();
		return claims;
	}
	
	/**
	 * 生成subject信息
	 * @param user
	 * @return
	 */
	public static String generalSubject(User user){
		JSONObject jo = new JSONObject();
		jo.put("loginName", user.getLoginName());
		jo.put("deptId", user.getDeptId());
		return jo.toJSONString();
	}
	
	/**
	 * 生成claim
	 * @param user
	 * @return
	 */
	public static Map<String, Object> generateClaims(User user){
		Map<String, Object> claims = new HashMap<String, Object>();
		claims.put("loginName", user.getLoginName());
		claims.put("deptId", user.getDeptId());
		return claims;
	}
}
