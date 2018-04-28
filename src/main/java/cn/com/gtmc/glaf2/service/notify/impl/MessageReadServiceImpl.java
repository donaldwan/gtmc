package cn.com.gtmc.glaf2.service.notify.impl;

import cn.com.gtmc.glaf2.base.BaseMapper;
import cn.com.gtmc.glaf2.mapper.notify.MessageReadMapper;
import cn.com.gtmc.glaf2.service.notify.MessageReadService;
import cn.com.gtmc.glaf2.tools.log.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MessageReadServiceImpl implements MessageReadService {

    private static final Logger LOG = Logger.getLogger(MessageReadServiceImpl.class);

    @Autowired
    private MessageReadMapper messageReadMapper;

    public MessageReadServiceImpl() {
        LOG.debug("init...");
    }

    @Override
    public BaseMapper getBaseMapper() {
        return this.messageReadMapper;
    }
}
