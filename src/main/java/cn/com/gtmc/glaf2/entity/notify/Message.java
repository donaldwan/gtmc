package cn.com.gtmc.glaf2.entity.notify;

import cn.com.gtmc.glaf2.simple.DefaultIntegerEntity;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * 站内消息实体类
 *
 * @author 胡一鸣
 * @version V1.0
 * @Title: Message.java
 * @Package cn.com.intasect.entity.msg
 * @Description: 站内消息实体类
 * @date 2016年12月23日 上午11:04:04
 */
public class Message extends DefaultIntegerEntity {

    private String title;
    @JsonFormat(
            timezone = "GMT+8",
            pattern = "yyyy-MM-dd HH:mm:ss"
    )
    private Date releaseTime;
    private Integer releaseUserId;
    private String releaseUserName;
    private String content;
    private String msgType;
    /* 读取状态 */
    private String readStatus;
    /* 用户ID */
    private String userIds;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getReleaseTime() {
        return releaseTime;
    }

    public void setReleaseTime(Date releaseTime) {
        this.releaseTime = releaseTime;
    }

    public Integer getReleaseUserId() {
        return releaseUserId;
    }

    public void setReleaseUserId(Integer releaseUserId) {
        this.releaseUserId = releaseUserId;
    }

    public String getReleaseUserName() {
        return releaseUserName;
    }

    public void setReleaseUserName(String releaseUserName) {
        this.releaseUserName = releaseUserName;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getMsgType() {
        return msgType;
    }

    public void setMsgType(String msgType) {
        this.msgType = msgType;
    }

    public String getReadStatus() {
        return readStatus;
    }

    public void setReadStatus(String readStatus) {
        this.readStatus = readStatus;
    }

    public String getUserIds() {
        return userIds;
    }

    public void setUserIds(String userIds) {
        this.userIds = userIds;
    }
}
