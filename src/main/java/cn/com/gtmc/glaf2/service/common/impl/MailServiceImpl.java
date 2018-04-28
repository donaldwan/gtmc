package cn.com.gtmc.glaf2.service.common.impl;

import org.apache.commons.lang.StringEscapeUtils;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.ui.velocity.VelocityEngineUtils;

import cn.com.gtmc.glaf2.entity.mail.MailInfo;
import cn.com.gtmc.glaf2.entity.security.Dictionary;
import cn.com.gtmc.glaf2.service.common.MailService;
import cn.com.gtmc.glaf2.service.security.DictionaryService;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Map;
import java.util.Properties;

@Service
public class MailServiceImpl implements MailService {

    @Autowired
    private JavaMailSenderImpl mailSender;

    private VelocityEngine mailTemplateEngine;

    @Autowired
    public MailServiceImpl(DictionaryService mDictionaryService) {
        if (mailTemplateEngine == null) {
            Properties vp = new Properties();
            Dictionary dictionary = mDictionaryService.findByTypeCode(Dictionary.TypeCode.TEMPLATE_FOLDER).get(0);
            String path = dictionary.getDictionaryValue();
            vp.setProperty(VelocityEngine.FILE_RESOURCE_LOADER_PATH, path);
            mailTemplateEngine = new VelocityEngine(vp);
        }
    }

    /**
     * 发送邮件
     *
     * @param mail 邮件信息
     * @throws MessagingException           MessagingException
     * @throws UnsupportedEncodingException UnsupportedEncodingException
     */
    @Override
    public void sendEmail(MailInfo mail) throws MessagingException,
            UnsupportedEncodingException {
        MimeMessage mime = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(mime, true, "utf-8");
        helper.setSubject(mail.getSubject());
        helper.setFrom(mailSender.getUsername());
        for (String toAddress : mail.getToAddresses()) {
            helper.addTo(toAddress);
        }
        for (String ccAddress : mail.getCcAddresses()) {
            helper.addCc(ccAddress);
        }
        for (String bccAddress : mail.getBccAddresses()) {
            helper.addBcc(bccAddress);
        }
        helper.setReplyTo(mailSender.getUsername());
        helper.setText(mail.getContent(), true);
        for (File attachment : mail.getAttachments()) {
            helper.addAttachment(attachment.getName(), attachment);
        }
        mailSender.send(mime);
    }

    /**
     * 发送模版邮件
     *
     * @param mail         邮件信息
     * @param templateName 模版名字
     * @param params       模版参数
     * @throws MessagingException           MessagingException
     * @throws UnsupportedEncodingException UnsupportedEncodingException
     */
    @Override
    public void sendTemplateEmail(MailInfo mail, String templateName, Map<String, Object> params) throws MessagingException,
            UnsupportedEncodingException {
        String content = VelocityEngineUtils.mergeTemplateIntoString(mailTemplateEngine, templateName, "UTF-8", params);
        content = StringEscapeUtils.unescapeHtml(content);
        mail.setContent(content);
        sendEmail(mail);
    }
}
