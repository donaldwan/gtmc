package cn.com.gtmc.glaf2.controller.system;

import cn.com.gtmc.glaf2.base.BaseController;
import cn.com.gtmc.glaf2.base.BaseService;
import cn.com.gtmc.glaf2.entity.common.MailTemplate;
import cn.com.gtmc.glaf2.entity.security.Dictionary;
import cn.com.gtmc.glaf2.service.common.MailTemplateService;
import cn.com.gtmc.glaf2.service.security.DictionaryService;
import cn.com.gtmc.glaf2.tools.Util;
import cn.com.gtmc.glaf2.tools.web.ReturnMessage;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.util.Calendar;

/**
 * 邮件模版控制器
 *
 * @author huyiming
 */
@Controller
@RequestMapping("system/mailTemplate")
public class MailTemplateController implements BaseController<MailTemplate> {

    @Autowired
    private MailTemplateService mMailTemplateService;

    @Autowired
    private DictionaryService mDictionaryService;

    @Override
    public BaseService getService() {
        return this.mMailTemplateService;
    }

    /**
     * 新增保存方法
     *
     * @param mailTemplate 邮件模版对象
     * @return 结果
     */
    @Override
    public ReturnMessage save(MailTemplate mailTemplate) {
        logger.debug("save custom...pk:{}", mailTemplate.getPK());
        Dictionary dictionary = this.mDictionaryService.findByTypeCode(Dictionary.TypeCode.TEMPLATE_FOLDER).get(0);
        File folder = new File(dictionary.getDictionaryValue());
        try {
            String fileName;
            boolean isUpdate = !"".equals(Util.filter(mailTemplate.getPK())) && !"0".equals(Util.filter(mailTemplate.getPK()));
            // 更新的时候
            if (isUpdate) {
                fileName = mailTemplate.getTemplateName();
            }
            // 新增的时候
            else {
                fileName = Calendar.getInstance().getTimeInMillis() + ".vm";
                mailTemplate.setTemplateName(fileName);
            }
            mailTemplate.setTemplateContent(clearReplace(mailTemplate.getTemplateContent()));
            File templateFile = new File(folder, fileName);
            FileUtils.write(templateFile, mailTemplate.getTemplateContent());
            ReturnMessage msg = BaseController.super.save(mailTemplate);
            // 新增的时候数据库失败需要做一次删除操作
            if (!isUpdate && msg.getResultCode() != ReturnMessage.ResultCode.OK) {
                templateFile.delete();
            }
            return msg;
        } catch (Exception ex) {
            logger.error("save error!!!", ex);
            return this.error();
        }
    }

    @Override
    public ModelAndView edit(@PathVariable Serializable id) {
        ModelAndView mv = BaseController.super.edit(id);
        MailTemplate mailTemplate = (MailTemplate) mv.getModel().get("model");

        Dictionary dictionary = this.mDictionaryService.findByTypeCode(Dictionary.TypeCode.TEMPLATE_FOLDER).get(0);
        File folder = new File(dictionary.getDictionaryValue());

        try {
            String templateContent = FileUtils.readFileToString(new File(folder, mailTemplate.getTemplateName()));
            mailTemplate.setTemplateContent(clearReplace(templateContent));
        } catch (IOException ex) {
            logger.error("edit error!!!", ex);
        }
        return mv;
    }

    /**
     * 删除(物理删除)
     *
     * @param ids ids
     * @return 删除结果
     */
    @RequestMapping("delete/{ids}")
    @ResponseBody
    public ReturnMessage delete(@PathVariable Integer[] ids) {
        try {
            mMailTemplateService.delete(ids);
            return this.ok();
        } catch (Exception e) {
            logger.error("delete error!!!", e);
            return this.error();
        }
    }

    private String clearReplace(String src) {
        return src.replaceAll("=\"", "='").replaceAll("\"&gt;", "'&gt;").replaceAll("\"/&gt;", "'/&gt;");
    }
}
