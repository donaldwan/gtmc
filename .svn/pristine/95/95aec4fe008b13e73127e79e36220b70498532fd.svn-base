package cn.com.gtmc.glaf2.http;

import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import org.apache.http.HttpEntity;
import org.apache.http.HttpStatus;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.InputStreamEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import com.alibaba.fastjson.JSONObject;
import cn.com.gtmc.glaf2.tools.log.Logger;

/**
 * @author dream.li
 * @version V1.0
 * @Title DocumentHttpTest
 * @Package cn.com.gtmc.glaf2.http
 * @Description:
 * @date 2017年7月21日 上午11:10:47
 */
public class DocumentHttpTest {

	private static final Logger LOG = Logger.getLogger(DocumentHttpTest.class);

	// 账号登陆名
	private static String username = "admin";
	// 登陆密码
	private static String password = "admin123";
	// 应用的ID，默认值： test
	private static String client_id = "test";
	// 固定值： ‘password’
	private static String grant_type = "password";
	// 默认值：default
	private static String instance = "default";
	// 应用的密钥，默认值：022127e182a934dea7d69s10697s8ac2
	private static String client_secret = "022127e182a934dea7d69s10697s8ac2";
	// 默认值：zopen
	private static String account = "zopen";
	// 编码方式
	private static String charset = "UTF-8";

	private static String tokenUri = "http://172.16.3.12/org_api/api/v1/oauth2/access_token";
	private static String uploadUri = "http://172.16.3.12/wo_api/api/v2/content/upload";
	private static String downloadUri = "http://172.16.3.12/wo_api/api/v1/content/download";

	public static void main(String[] args) {

		DocumentHttpTest t = new DocumentHttpTest();

		String ss = t.getToken();

		System.out.println(ss);

	}

	/**
	 * 获取token信息
	 * 
	 * @return
	 */
	public String getToken() {
		String result = "";
		String token = "";
		CloseableHttpClient httpclient = null;
		try {
			// 创建默认的httpClient实例.
			httpclient = HttpClients.createDefault();
			HttpPost httppost = new HttpPost(tokenUri);

			// 设置post方法请求参数
			List<NameValuePair> formparams = new ArrayList<NameValuePair>();
			formparams.add(new BasicNameValuePair("client_id", client_id));
			formparams.add(new BasicNameValuePair("client_secret", client_secret));
			formparams.add(new BasicNameValuePair("grant_type", grant_type));
			formparams.add(new BasicNameValuePair("username", username));
			formparams.add(new BasicNameValuePair("password", password));
			formparams.add(new BasicNameValuePair("account", account));

			UrlEncodedFormEntity uefEntity;
			uefEntity = new UrlEncodedFormEntity(formparams, "UTF-8");
			httppost.setEntity(uefEntity);
			CloseableHttpResponse response = httpclient.execute(httppost);
			try {
				HttpEntity entity = response.getEntity();
				if (entity != null) {
					result = EntityUtils.toString(entity, charset);
					if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
						JSONObject js = JSONObject.parseObject(result);
						if (null != js.get("access_token")) {
							token = (String) js.get("access_token");
							System.out.println("获取token信息成功.....,result=" + result);
							LOG.info("获取token信息成功.....,result=" + result);
						}
					} else {
						System.out.println("获取token信息失败.....,result=" + result);
						LOG.info("获取token信息失败.....,result=" + result);
					}
				}
			} finally {
				response.close();
			}

		} catch (Exception e) {
			LOG.error("文档管理系统获取token信息...error!!!", e);
			e.printStackTrace();
		} finally {
			// 关闭连接,释放资源
			try {
				httpclient.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return token;
	}

	public boolean fileUpload(InputStream input, String uid, String path, String newName) {
		LOG.info("文档管理系统文件上传...请求参数:filePath=" + input + ",uid=" + uid + ",path=" + path + ",newName=" + newName);
		boolean result = false;
		String token = this.getToken();
		if (null == token || "".equals(token)) {
			LOG.info("文档管理系统文件上传...获取token信息失败");
			return result;
		}
		String resultInfo = "";
		CloseableHttpClient httpclient = null;
		try {
			path = URLEncoder.encode(path, charset);
			newName = URLEncoder.encode(newName, charset);
			String uri = uploadUri + "?account=" + account + "&instance=" + instance + "&path=" + path + "&filename="
					+ newName + "&access_token=" + token + "&uid=" + uid;
			httpclient = HttpClients.createDefault();
			HttpPost httppost = new HttpPost(uri);
			//
			InputStreamEntity inputEntry = new InputStreamEntity(input);
			httppost.setEntity(inputEntry);
			CloseableHttpResponse response = httpclient.execute(httppost);
			try {
				HttpEntity entity = response.getEntity();
				if (entity != null) {
					resultInfo = EntityUtils.toString(entity, charset);
					if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
						JSONObject js = JSONObject.parseObject(resultInfo);
						if (null != js.get("uid") || !"".equals(js.get("uid"))) {
							result = true;
							System.out.println("文件上传成功.....,resultInfo=" + resultInfo);
							LOG.info("文件上传成功.....,resultInfo=" + resultInfo);
						}else{
							System.out.println("文件上传失败.....,resultInfo=" + resultInfo);
							LOG.info("文件上传失败.....,resultInfo=" + resultInfo);
						}
					} else {
						System.out.println("文件上传失败.....,resultInfo=" + resultInfo);
						LOG.info("文件上传失败.....,resultInfo=" + resultInfo);
					}
				}
			} finally {
				response.close();
			}
		} catch (Exception e) {
			LOG.error("文档管理系统文件上传...error!!!", e);
		}
		return result;
	}
	
	
	
	public InputStream fileDownload(String uid,String path){
		LOG.info("文档管理系统文件下载...请求参数:uid=" + uid + ",path=" +path);
		String token = this.getToken();
		if(null == token ||  "".equals(token)){
			LOG.info("文档管理系统文件下载...获取token信息失败");
			return null;
		}
		CloseableHttpClient httpclient = null;
		InputStream is = null;
		try {
			path = URLEncoder.encode(path,charset);
		    String uri  = downloadUri + "?account="+ account +"&instance=" + instance + "&uid=" + uid+ "&path="+ path +"&access_token=" + token;
		   // System.out.println(uri);
		    httpclient = HttpClients.createDefault();
		    HttpGet httpget = new HttpGet(uri);
		    CloseableHttpResponse response = httpclient.execute(httpget);
		    HttpEntity entity = response.getEntity();
		    is = entity.getContent();
			if(response.getStatusLine().getStatusCode() != HttpStatus.SC_OK){
				String resultInfo = EntityUtils.toString(entity, charset);
				LOG.error("文件下载-文档管理系统返回信息:" + resultInfo);
				is = null;
			}
		} catch (Exception e) {
			LOG.error("文档管理系统文件下载...error!!!",e);
		}
		return is;
	}
	
	
	

}
