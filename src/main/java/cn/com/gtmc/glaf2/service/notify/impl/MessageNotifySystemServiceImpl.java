package cn.com.gtmc.glaf2.service.notify.impl;

import cn.com.gtmc.glaf2.base.BaseMapper;
import cn.com.gtmc.glaf2.mapper.notify.MessageNotifySystemMapper;
import cn.com.gtmc.glaf2.security.LoginUser;
import cn.com.gtmc.glaf2.service.notify.MessageNotifySystemService;
import cn.com.gtmc.glaf2.tools.log.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MessageNotifySystemServiceImpl implements MessageNotifySystemService {

    private static final Logger LOG = Logger.getLogger(MessageNotifySystemServiceImpl.class);

    @Autowired
    private MessageNotifySystemMapper messageNotifySystemMapper;

    public MessageNotifySystemServiceImpl() {
        LOG.debug("init...");
    }

    @Override
    public BaseMapper getBaseMapper() {
        return this.messageNotifySystemMapper;
    }

    /**
     * 通过用户获取未读系统消息数
     * @param user 用户
     * @return 未读系统消息数
     */
    @Override
    public int findUnreadCountByUser(LoginUser user) {
        return messageNotifySystemMapper.findCount() - messageNotifySystemMapper.findReadCountByUser(user);
    }
}
