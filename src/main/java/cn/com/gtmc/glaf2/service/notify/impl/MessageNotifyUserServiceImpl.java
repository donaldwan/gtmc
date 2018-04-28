package cn.com.gtmc.glaf2.service.notify.impl;

import cn.com.gtmc.glaf2.base.BaseMapper;
import cn.com.gtmc.glaf2.entity.notify.MessageNotifyUser;
import cn.com.gtmc.glaf2.mapper.notify.MessageNotifyUserMapper;
import cn.com.gtmc.glaf2.security.LoginUser;
import cn.com.gtmc.glaf2.service.notify.MessageNotifyUserService;
import cn.com.gtmc.glaf2.tools.log.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 消息用户通知服务实现
 *
 * @author huyiming
 */
@Service
@Transactional
public class MessageNotifyUserServiceImpl implements MessageNotifyUserService {

    private static final Logger LOG = Logger.getLogger(MessageNotifyUserServiceImpl.class);

    @Autowired
    private MessageNotifyUserMapper messageNotifyUserMapper;

    public MessageNotifyUserServiceImpl() {
        LOG.debug("init...");
    }

    @Override
    public BaseMapper getBaseMapper() {
        return this.messageNotifyUserMapper;
    }

    /**
     * 获取用户未读用户信息数量
     *
     * @param user 用户
     * @return 未读用户信息数量
     */
    @Override
    public int findUnreadCountByUser(LoginUser user) {
        return ((MessageNotifyUserMapper) this.getBaseMapper()).findUnreadCountByUser(user);
    }

    /**
     * 更新用户通知
     *
     * @param messageNotifyUser 消息用户通知
     * @return 结果
     */
    @Override
    @Transactional
    public int updateByMessageAndUser(MessageNotifyUser messageNotifyUser) {
        return ((MessageNotifyUserMapper) this.getBaseMapper()).updateByMessageAndUser(messageNotifyUser);
    }
}
