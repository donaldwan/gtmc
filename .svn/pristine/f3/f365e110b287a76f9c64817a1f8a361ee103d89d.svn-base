package cn.com.gtmc.glaf2.service.common;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;

import cn.com.gtmc.glaf2.base.BaseService;
import cn.com.gtmc.glaf2.entity.common.Attachment;
import cn.com.gtmc.glaf2.entity.security.Dictionary;

public interface AttachmentService extends BaseService {

    /**
     * 查询多个上传附件
     *
     * @param ids 主键集
     * @return 附件对象
     */
    List<Attachment> findByIds(Integer... ids);

    /**
     * 开始打包
     *
     * @param fileList 需要打包的文件集合
     * @param folder   打包存放的临时目录（借用上传存放文件统一目录）
     * @return 是否正常开始打包
     */
    String beginPackage(List<File> fileList, File folder);

    /**
     * 获取打好包的压缩文件
     *
     * @return 压缩文件
     */
    File getPackagedFile();

    /**
     * 检查压缩任务完成后是否需要通知
     *
     * @return 结果
     */
    boolean isZipTaskNeedNotify();

    /**
     * 压缩任务通知
     */
    void zipTaskCompleteNotify();

    /**
     * 判断是不是压缩包任务信息
     *
     * @param messageId 信息ID
     * @return 判断结果
     */
    boolean isZipTaskMessage(Integer messageId);

    /**
     * 批量上传
     * @param attachment
     */
	boolean batchInsert(Map<String, MultipartFile> map,String extParams,List<Dictionary> dictionaries,List<Attachment> attachments) throws Exception;

	/**
	 * 下载打包文件，清空用户任务，标记消息为已读
	 * @param id
	 * @param response
	 */
	void downloadPackage(Integer id,HttpServletResponse response);
}
