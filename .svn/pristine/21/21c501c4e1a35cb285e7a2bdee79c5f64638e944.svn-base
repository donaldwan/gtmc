package cn.com.gtmc.glaf2.controller.common;

import cn.com.gtmc.glaf2.base.BaseController;
import cn.com.gtmc.glaf2.base.BaseService;
import cn.com.gtmc.glaf2.entity.common.Attachment;
import cn.com.gtmc.glaf2.entity.notify.Message;
import cn.com.gtmc.glaf2.entity.security.Dictionary;
import cn.com.gtmc.glaf2.service.common.AttachmentService;
import cn.com.gtmc.glaf2.service.notify.MessageService;
import cn.com.gtmc.glaf2.service.security.DictionaryService;
import cn.com.gtmc.glaf2.tools.DateUtil;
import cn.com.gtmc.glaf2.tools.log.Logger;
import cn.com.gtmc.glaf2.tools.web.ReturnMessage;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * 通用附件Controller
 *
 * @author chenwandong
 */
@Controller
@RequestMapping("common/attachment")
public class AttachmentController implements BaseController<Attachment> {

    private static final Logger LOG = Logger.getLogger(AttachmentController.class);

    @Autowired
    private AttachmentService mAttachmentService;

    @Autowired
    private DictionaryService mDictionaryService;

    @Autowired
    private MessageService mMessageService;

    public AttachmentController() {
        LOG.info("init...");
    }


    @Override
    public BaseService getService() {
        return this.mAttachmentService;
    }

    /**
     * 文件上传
     *
     * @return 返回信息
     */
    @RequestMapping(value = "upload", method = RequestMethod.POST)
    @ResponseBody
    public ReturnMessage upload(HttpServletRequest servletRequest) {
        LOG.debug("upload...");
        java.util.List<Attachment> attachments = new java.util.ArrayList<>();
        try {

            java.util.List<Dictionary> dictionaries = this.mDictionaryService.findByTypeCode(Dictionary.TypeCode.ATTACHMENT_FOLDER);

            if (dictionaries.isEmpty()) {
                return this.error("请配置上传文件保存位置!");
            }

            MultipartHttpServletRequest mhst = (MultipartHttpServletRequest) servletRequest;
            java.util.Map<String, MultipartFile> map = mhst.getFileMap();

            String extParams = servletRequest.getHeader("extParams");
            this.mAttachmentService.batchInsert(map,extParams,dictionaries,attachments);
            
        } catch (Exception ex) {
            LOG.error("upload error!", ex);
            return this.error(ex.getMessage());
        }
        return this.ok(attachments);
    }

    /**
     * 通用文件下载(文件文件ID下载)
     *
     * @param id 文件ID
     */
    @RequestMapping("download/{id}")
    public void download(@PathVariable() int id, HttpServletResponse response) {
        try {
            Dictionary dictionary = this.mDictionaryService.findByTypeCode(Dictionary.TypeCode.ATTACHMENT_FOLDER).get(0);
            Attachment attachment = this.mAttachmentService.findById(id);
            if (attachment == null) {
                LOG.warn("ID:" + id + "，无对应的文件");
            } else {
                java.io.File folder = new java.io.File(dictionary.getDictionaryValue());
                java.io.File file = new java.io.File(folder, attachment.getFilePath());
                this.downloadFile(file, attachment.getFileName(), response);
            }
        } catch (Exception ex) {
            LOG.error("文件下载失败!", ex);
        }
    }

    /**
     * 根据文件相对路径下载
     *
     * @param path     路径
     * @param response 响应
     */
    @RequestMapping("download")
    public void download(String path, HttpServletResponse response) {
        Dictionary dictionary = this.mDictionaryService.findByTypeCode(Dictionary.TypeCode.ATTACHMENT_FOLDER).get(0);
        java.io.File folder = new java.io.File(dictionary.getDictionaryValue());
        java.io.File file = new java.io.File(folder, path);
        this.downloadFile(file, file.getName(), response);
    }

    private void downloadFile(java.io.File file, String fileName, HttpServletResponse response) {
        try {
            if (file == null || !file.exists()) {
                LOG.warn("文件:" + (file == null ? "" : file.getPath()) + "，不存在!");
            } else {
                response.setContentType("multipart/form-data");
                response.setHeader("Content-Disposition", "attachment;fileName=" + new String(fileName.getBytes("GBK"), "ISO8859-1"));

                try (java.io.OutputStream out = response.getOutputStream()) {
                    out.write(FileUtils.readFileToByteArray(file));
                    out.flush();
                }
            }
        } catch (Exception ex) {
            LOG.error("文件下载失败", ex);
        }
    }


    /**
     * 打包文件
     *
     * @param param 参数
     * @return 结果信息
     */
    @RequestMapping("download/package")
    @ResponseBody
    public ReturnMessage downloadPackage(@RequestBody Map<String, List> param) {
        try {
            List ids = param.get("ids");
            List paths = param.get("paths");
            List<File> fileList = new ArrayList<>();
            File folder = null;
            if (ids != null && !ids.isEmpty()) {
                Dictionary dictionary = this.mDictionaryService.findByTypeCode(Dictionary.TypeCode.ATTACHMENT_FOLDER).get(0);
                List<Attachment> attachments = this.mAttachmentService.findByIds((Integer[]) ids.toArray(new Integer[ids.size()]));
                folder = new File(dictionary.getDictionaryValue());
                if (attachments == null || attachments.isEmpty()) {
                    LOG.warn("IDS:" + ids + "，无对应的文件");
                } else {
                    for (Attachment attachment : attachments) {
                        fileList.add(new java.io.File(folder, attachment.getFilePath()));
                    }
                }
            }
            if (paths != null && !paths.isEmpty()) {
                if (folder == null) {
                    Dictionary dictionary = this.mDictionaryService.findByTypeCode(Dictionary.TypeCode.ATTACHMENT_FOLDER).get(0);
                    folder = new File(dictionary.getDictionaryValue());
                }
                for (Object path : paths) {
                    fileList.add(new java.io.File(folder, path.toString()));
                }
            }
            if (fileList.isEmpty()) {
                return this.error("没有可以打包的文件，请重新选择！");
            }

            // 开始打包下载
            String result = mAttachmentService.beginPackage(fileList, folder);
            // 结果判断
            if ("01".equals(result)) {
                return this.error("您已经有一个正在打包下载的任务！是否取消？");
            } else if ("02".equals(result)) {
                return this.error("您已经有一个完成的打包下载的任务！请前去站内消息下载或者直接删除？");
            }
        } catch (Exception ex) {
            LOG.error("打包下载文件失败!", ex);
            return this.error("打包下载异常，请稍后重试！");
        }
        return this.ok("打包下载任务已经提交，结果随后会以站内信息通知的方式通知您！");
    }

    /**
     * 下载打包好的文件
     *
     * @param response 反馈
     */
    @RequestMapping("download/packaged/{id}")
    public void doDownloadPackage(@PathVariable Integer id, HttpServletResponse response) {
    	mAttachmentService.downloadPackage(id,response);
    }
}
