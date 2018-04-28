package cn.com.gtmc.glaf2.service.common;

import cn.com.gtmc.glaf2.base.BaseService;

public interface CommonService extends BaseService {

    /**
     * 得到seq序列号共通
     *
     * @return 序列号
     */
    String findSeq(String seqName);

    /**
     * 重置序列号
     */
    void resetSeq(String seqName);

}
