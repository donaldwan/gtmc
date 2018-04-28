package cn.com.gtmc.glaf2.http;

import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
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
 * @author  dream.li 
 * @version V1.0 
 * @Title DocumentManagementUtil
 * @Package cn.com.intasect.controller.common.util
 * @Description:  文档管理系统Util类
 * @date 2017年7月12日 下午4:30:17 
 */
public class DocumentManagementHttpUtil {

	private static final Logger LOG = Logger.getLogger(DocumentManagementHttpUtil.class);
	
	private static String tokenUri;//获取token信息的uri
	private static String downloadUri;//文档管理系统下载uri
	private static String uploadUri;//文档管理系统上传uri
	private static String username;//账号登陆名
	private static String password;//登陆密码
	private static String client_id;//应用的ID，默认值： test
	private static String grant_type;//固定值： ‘password’
	private static String instance;//默认值：default
	private static String client_secret;//应用的密钥，默认值：022127e182a934dea7d69s10697s8ac2
	private static String account;//默认值：zopen
	private static String charset;//默认值：UTF-8
	
	public DocumentManagementHttpUtil(){
		LOG.info("init...");
		getConfigProperties();
	}
	
	/**
	 * 配置文档管理系统参数信息
	 */
	private void getConfigProperties(){
		//读取配置文件uri配置信息
		Properties prop =  new  Properties();   
        InputStream in = this.getClass().getClassLoader().getResourceAsStream("config.properties");
        try{  
            prop.load(in);
            DocumentManagementHttpUtil.tokenUri = prop.getProperty("documentManagement.tokenUri").trim(); 
            DocumentManagementHttpUtil.downloadUri = prop.getProperty("documentManagement.downloadUri").trim(); 
            DocumentManagementHttpUtil.uploadUri = prop.getProperty("documentManagement.uploadUri").trim(); 
            DocumentManagementHttpUtil.username = prop.getProperty("documentManagement.username").trim(); 
            DocumentManagementHttpUtil.password = prop.getProperty("documentManagement.password").trim(); 
            DocumentManagementHttpUtil.client_id = prop.getProperty("documentManagement.client_id").trim(); 
            DocumentManagementHttpUtil.grant_type = prop.getProperty("documentManagement.grant_type").trim(); 
            DocumentManagementHttpUtil.instance = prop.getProperty("documentManagement.instance").trim(); 
            DocumentManagementHttpUtil.client_secret = prop.getProperty("documentManagement.client_secret").trim(); 
            DocumentManagementHttpUtil.account = prop.getProperty("documentManagement.account").trim(); 
            DocumentManagementHttpUtil.charset = prop.getProperty("documentManagement.charset").trim(); 
        }catch (IOException e) { 
        	e.printStackTrace();
        	LOG.error("文档管理系统读取配置文件异常",e);
        }catch (Exception e) { 
        	e.printStackTrace();
        	LOG.error("文档管理系统读取配置文件异常",e);
        }finally {
        	try {
    			if(in!=null){
    				in.close();
    				in = null;
    			}
			} catch (Exception ex) {
				ex.printStackTrace();
				LOG.error("文档管理系统读取配置文件异常",ex);
			}
		}

	}
	
	/**
	 * 获取token信息
	 * @return
	 */
	public String getToken(){
		LOG.info("文档管理系统获取token信息...");
		String result = "";
		String token = "";
		InputStream is = null;
		CloseableHttpClient httpclient = null;
		try {
			// 创建默认的httpClient实例.    
	        httpclient = HttpClients.createDefault();  
	        HttpPost httppost = new HttpPost(tokenUri); 
			//httpclient.setConnectionTimeout(8000);
			//httpclient.getParams().setContentCharset(charset);
	        
			//设置post方法请求参数
	        List<NameValuePair> formparams = new ArrayList<NameValuePair>(); 
	        formparams.add(new BasicNameValuePair("client_id",client_id));
	        formparams.add(new BasicNameValuePair("client_secret",client_secret));
	        formparams.add(new BasicNameValuePair("grant_type",grant_type));
	        formparams.add(new BasicNameValuePair("username",username));
	        formparams.add(new BasicNameValuePair("password",password));
	        formparams.add(new BasicNameValuePair("account",account));
	        
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
							//System.out.println("获取token信息成功.....,result=" + result);
							LOG.info("获取token信息成功.....,result=" + result);
						}
					} else {
						//System.out.println("获取token信息失败.....,result=" + result);
						LOG.info("获取token信息失败.....,result=" + result);
					}
				}
			} finally {
				response.close();
			}
	        } catch (Exception e) {  
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

	/**
	 * 传文件到文档管理系统
	 * @param inputStream
	 * @param uid          保存在文档管理系统的文件uid(与path任选其一)
	 * @param path         保存在文档管理系统的文件路径(与uid任选其一)
	 * @param newFileName  保存在文档管理系统的文件新名称
	 * @return
	 */
	public boolean fileUpload(InputStream inputStream, String uid, String path, String newFileName) {
		LOG.info("文档管理系统文件上传...请求参数:filePath=" + inputStream + ",uid="+uid+",path=" + path + ",newName="+newFileName);
		boolean result = false;
		
		String token = this.getToken();
		if(null == token ||  "".equals(token)){
			LOG.info("文档管理系统文件上传...获取token信息失败");
			return result;
		}
		String resultInfo = "";
		CloseableHttpClient httpclient = null;
		try {
			path = URLEncoder.encode(path,"utf-8");
			newFileName = URLEncoder.encode(newFileName,"utf-8");
			String uri = uploadUri +"?account="+ account + "&instance=" + instance +"&path="+ path +"&filename="+ newFileName +"&access_token="+token+"&uid=" + uid;
			System.out.println(uri);
			httpclient = HttpClients.createDefault(); 
			HttpPost httppost = new HttpPost(uri);
			InputStreamEntity inputEntity = new InputStreamEntity(inputStream);
			httppost.setEntity(inputEntity);
			CloseableHttpResponse response = httpclient.execute(httppost);  
			try {
				HttpEntity entity = response.getEntity();
				if (entity != null) {
					resultInfo = EntityUtils.toString(entity, charset);
					if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
						JSONObject js = JSONObject.parseObject(resultInfo);
						if (null != js.get("uid") || !"".equals(js.get("uid"))) {
							result = true;
							//System.out.println("文件上传成功.....,resultInfo=" + resultInfo);
							LOG.info("文件上传成功.....,resultInfo=" + resultInfo);
						}else{
							//System.out.println("文件上传失败.....,resultInfo=" + resultInfo);
							LOG.info("文件上传失败.....,resultInfo=" + resultInfo);
						}
					} else {
						//System.out.println("文件上传失败.....,resultInfo=" + resultInfo);
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

	/**
	 * 下载文档管理系统文件
	 * @param uid
	 * @param path
	 * @return
	 */
	public InputStream fileDownload(String uid, String path) {
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
