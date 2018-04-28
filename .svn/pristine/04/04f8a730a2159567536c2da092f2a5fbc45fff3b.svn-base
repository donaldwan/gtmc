package cn.com.gtmc.glaf2.service.notify;

import cn.com.gtmc.glaf2.base.BaseService;
import cn.com.gtmc.glaf2.entity.notify.Message;
import cn.com.gtmc.glaf2.security.LoginUser;

import java.util.List;


public interface MessageService extends BaseService {

    int insert(Message message);

    int insertMessageNotifyUser(Integer messageId, String... userIds);

    List<Message> findUnreadSystemMessagesByUser(LoginUser user);

    List<Message> findUnreadUserMessagesByUser(LoginUser user);

    int userMessageNotify(Message message, List<Integer> userIdList);

    int userMessageNotify(Message message, Integer userId);

    /**
     * 设置站内信息已读
     *
     * @param t 信息
     */
    void readMessage(Message t);

    /**
     * 发布通知消息
     * @param message
     */
	void saveMessage(Message message);
}
