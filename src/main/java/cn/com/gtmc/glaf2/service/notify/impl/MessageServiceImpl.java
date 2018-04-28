package cn.com.gtmc.glaf2.service.notify.impl;

import cn.com.gtmc.glaf2.base.BaseMapper;
import cn.com.gtmc.glaf2.entity.notify.Message;
import cn.com.gtmc.glaf2.entity.notify.MessageNotifyUser;
import cn.com.gtmc.glaf2.entity.notify.MessageRead;
import cn.com.gtmc.glaf2.mapper.notify.MessageMapper;
import cn.com.gtmc.glaf2.security.LoginUser;
import cn.com.gtmc.glaf2.service.notify.MessageNotifyUserService;
import cn.com.gtmc.glaf2.service.notify.MessageReadService;
import cn.com.gtmc.glaf2.service.notify.MessageService;
import cn.com.gtmc.glaf2.tools.Util;
import cn.com.gtmc.glaf2.tools.log.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class MessageServiceImpl implements MessageService {

    private static final Logger LOG = Logger.getLogger(MessageServiceImpl.class);

    @Autowired
    private MessageMapper messageMapper;

    @Autowired
    private MessageReadService mMessageReadService;

    @Autowired
    private MessageNotifyUserService mMessageNotifyUserService;

    public MessageServiceImpl() {
        LOG.debug("init...");
    }

    @Override
    public BaseMapper getBaseMapper() {
        return this.messageMapper;
    }

    @Override
    public List<Message> findUnreadSystemMessagesByUser(LoginUser user) {
        return ((MessageMapper) this.getBaseMapper()).findUnreadSystemMessagesByUser(user);
    }

    @Override
    public List<Message> findUnreadUserMessagesByUser(LoginUser user) {
        return ((MessageMapper) this.getBaseMapper()).findUnreadUserMessagesByUser(user);
    }

    /**
     * 发布通知消息
     */
    @Transactional
	@Override
	public void saveMessage(Message message) {
		// 新建消息的时候查看消息
        if (!"".equals(Util.filter(message.getPK())) && !"0".equals(Util.filter(message.getPK()))) {
            messageMapper.update(message);
        }
        // 完全新建消息
        else {
            // 新建消息
        	insert(message);
            // 当消息是用户通知的时候设置通知用户对象
            if ("02".equals(message.getMsgType())) {
            	insertMessageNotifyUser(message.getId(), message.getUserIds().split(","));
            }
        }
	}
    
    @Override
    @Transactional(
            propagation = Propagation.REQUIRED,
            readOnly = false
    )
    public int insert(Message message) {

        Date now = new Date();
        message.setReleaseTime(now);
        LoginUser loginUser = this.getLoginUser();
        if (loginUser != null) {
            message.setReleaseUserId(loginUser.getId());
            message.setReleaseUserName(loginUser.getUsername());
        }

        return this.getBaseMapper().insert(message);
    }

    @Override
    @Transactional(
            propagation = Propagation.REQUIRED,
            readOnly = false
    )
    public int insertMessageNotifyUser(Integer messageId, String... userIds) {

        List<MessageNotifyUser> list = new ArrayList<>();

        Date now = new Date();
        for (String userId : userIds) {
            MessageNotifyUser messageNotifyUser = new MessageNotifyUser();
            messageNotifyUser.setMessageId(messageId);
            try {
                messageNotifyUser.setUserId(Integer.valueOf(userId));
            } catch (Exception ex) {
                LOG.error("用户通知信息，用户主键转换错误！", ex);
                continue;
            }
            messageNotifyUser.setNotifyTime(now);
            messageNotifyUser.setCreatedTime(now);
            messageNotifyUser.setUpdatedTime(now);
            LoginUser loginUser = this.getLoginUser();
            if (loginUser != null) {
                messageNotifyUser.setCreatedUserId(loginUser.getId());
                messageNotifyUser.setCreatedUserName(loginUser.getUsername());
                messageNotifyUser.setUpdatedUserId(loginUser.getId());
                messageNotifyUser.setUpdatedUserName(loginUser.getUsername());
            }
            list.add(messageNotifyUser);
        }
        return ((MessageMapper) this.getBaseMapper()).insertMessageNotifyUser(list);
    }
    
    /**
     * 提供给工作流的用户消息发布接口
     *
     * @param message    消息对象
     * @param userIdList 用户ID列表
     * @return 大于0为成功
     */
    @Transactional
    @Override
    public int userMessageNotify(Message message, List<Integer> userIdList) {
        message.setMsgType("02");
        int ret = this.insert(message);
        String[] userIds = new String[userIdList.size()];
        for (int i = 0; i < userIdList.size(); i++) {
            userIds[i] = userIdList.get(i).toString();
        }
        return ret * insertMessageNotifyUser(message.getId(), userIds);
    }

    /**
     * 提供给工作流的用户消息发布接口
     *
     * @param message 消息对象
     * @param userId  用户ID
     * @return 大于0为成功
     */
    @Transactional
    @Override
    public int userMessageNotify(Message message, Integer userId) {
        List<Integer> list = new ArrayList<>();
        list.add(userId);
        return this.userMessageNotify(message, list);
    }

    /**
     * 设置站内信息已读
     *
     * @param t 信息
     */
    @Transactional
    @Override
    public void readMessage(Message t) {

        if (t != null && t.getId() != null && t.getId() != 0) {

            LoginUser user = Util.getLoginUser();
            // 设置消息为已读消息
            MessageRead messageRead = new MessageRead();
            messageRead.setUserId(user.getId());
            messageRead.setMessageId(t.getId());
            messageRead.setMsgType(t.getMsgType());
            mMessageReadService.insert(messageRead);

            // 如果是用户消息类型的话，还需要更新用户已读消息外键
            if ("02".equals(t.getMsgType())) {
                MessageNotifyUser messageNotifyUser = new MessageNotifyUser();
                messageNotifyUser.setUserId(user.getId());
                messageNotifyUser.setMessageId(t.getId());
                messageNotifyUser.setMessageReadId(messageRead.getId());// 更新字段
                mMessageNotifyUserService.updateByMessageAndUser(messageNotifyUser);
            }
        }
    }

}
