package cn.com.gtmc.glaf2.http;

import java.io.IOException;  
import java.io.UnsupportedEncodingException;  
import java.util.ArrayList;  
import java.util.List;
  
import org.apache.http.HttpEntity;  
import org.apache.http.NameValuePair;  
import org.apache.http.ParseException;  
import org.apache.http.client.ClientProtocolException;  
import org.apache.http.client.entity.UrlEncodedFormEntity;  
import org.apache.http.client.methods.CloseableHttpResponse;  
import org.apache.http.client.methods.HttpGet;  
import org.apache.http.client.methods.HttpPost;  
import org.apache.http.impl.client.CloseableHttpClient;  
import org.apache.http.impl.client.HttpClients;  
import org.apache.http.message.BasicNameValuePair;  
import org.apache.http.util.EntityUtils; 

/**
 * HTTP访问类
 *
 * @author 李槐军
 */
public class HttpUtil {  
  
    /** 
     * 发送 post请求访问本地应用并根据传递参数不同返回不同结果 
     */  
    public static String post(String url, List<NameValuePair> params) {  
        // 创建默认的httpClient实例.    
        CloseableHttpClient httpclient = HttpClients.createDefault();  
        // 创建httppost    
        HttpPost httppost = new HttpPost(url);  
        // 创建参数队列    
        List<NameValuePair> formparams = new ArrayList<NameValuePair>();  
        formparams.addAll(params);
        UrlEncodedFormEntity uefEntity;  
        try {  
            uefEntity = new UrlEncodedFormEntity(formparams, "UTF-8");  
            httppost.setEntity(uefEntity);
            System.out.println("executing request " + httppost.getURI());  
            CloseableHttpResponse response = httpclient.execute(httppost);  
            try {  
                HttpEntity entity = response.getEntity();  
                if (entity != null) {  
                	String en = EntityUtils.toString(entity, "UTF-8");
                    System.out.println("--------------------------------------");  
                    System.out.println("Response content: " + en);  
                    System.out.println("--------------------------------------");
                    return en;
                }  
            } finally {  
                response.close();  
            }  
        } catch (ClientProtocolException e) {  
            e.printStackTrace();  
        } catch (UnsupportedEncodingException e1) {  
            e1.printStackTrace();  
        } catch (IOException e) {  
            e.printStackTrace();  
        } finally {  
            // 关闭连接,释放资源    
            try {  
                httpclient.close();  
            } catch (IOException e) {  
                e.printStackTrace();  
            }  
        }  
        return "";
    }  
  
    /** 
     * 发送 get请求 
     */  
    public static String get(String url) {  
        CloseableHttpClient httpclient = HttpClients.createDefault();  
        try {  
            // 创建httpget.    
            HttpGet httpget = new HttpGet(url);
            System.out.println("executing request " + httpget.getURI());  
            // 执行get请求.    
            CloseableHttpResponse response = httpclient.execute(httpget);  
            try {  
                // 获取响应实体    
                HttpEntity entity = response.getEntity();  
                System.out.println("--------------------------------------");  
                // 打印响应状态    
                System.out.println(response.getStatusLine());  
                if (entity != null) {  
                	String str = EntityUtils.toString(entity);
                    // 打印响应内容长度    
                    System.out.println("Response content length: " + entity.getContentLength());  
                    // 打印响应内容    
                    System.out.println("Response content: " + str);
                    return str;
                }  
                System.out.println("------------------------------------");  
            } finally {  
                response.close();  
            }  
        } catch (ClientProtocolException e) {  
            e.printStackTrace();  
        } catch (ParseException e) {  
            e.printStackTrace();  
        } catch (IOException e) {  
            e.printStackTrace();  
        } finally {  
            // 关闭连接,释放资源    
            try {  
                httpclient.close();  
            } catch (IOException e) {  
                e.printStackTrace();  
            }  
        }  
        return null;
    }  
    
    public static void main(String[] args){
    	String url = "http://localhost:8080/plugins/schedule-job/change-status";
    	List<NameValuePair> params = new ArrayList<NameValuePair>();
    	params.add(new BasicNameValuePair("id","111"));
    	params.add(new BasicNameValuePair("status","A"));
    	post(url,params);
    }
}
