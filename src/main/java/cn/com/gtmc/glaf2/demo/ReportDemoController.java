package cn.com.gtmc.glaf2.demo;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.com.gtmc.glaf2.entity.common.Attachment;
import cn.com.gtmc.glaf2.entity.security.Dictionary;
import cn.com.gtmc.glaf2.plugin.report.impl.DBReport;
import cn.com.gtmc.glaf2.service.common.AttachmentService;
import cn.com.gtmc.glaf2.service.security.DictionaryService;
import net.sf.jasperreports.export.OutputStreamExporterOutput;
import net.sf.jasperreports.export.SimpleOutputStreamExporterOutput;

/**
 * 报表Demo
 * @author chenwandong
 *
 */
@Controller
@RequestMapping("demo/common-demo")
public class ReportDemoController {
	
	@Resource(name="dataSource")
	private javax.sql.DataSource mDataSource;
	
	@Autowired
	private AttachmentService mAttachmentService;
	
	@Autowired
	private DictionaryService mDictionaryService;
	
	/**
	 * 进入报表
	 * @return
	 */
	@RequestMapping("report")
	public ModelAndView report(){
		return new ModelAndView("demo/common-demo/report");
	}
	
	/**
	 * 根据JasperFile文件导出PDF报表
	 * @param fileId
	 * @param httpServletResponse
	 */
	@RequestMapping("export-jasper-pdf")
	public void exportByJasperFileForPDF(String fileId,javax.servlet.http.HttpServletResponse httpServletResponse){
		try{
			DBReport dbReport = new DBReport();
			dbReport.setDataSource(this.mDataSource);
			dbReport.setJasperFile(this.getReportFile(fileId));
			
			//额外的参数
			dbReport.setParameters(new java.util.HashMap<>());
			
			dbReport.exportPDF(this.getOutByResponse(httpServletResponse,"PDF"));
			
			
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	/**
	 * 根据JasperFile文件导出execl报表
	 * @param fileId
	 * @param httpServletResponse
	 */
	@RequestMapping("export-jasper-execl")
	public void exportByJasperFileForExecl(String fileId,javax.servlet.http.HttpServletResponse httpServletResponse){
		try{
			DBReport dbReport = new DBReport();
			dbReport.setDataSource(this.mDataSource);
			dbReport.setJasperFile(this.getReportFile(fileId));
			//额外的参数
			dbReport.setParameters(new java.util.HashMap<>());
			OutputStreamExporterOutput exporterOutput = new SimpleOutputStreamExporterOutput(this.getOutByResponse(httpServletResponse,"EXECL"));  
			dbReport.exportXls(exporterOutput);
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	/**
	 * 根据JrxmlFile文件导出PDF报表
	 * @param fileId
	 * @param httpServletResponse
	 */
	@RequestMapping("export-jrxml-pdf")
	public void exportByJrxmlFileForPDF(String fileId,javax.servlet.http.HttpServletResponse httpServletResponse){
		try{
			DBReport dbReport = new DBReport();
			dbReport.setDataSource(this.mDataSource);
			dbReport.setJrxmlFile(this.getReportFile(fileId));
			
			//额外的参数
			dbReport.setParameters(new java.util.HashMap<>());
			
			dbReport.exportPDF(this.getOutByResponse(httpServletResponse,"PDF"));
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	/**
	 * 根据JrxmlFile文件导出PDF报表
	 * @param fileId
	 * @param httpServletResponse
	 */
	@RequestMapping("export-jrxml-execl")
	public void exportByJrxmlFileForEXECL(String fileId,javax.servlet.http.HttpServletResponse httpServletResponse){
		try{
			DBReport dbReport = new DBReport();
			dbReport.setDataSource(this.mDataSource);
			dbReport.setJrxmlFile(this.getReportFile(fileId));
			//额外的参数
			dbReport.setParameters(new java.util.HashMap<>());
			OutputStreamExporterOutput exporterOutput = new SimpleOutputStreamExporterOutput(this.getOutByResponse(httpServletResponse,"EXECL"));
			dbReport.exportXls(exporterOutput);
			
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	private java.io.File getReportFile(String fileId){
		
		Dictionary dictionary = this.mDictionaryService.findByTypeCode(Dictionary.TypeCode.ATTACHMENT_FOLDER).get(0);
		java.io.File rootFolder = new java.io.File(dictionary.getDictionaryValue());
		Attachment attachment = this.mAttachmentService.findById(fileId);
		return new java.io.File(rootFolder,attachment.getFilePath());
		
	}
	
	private java.io.OutputStream getOutByResponse(javax.servlet.http.HttpServletResponse response,String type) throws Exception{
		response.reset();
		if(type.equals("PDF")){
			response.addHeader("Content-Type", "application/pdf");
			response.addHeader("Content-Disposition","inline;filename=" + new String("Demo报表".getBytes("gbk"), "iso8859-1") + ".pdf");
		}
		if(type.equals("EXECL")){
			response.setContentType("application/vnd.ms-excel");  
			response.addHeader("Content-Type", "application/vnd.ms-excel");
			response.addHeader("Content-Disposition","attachment;filename=" + new String("Demo报表".getBytes("gbk"), "iso8859-1") + ".xls");
		}
		return response.getOutputStream();
	}	
	
}
