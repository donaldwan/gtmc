package cn.com.gtmc.glaf2.entity.notify;

import cn.com.gtmc.glaf2.simple.DefaultIntegerEntity;

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
public class MessageRead extends DefaultIntegerEntity {

    private Integer userId;
    private Integer messageId;
    private String msgType;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getMessageId() {
        return messageId;
    }

    public void setMessageId(Integer messageId) {
        this.messageId = messageId;
    }

    public String getMsgType() {
        return msgType;
    }

    public void setMsgType(String msgType) {
        this.msgType = msgType;
    }
}
