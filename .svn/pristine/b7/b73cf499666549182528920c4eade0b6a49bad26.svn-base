package cn.com.gtmc.glaf2.controller.common;

import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import cn.com.gtmc.glaf2.base.BaseController;
import cn.com.gtmc.glaf2.base.BaseService;
import cn.com.gtmc.glaf2.entity.common.Document;
import cn.com.gtmc.glaf2.entity.security.Dictionary;
import cn.com.gtmc.glaf2.http.DocumentManagementHttpUtil;
import cn.com.gtmc.glaf2.service.common.DocumentService;
import cn.com.gtmc.glaf2.service.notify.MessageService;
import cn.com.gtmc.glaf2.service.security.DictionaryService;
import cn.com.gtmc.glaf2.tools.DateUtil;
import cn.com.gtmc.glaf2.tools.log.Logger;
import cn.com.gtmc.glaf2.tools.web.ReturnMessage;


/**
 * @author  dream.li 
 * @version V1.0 
 * @Title DocumentController
 * @Package cn.com.intasect.controller.common
 * @Description:  文档管理控制类
 * @date 2017年7月12日 下午4:08:32 
 */
@Controller
@RequestMapping("common/document")
public class DocumentController implements BaseController<Document>{

	private static final Logger LOG = Logger.getLogger(DocumentController.class);
	
	@Autowired
	private DocumentService documentService;
	
	@Autowired
    private DictionaryService mDictionaryService;
	
	@Autowired
    private MessageService mMessageService;
	
	public DocumentController(){
		LOG.info("init...");
	}
	
	@Override
	public BaseService getService() {
		return this.documentService;
	}
	
	
	/**
	 * 文档管理系统  -- 关联业务表
	 * @return
	 */
	@RequestMapping("referBusiness")
	public ModelAndView documentManagementReferBusiness(){
		return new ModelAndView("common/document/referBusiness");
	}
	
	
	/**
	 * 文档管理系统  -- 关联部门用户
	 * @return
	 */
	@RequestMapping("referDeptUser")
	public ModelAndView documentManagementReferDeptUser(){
		return new ModelAndView("common/document/referDeptUser");
	}
	
	/**
	 * 
	 * @return
	 */
	@RequestMapping(value = "fileView",method = RequestMethod.GET)
	public ModelAndView fileView(String path,HttpServletRequest servletRequest){
		LOG.debug("fileView...文件在线浏览");
		//String path = (String)servletRequest.getParameter("path");
		ModelAndView mv = new ModelAndView("common/document/fileView");
		DocumentManagementHttpUtil dmu = new DocumentManagementHttpUtil();
		try {
			//path = URLEncoder.encode(path,"utf-8");
			path = new String(path.getBytes(getEncoding(path)), "UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		path = "http://172.16.3.12/default/" + path;
		System.out.println("文档浏览：" + path);
		mv.addObject("token", dmu.getToken());
		mv.addObject("path", path);
		return mv;
	}
	
	
	/**
	 * 判断字符编码
	 * @param str
	 * @return
	 */
	public String getEncoding(String str) {      
	       String encode = "GB2312";      
	      try {      
	          if (str.equals(new String(str.getBytes(encode), encode))) {      //判断是不是GB2312
	               String s = encode;      
	              return s;      //是的话，返回“GB2312“，以下代码同理
	           }      
	       } catch (Exception exception) {      
	       }      
	       encode = "ISO-8859-1";      
	      try {      
	          if (str.equals(new String(str.getBytes(encode), encode))) {      //判断是不是ISO-8859-1
	               String s1 = encode;      
	              return s1;      
	           }      
	       } catch (Exception exception1) {      
	       }      
	       encode = "UTF-8";      
	      try {      
	          if (str.equals(new String(str.getBytes(encode), encode))) {   //判断是不是UTF-8
	               String s2 = encode;      
	              return s2;      
	           }      
	       } catch (Exception exception2) {      
	       }      
	       encode = "GBK";      
	      try {      
	          if (str.equals(new String(str.getBytes(encode), encode))) {      //判断是不是GBK
	               String s3 = encode;      
	              return s3;      
	           }      
	       } catch (Exception exception3) {      
	       }      
	      return "";        //如果都不是，说明输入的内容不属于常见的编码格式。
	   }
	
	
	/**
	 * 文档管理系统--文件上传
	 * @return
	 */
	@RequestMapping("upload")
	@ResponseBody
	public ReturnMessage upload(HttpServletRequest servletRequest){
		LOG.debug("upload...");
		java.util.List<Document> documents = new java.util.ArrayList<>();
		try {
			/*java.util.List<Dictionary> dictionaries = this.mDictionaryService.findByTypeCode(Dictionary.TypeCode.DOCUMENT_FOLDER);
			if (dictionaries.isEmpty()) {
                return this.error("请配置上传文件保存位置!");
            }
			Dictionary dictionary = dictionaries.get(0);
			java.io.File rootDir = new java.io.File(dictionary.getDictionaryValue());
            java.util.Date today = new java.util.Date();
            String fileMonth = DateUtil.formatDate(today, "yyyyMMddHH");
            java.io.File fileDir = new java.io.File(rootDir, fileMonth);
            if (!fileDir.exists()) {
                fileDir.mkdir();
            }*/
            //java.util.Random random = new java.util.Random();

            MultipartHttpServletRequest mhst = (MultipartHttpServletRequest) servletRequest;
            java.util.Map<String, MultipartFile> map = mhst.getFileMap();
            
            //其他参数
            java.util.Map<String,String[]> mapPara = mhst.getParameterMap();
            String referType = mapPara.get("referType")==null?null:(String)mapPara.get("referType")[0];//关联类型
            String referKey = mapPara.get("referKey")==null?null:(String)mapPara.get("referKey")[0];//关联主键
            String filePath =  mapPara.get("filePath")==null?null:(String)mapPara.get("filePath")[0];//保存在文档管理系统的文件路径
            System.out.println(filePath);
            String permissionDown =  mapPara.get("permissionDown")==null?null:(String)mapPara.get("permissionDown")[0];//是否允许下载
            String permissionType =  mapPara.get("permissionType")==null?null:(String)mapPara.get("permissionType")[0];//权限类型
            String permissionUser =  mapPara.get("permissionUser")==null?null:(String)mapPara.get("permissionUser")[0];//权限人员
            String permissionDept =  mapPara.get("permissionDept")==null?null:(String)mapPara.get("permissionDept")[0];//权限部门
            String permissionRole =  mapPara.get("permissionRole")==null?null:(String)mapPara.get("permissionRole")[0];//权限角色
            
            
            for (Map.Entry<String, MultipartFile> entry : map.entrySet()) {
                MultipartFile file = entry.getValue();
                //文件转化
               // CommonsMultipartFile cf= (CommonsMultipartFile)file; 
               // DiskFileItem fi = (DiskFileItem)cf.getFileItem(); 
               // java.io.File uploadfile = fi.getStoreLocation();
                String fileName = file.getOriginalFilename();//文件名称
                long fileSize = file.getSize();//文件大小
                String fileSuffix = fileName.substring(fileName.lastIndexOf('.') + 1);//文件类型
                //保存在本地
                //String localFileName = String.format("%s_%04d", DateUtil.formatDate(today, "yyyyMMddHHmmss"), random.nextInt(10000));
                //file.transferTo(new java.io.File(fileDir,String.format("%s.%s",localFileName,fileSuffix)));
                //上传文件到文档管理系统
                DocumentManagementHttpUtil dmu = new DocumentManagementHttpUtil();
                if(!dmu.fileUpload(file.getInputStream(), "", filePath,fileName)){
             	   //System.out.println("上传至文档管理系统异常!");
             	   return this.error("上传至文档管理系统异常!");
                }
                
                Document document = new Document();
                document.setFileName(fileName);
                document.setFileType(fileSuffix);
                document.setFileSize(fileSize);
                
                document.setReferType(referType);
                document.setReferKey(referKey);
                document.setFilePath(filePath);
                if(null != permissionDown && !"".equals(permissionDown)){
                	document.setPermissionDown(Integer.parseInt(permissionDown));
                }
                
                document.setPermissionType(permissionType);
                document.setPermissionUser(permissionUser);
                document.setPermissionDept(permissionDept);
                document.setPermissionRole(permissionRole);
                //document.setFilePath(String.format("/%s/%s.%s",fileMonth,localFileName,fileSuffix));
                this.documentService.insert(document);
                documents.add(document);
            }
		 } catch (Exception ex) {
	         LOG.error("upload error!", ex);
	         ex.printStackTrace();
	         return this.error(ex.getMessage());
	     }
		 return this.ok(documents);
	}
	
	/**
	 * 文档管理系统--文件下载
	 * @return
	 */
	@RequestMapping("download/{id}")
	public void download(@PathVariable() int id, HttpServletResponse response){
		LOG.debug("download...");
		
		 try {
			 Document document =  this.documentService.findById(id);
	            if (document == null) {
	                LOG.warn("ID:" + id + "，无对应的文件");
	            } else {
	                DocumentManagementHttpUtil dmu = new DocumentManagementHttpUtil();
	                String filePath = new String(document.getFilePath().getBytes(getEncoding(document.getFilePath())),"UTF-8");
	                String fileName = new String(document.getFileName().getBytes(getEncoding(document.getFileName())),"UTF-8");
	                java.io.InputStream is = dmu.fileDownload("", filePath+"/"+fileName);
	                if(is != null){
	                	response.setContentType("multipart/form-data");
		                response.setHeader("Content-Disposition", "attachment;fileName=" + new String(fileName.getBytes("GBK"), "ISO8859-1"));
		                java.io.OutputStream out = response.getOutputStream();
		                try {
		                    out.write(IOUtils.toByteArray(is));
		                    out.flush();
		                } finally {
		                    out.close();
		                    is.close();
		                }
	                }
	            }
	        } catch (Exception ex) {
	        	ex.printStackTrace();
	            LOG.error("文件下载失败!", ex);
	        }
	}
	
	

	/**
	 * 组织信息同步测试
	 * @return
	 */
	@RequestMapping("syncDept")
	public ModelAndView syncDept(){
		return new ModelAndView("common/document/syncDept");
	}
	
}
