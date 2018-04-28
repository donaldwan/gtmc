package cn.com.gtmc.glaf2.service.common.impl;

import cn.com.gtmc.glaf2.base.BaseMapper;
import cn.com.gtmc.glaf2.entity.common.Attachment;
import cn.com.gtmc.glaf2.entity.notify.Message;
import cn.com.gtmc.glaf2.entity.security.Dictionary;
import cn.com.gtmc.glaf2.mapper.common.AttachmentMapper;
import cn.com.gtmc.glaf2.service.common.AttachmentService;
import cn.com.gtmc.glaf2.service.notify.MessageService;
import cn.com.gtmc.glaf2.tools.DateUtil;
import cn.com.gtmc.glaf2.tools.log.Logger;
import cn.com.gtmc.glaf2.tools.zip.ZipTask;
import cn.com.gtmc.glaf2.tools.zip.ZipTaskContext;
import cn.com.gtmc.glaf2.tools.zip.ZipTaskDao;
import cn.com.gtmc.glaf2.tools.zip.ZipUtil;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;

@Service
@Transactional
public class AttachmentServiceImpl implements AttachmentService {

    private static final Logger LOG = Logger.getLogger(AttachmentServiceImpl.class);

    @Autowired
    private AttachmentMapper mAttachmentMapper;

    @Autowired
    private ZipTaskDao zipTaskDao;

    @Autowired
    private ThreadPoolTaskExecutor zipTaskThreadPool;

    @Autowired
    private MessageService messageService;

    public AttachmentServiceImpl() {
        LOG.info("init...");
    }

    @Override
    public BaseMapper getBaseMapper() {
        return this.mAttachmentMapper;
    }

    /**
     * 查询多个上传附件
     *
     * @param ids 主键集
     * @return 附件对象
     */
    @Override
    public List<Attachment> findByIds(Integer... ids) {
        return this.mAttachmentMapper.findByIds(Arrays.asList(ids));
    }

    /**
     * 开始打包
     *
     * @param fileList 需要打包的文件集合
     * @param folder   打包存放的临时目录（借用上传存放文件统一目录）
     * @return 是否正常开始打包
     */
    @Transactional
    @Override
    public String beginPackage(List<File> fileList, File folder) {

        Integer userId = this.getLoginUser().getId();

        // 用户是否打包中检查
        ZipTask zipTask = zipTaskDao.findByUserId(userId);
        if (zipTask != null && zipTask.getId() != null) {
            return zipTask.getStatus();
        }

        // 启用下载任务
        Future future = zipTaskThreadPool.submit(() -> taskContent(userId, fileList, folder));
        ZipTaskContext.saveUserTask(this.getLoginUser().getId(), future);

        return "00";
    }

    /**
     * 任务内容
     *
     * @param userId   用户ID
     * @param fileList 文件列表
     * @param folder   文件夹
     * @return 结果
     */
    private String taskContent(Integer userId, List<File> fileList, File folder) {
        String status = "01";
        String fileName = Calendar.getInstance().getTimeInMillis() + ".zip";
        try {
            ZipTask newTask = new ZipTask();
            newTask.setUserId(userId);
            StringBuilder paths = new StringBuilder("{paths:[");
            for (int i = 0; i < fileList.size(); i++) {
                paths.append("'");
                paths.append(fileList.get(0).getPath());
                paths.append("'");
                paths.append(",");
            }
            paths.deleteCharAt(paths.length() - 1);
            paths.append("]}");
            newTask.setPaths(paths.toString());
            // 打包中
            newTask.setStatus("01");
            // 未通知
            newTask.setNotifyStatus("01");
            zipTaskDao.insert(newTask);
            File packagedFile = ZipUtil.zipFiles(fileName, folder, fileList);
            // 打包完成
            ZipTask task = zipTaskDao.findByUserId(userId);
            task.setStatus("02");
            task.setZipFile(packagedFile.getPath());
            zipTaskDao.update(task);
        } catch (IOException ex) {
            LOG.error("文件打包异常", ex);
            // 打包异常
            status = "02";
            // 异常任务处理
            ZipTask errorTask = zipTaskDao.findByUserId(userId);
            zipTaskDao.delete(errorTask);
        }
        return status;
    }

    /**
     * 获取打好包的压缩文件
     *
     * @return 压缩文件
     */
    @Override
    public File getPackagedFile() {
        Integer userId = this.getLoginUser().getId();
        ZipTask zipTask = zipTaskDao.findByUserId(userId);
        // 取得内存任务
        Future future = ZipTaskContext.getUserTask(userId);
        try {
            // 如果下载任务不存在，那么直接返回空由上层处理
            if (zipTask == null) {
                // 保险处理
                if (future.isDone()) {
                    // 认为是打包错误
                    if ("02".equals(future.get().toString())) {
                        ZipTaskContext.removeUserTask(userId);
                    }
                } else {
                    // 强制取消任务
                    future.cancel(true);
                }
                return null;
            } else {
                // 如果数据库任务状态是完成
                if ("02".equals(zipTask.getStatus())) {
                    // 非法任务状态
                    if (future == null) {
                        // 需要将数据库的下载任务信息清掉以便用户再次启动打包任务
                        // 或者启用此DB信息提醒用户是否重启任务(本次逻辑暂不编写)
                        zipTaskDao.delete(zipTask);
                    } else {
                        // 内存任务状态OK
                        if ("01".equals(future.get().toString())) {
                            return new File(zipTask.getZipFile());
                        }
                    }
                }
                // 任务没有完成
                else if ("01".equals(zipTask.getStatus())) {
                    return null;
                }
            }
        } catch (InterruptedException | ExecutionException e) {
            LOG.error("获取打好包的压缩文件异常！", e);
        }
        return null;
    }

    /**
     * 检查任务完成后是否需要通知
     *
     * @return 结果
     */
    @Override
    public boolean isZipTaskNeedNotify() {
        Integer userId = this.getLoginUser().getId();
        Future future = ZipTaskContext.getUserTask(userId);
        if (future != null && future.isDone()) {
            try {
                // 任务状态已经完成 && 通知在内存没有通知过
                if ("01".equals(future.get().toString()) && !ZipTaskContext.isTaskFirstNotified(userId)) {
                    return true;
                }
            } catch (InterruptedException | ExecutionException e) {
                LOG.error("检查任务完成后是否需要通知异常！", e);
                return false;
            }
        }
        return false;
    }

    /**
     * 压缩任务通知
     */
    @Transactional
    @Override
    public void zipTaskCompleteNotify() {
        ZipTask zipTask = getCurrentZipTask();
        // 判断数据库任务是否存在
        if (isZipTaskExist(zipTask)) {
            Message message = new Message();
            message.setTitle("打包下载提醒");
            message.setContent("打包下载文件如下：" + new File(zipTask.getZipFile()).getName());
            message.setStatus("A");
            // 自己通知自己
            messageService.userMessageNotify(message, (Integer) this.getLoginUser().getId());
            // 记录信息ID进内存
            ZipTaskContext.saveUserTaskMessage(this.getLoginUser().getId(), message.getId());
            // 记录消息ID进数据库
            zipTask.setMessageId(message.getId());
            setZipTaskNotified(zipTask);
        }
    }

    /**
     * 检查DB压缩任务是否存在
     *
     * @return 结果
     */
    private boolean isZipTaskExist(ZipTask zipTask) {
        return zipTask.getId() != null && "01".equals(zipTask.getNotifyStatus());
    }

    /**
     * 设置任务已经通知过了
     */
    private void setZipTaskNotified(ZipTask zipTask) {
        zipTask.setNotifyStatus("02");
        zipTaskDao.update(zipTask);
    }

    /**
     * 获取当前DB任务
     *
     * @return 任务信息
     */
    private ZipTask getCurrentZipTask() {
        Integer userId = this.getLoginUser().getId();
        return zipTaskDao.findByUserId(userId);
    }

    /**
     * 判断是不是压缩包任务信息
     *
     * @param messageId 信息ID
     * @return 判断结果
     */
    @Override
    public boolean isZipTaskMessage(Integer messageId) {
        Integer userId = this.getLoginUser().getId();
        Integer cachedMessageId = ZipTaskContext.getUserTaskMessage(userId);
        if (cachedMessageId == null) {
            ZipTask zipTask = zipTaskDao.findByUserId(userId);
            if (zipTask.getMessageId() != null && zipTask.getMessageId() != 0) {
                cachedMessageId = zipTask.getMessageId();
                ZipTaskContext.saveUserTaskMessage(userId, cachedMessageId);
            }
        }
        return messageId.equals(cachedMessageId);
    }

    /**
     * 批量上传
     *
     * @throws Exception
     */
    @Transactional
    @Override
    public boolean batchInsert(Map<String, MultipartFile> map, String extParams, List<Dictionary> dictionaries, List<Attachment> attachments) throws Exception {

        Dictionary dictionary = dictionaries.get(0);

        java.io.File rootDir = new java.io.File(dictionary.getDictionaryValue());

        java.util.Date today = new java.util.Date();
        String fileMonth = DateUtil.formatDate(today, "yyyyMMdd");
        java.io.File fileDir = new java.io.File(rootDir, fileMonth);
        if (!fileDir.exists()) {
            fileDir.mkdir();
        }

        java.util.Random random = new java.util.Random();
        for (Map.Entry<String, MultipartFile> entry : map.entrySet()) {
            MultipartFile file = entry.getValue();
            String fileName = file.getOriginalFilename();
            long fileSize = file.getSize();
            String fileSuffix = fileName.substring(fileName.lastIndexOf('.') + 1);
            String localFileName = String.format("%s_%04d", DateUtil.formatDate(today, "yyyyMMddHHmmss"), random.nextInt(10000));

            file.transferTo(new java.io.File(fileDir,
                    String.format("%s.%s",
                            localFileName,
                            fileSuffix)));

            Attachment attachment = new Attachment();
            attachment.setFileName(fileName);
            attachment.setFileType(fileSuffix);
            attachment.setFileSize(fileSize);
            // 存放文件夹、文件名称、文件后缀
            attachment.setFilePath(String.format("/%s/%s.%s",
                    fileMonth,
                    localFileName,
                    fileSuffix));

            attachment.setExtParams(extParams);

            this.mAttachmentMapper.insert(attachment);

            attachments.add(attachment);
        }
        return true;
    }

    /**
     * 下载打包文件，清空用户任务，标记消息为已读
     */
    @Transactional
    @Override
    public void downloadPackage(Integer id, HttpServletResponse response) {
        File file = getPackagedFile();
        if (file == null) return;
        downloadFile(file, file.getName(), response);

        cleanUserPackageTask();
        Message message = messageService.findById(id);
        messageService.readMessage(message);
    }

    /**
     * 压缩文件下载成功后清除相关信息
     */
    public void cleanUserPackageTask() {
        Integer userId = this.getLoginUser().getId();
        ZipTask zipTask = zipTaskDao.findByUserId(userId);
        zipTaskDao.delete(zipTask);
        ZipTaskContext.removeUserTask(userId);
        ZipTaskContext.removeTaskFirstNotify(userId);
        ZipTaskContext.removeUserTaskMessage(userId);
        // TODO:是否需要下载后马上清除?
        File file = new File(zipTask.getZipFile());
        if (file.exists()) {
            file.delete();
        }
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
}
