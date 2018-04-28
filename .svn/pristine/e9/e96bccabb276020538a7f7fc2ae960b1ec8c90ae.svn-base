package cn.com.gtmc.glaf2.controller.common;

import cn.com.gtmc.glaf2.base.BaseController;
import cn.com.gtmc.glaf2.base.BaseService;
import cn.com.gtmc.glaf2.context.SpringContextHolder;
import cn.com.gtmc.glaf2.entity.common.Attachment;
import cn.com.gtmc.glaf2.entity.common.LogImportData;
import cn.com.gtmc.glaf2.entity.security.Dictionary;
import cn.com.gtmc.glaf2.fileimport.ImportExecutor;
import cn.com.gtmc.glaf2.service.common.AttachmentService;
import cn.com.gtmc.glaf2.service.common.LogImportDataService;
import cn.com.gtmc.glaf2.service.security.DictionaryService;
import cn.com.gtmc.glaf2.tools.log.Logger;
import cn.com.gtmc.glaf2.tools.web.ReturnMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 通用文件导入
 *
 * @author chenwandong
 */
@Controller
@RequestMapping("common/import")
public class ImportDataController implements BaseController<LogImportData> {

    private static final Logger LOG = Logger.getLogger(ImportDataController.class);

    private static final String ERROR_FOLDER = "error_folder";

    @Autowired
    private LogImportDataService mImportDataService;

    @Autowired
    private DictionaryService mDictionaryService;

    @Autowired
    private AttachmentService mAttachmentService;

    public ImportDataController() {
        LOG.info("init...");
    }

    @Override
    public BaseService getService() {
        return this.mImportDataService;
    }

    /**
     * 文件导入
     *
     * @param fileId   文件ID
     * @param executor 解析文件beanId
     * @param request  请求
     * @return 结果
     */
    @RequestMapping("imort-data")
    @ResponseBody
    public ReturnMessage importData(
            @RequestParam() int fileId,
            @RequestParam() String executor,
            javax.servlet.http.HttpServletRequest request) {
        LOG.debug("importData...{}", fileId);
        //获取文件
        Attachment attachment = this.mAttachmentService.findById(fileId);
        if (attachment == null) {
            return this.error("数据库文件ID不存在");
        }

        Dictionary dictionary = this.mDictionaryService.findByTypeCode(Dictionary.TypeCode.ATTACHMENT_FOLDER).get(0);
        java.io.File rootDir = new java.io.File(dictionary.getDictionaryValue());
        java.io.File dataFile = new java.io.File(rootDir, attachment.getFilePath());
        LOG.debug("数据文件路径:{}", dataFile.getPath());
        if (!dataFile.exists()) {
            return this.error("文件不存在");
        }

        ImportExecutor importExecutor = SpringContextHolder.getBean(executor);
        if (importExecutor == null) {
            return this.error("请配置文件解析Executor");
        }

        java.util.List<ImportExecutor.ErrorMessage> errorMessages = importExecutor.execute(dataFile, this.getRequestParams(request));

        LogImportData logImportData = new LogImportData();
        logImportData.setDataFile(dataFile.getPath());
        logImportData.setExecutor(importExecutor.getClass().getName());

        if (errorMessages == null || errorMessages.isEmpty()) {
            logImportData.setResult("1");
            this.mImportDataService.insert(logImportData);
            return this.ok();
        }

        java.io.File errorFile = this.writeErrorLog(rootDir, dataFile, errorMessages);
        logImportData.setResult("0");
        logImportData.setErrorFile(ERROR_FOLDER + java.io.File.separator + errorFile.getName());
        this.mImportDataService.insert(logImportData);

        return new ReturnMessage(2, "数据解析失败", logImportData);
    }

    private java.io.File writeErrorLog(java.io.File rootFolder, java.io.File dataFile, java.util.List<ImportExecutor.ErrorMessage> errorMessages) {

        java.io.File errorFolder = new java.io.File(rootFolder, ERROR_FOLDER);
        if (!errorFolder.exists()) {
            errorFolder.mkdir();
        }
        java.io.File errorFile = new java.io.File(errorFolder, dataFile.getName() + ".txt");
        try (java.io.FileOutputStream out = new java.io.FileOutputStream(errorFile)) {
            for (ImportExecutor.ErrorMessage em : errorMessages) {
                out.write(String.format("行:%d,列:%d,%s\r%n", em.getRow(), em.getColumn(), em.getMessage()).getBytes());
            }
            out.close();
        } catch (Exception ex) {
            LOG.error("记录文件导入错误日志错误!", ex);
        }
        return errorFile;
    }

    /**
     * 获取提交参数
     *
     * @param request 请求
     * @return 结果
     */
    private java.util.Map<String, Object> getRequestParams(javax.servlet.http.HttpServletRequest request) {
        java.util.Map<String, Object> params = new java.util.HashMap<>();

        java.util.Enumeration<String> keys = request.getParameterNames();
        while (keys.hasMoreElements()) {
            String key = keys.nextElement();
            params.put(key, request.getParameter(key));
        }

        return params;
    }
}