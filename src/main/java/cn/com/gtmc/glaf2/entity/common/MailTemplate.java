package cn.com.gtmc.glaf2.entity.common;

import cn.com.gtmc.glaf2.simple.DefaultIntegerEntity;

/**
 * 邮件模版实体类
 *
 * @author huyiming
 */
public class MailTemplate extends DefaultIntegerEntity {

    /**
     * 模版名称
     */
    private String templateName;

    /**
     * 模版内容
     */
    private String templateContent;

    public String getTemplateName() {
        return templateName;
    }

    public void setTemplateName(String templateName) {
        this.templateName = templateName;
    }

    public String getTemplateContent() {
        return templateContent;
    }

    public void setTemplateContent(String templateContent) {
        this.templateContent = templateContent;
    }
}
