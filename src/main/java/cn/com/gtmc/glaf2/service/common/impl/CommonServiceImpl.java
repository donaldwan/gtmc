package cn.com.gtmc.glaf2.service.common.impl;

import cn.com.gtmc.glaf2.base.BaseMapper;
import cn.com.gtmc.glaf2.mapper.common.CommonMapper;
import cn.com.gtmc.glaf2.service.common.CommonService;
import cn.com.gtmc.glaf2.tools.log.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class CommonServiceImpl implements CommonService {

    private static final Logger LOG = Logger.getLogger(AttachmentServiceImpl.class);

    @Autowired
    private CommonMapper commonMapper;

    public CommonServiceImpl() {
        LOG.info("init...");
    }

    @Override
    public BaseMapper getBaseMapper() {
        return this.commonMapper;
    }

    /**
     * 得到seq序列号共通
     *
     * @return 序列号
     */
    @Override
    public String findSeq(String seqName) {
        return this.commonMapper.findSeq(seqName);
    }

    /**
     * 重置序列号
     */
    @Override
    public void resetSeq(String seqName) {
        this.commonMapper.resetSeq(seqName);
    }
}
