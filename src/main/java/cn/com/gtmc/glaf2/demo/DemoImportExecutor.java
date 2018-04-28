package cn.com.gtmc.glaf2.demo;

import cn.com.gtmc.glaf2.fileimport.ImportExecutor;
import cn.com.gtmc.glaf2.tools.log.Logger;
import org.springframework.stereotype.Component;

import java.io.File;
import java.util.List;
import java.util.Map;

/**
 * 文件导入例子
 *
 * @author chenwandong
 */
@Component
public class DemoImportExecutor implements ImportExecutor {

    private static final Logger LOG = Logger.getLogger(DemoImportExecutor.class);

    @Override
    public List<ErrorMessage> execute(File dataFile, Map<String, Object> params) {
        LOG.debug("begin execute...");

        java.util.List<ErrorMessage> errorMessages = new java.util.ArrayList<>();

        ErrorMessage em = new ErrorMessage();
        em.setRow(1);
        em.setColumn(1);
        em.setMessage("错误信息描述1!");
        errorMessages.add(em);

        em = new ErrorMessage();
        em.setRow(1);
        em.setColumn(2);
        em.setMessage("错误信息描述2!");

        errorMessages.add(em);
        return errorMessages;
    }
}
