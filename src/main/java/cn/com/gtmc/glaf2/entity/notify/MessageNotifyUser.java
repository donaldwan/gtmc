package cn.com.gtmc.glaf2.entity.notify;

import cn.com.gtmc.glaf2.simple.DefaultIntegerEntity;

import java.util.Date;

/**
 * 站内消息读取实体类
 *
 * @author 胡一鸣
 * @version V1.0
 * @Title: MessageRead.java
 * @Package cn.com.intasect.entity.msg
 * @Description: 站内消息读取实体类
 * @date 2016年12月23日 上午11:04:04
 */
public class MessageNotifyUser extends DefaultIntegerEntity {

    private Integer messageId;
    private Integer messageReadId;
    private Integer userId;
    private Date notifyTime;

    public Integer getMessageId() {
        return messageId;
    }

    public void setMessageId(Integer messageId) {
        this.messageId = messageId;
    }

    public Integer getMessageReadId() {
        return messageReadId;
    }

    public void setMessageReadId(Integer messageReadId) {
        this.messageReadId = messageReadId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Date getNotifyTime() {
        return notifyTime;
    }

    public void setNotifyTime(Date notifyTime) {
        this.notifyTime = notifyTime;
    }
}
