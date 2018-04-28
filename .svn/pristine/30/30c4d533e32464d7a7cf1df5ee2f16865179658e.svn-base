package cn.com.gtmc.glaf2.entity.mail;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * 邮件信息
 *
 * @author huyiming
 */
public class MailInfo {

    /**
     * 接收
     */
    private List<String> toAddresses;

    /**
     * 抄送
     */
    private List<String> ccAddresses;

    /**
     * 暗抄送
     */
    private List<String> bccAddresses;

    /**
     * 主题
     */
    private String subject;

    /**
     * 内容
     */
    private String content;

    /**
     * 附件
     */
    private List<File> attachments;

    public MailInfo() {
        this.toAddresses = new ArrayList<>();
        this.ccAddresses = new ArrayList<>();
        this.bccAddresses = new ArrayList<>();
        this.attachments = new ArrayList<>();
    }

    public List<String> getToAddresses() {
        return toAddresses;
    }

    public void setToAddresses(List<String> toAddresses) {
        this.toAddresses = toAddresses;
    }

    public List<String> getCcAddresses() {
        return ccAddresses;
    }

    public void setCcAddresses(List<String> ccAddresses) {
        this.ccAddresses = ccAddresses;
    }

    public List<String> getBccAddresses() {
        return bccAddresses;
    }

    public void setBccAddresses(List<String> bccAddresses) {
        this.bccAddresses = bccAddresses;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public List<File> getAttachments() {
        return attachments;
    }

    public void setAttachments(List<File> attachments) {
        this.attachments = attachments;
    }
}
