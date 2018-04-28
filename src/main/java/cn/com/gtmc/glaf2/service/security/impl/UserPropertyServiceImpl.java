package cn.com.gtmc.glaf2.service.security.impl;

import cn.com.gtmc.glaf2.base.BaseMapper;
import cn.com.gtmc.glaf2.entity.security.UserProperty;
import cn.com.gtmc.glaf2.entity.security.UserPropertyValue;
import cn.com.gtmc.glaf2.mapper.security.UserPropertyMapper;
import cn.com.gtmc.glaf2.service.security.UserPropertyService;
import cn.com.gtmc.glaf2.tools.log.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.List;

/**
 * 系统用户
 *
 * @author intasect
 */

@Transactional
@Service
public class UserPropertyServiceImpl implements UserPropertyService {

    private static final Logger LOG = Logger.getLogger(UserPropertyServiceImpl.class);

    @Autowired
    private UserPropertyMapper userPropertyMapper;

    public UserPropertyServiceImpl() {
        LOG.debug("init...");
    }


    @Override
    public BaseMapper getBaseMapper() {
        return this.userPropertyMapper;
    }

    @Override
    public List<UserProperty> findUserPropertyValue(Serializable id) {
        return this.userPropertyMapper.findUserPropertyValue(id);
    }

    @Override
    public List<UserProperty> isExistPropertyCode(UserProperty userProperty) {
        return this.userPropertyMapper.isExistPropertyCode(userProperty);
    }

}
