package cn.com.gtmc.glaf2.service.common;

import javax.mail.MessagingException;

import cn.com.gtmc.glaf2.entity.mail.MailInfo;

import java.io.UnsupportedEncodingException;
import java.util.Map;

public interface MailService {

    /**
     * 发送邮件
     *
     * @param mail 邮件信息
     * @throws MessagingException           MessagingException
     * @throws UnsupportedEncodingException UnsupportedEncodingException
     */
    void sendEmail(MailInfo mail) throws MessagingException,
            UnsupportedEncodingException;

    /**
     * 发送模版邮件
     *
     * @param mail         邮件信息
     * @param templateName 模版名字
     * @param params       模版参数
     * @throws MessagingException           MessagingException
     * @throws UnsupportedEncodingException UnsupportedEncodingException
     */
    void sendTemplateEmail(MailInfo mail, String templateName, Map<String, Object> params) throws MessagingException,
            UnsupportedEncodingException;
}
