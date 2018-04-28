package cn.com.gtmc.glaf2.service.common.impl;

import cn.com.gtmc.glaf2.base.BaseMapper;
import cn.com.gtmc.glaf2.entity.common.MailTemplate;
import cn.com.gtmc.glaf2.entity.security.Dictionary;
import cn.com.gtmc.glaf2.mapper.common.MailTemplateMapper;
import cn.com.gtmc.glaf2.service.common.MailTemplateService;
import cn.com.gtmc.glaf2.service.security.DictionaryService;
import cn.com.gtmc.glaf2.tools.log.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.File;
import java.util.List;

/**
 * 邮件模版服务类
 *
 * @author huyiming
 */
@Service
@Transactional
public class MailTemplateServiceImpl implements MailTemplateService {

    private static final Logger LOG = Logger.getLogger(MailTemplateServiceImpl.class);

    @Autowired
    private DictionaryService mDictionaryService;

    @Autowired
    private MailTemplateMapper mMailTemplateMapper;

    @Override
    public BaseMapper getBaseMapper() {
        return this.mMailTemplateMapper;
    }

    /**
     * 删除模版
     *
     * @param ids IDS
     */
    @Override
    @Transactional
    public void delete(Integer[] ids) {
        LOG.debug("MailTemplateServiceImpl delete...");
        List<MailTemplate> mailTemplateList = mMailTemplateMapper.findByIds(ids);
        if (mailTemplateList != null) {
            mMailTemplateMapper.batchDelete(ids);
            try {
                Dictionary dictionary = this.mDictionaryService.findByTypeCode(Dictionary.TypeCode.TEMPLATE_FOLDER).get(0);
                File folder = new File(dictionary.getDictionaryValue());
                File template;
                for (MailTemplate mt : mailTemplateList) {
                    template = new File(folder, mt.getTemplateName());
                    if (template.exists() && template.canExecute()) {
                        template.delete();
                    }
                }
            } catch (Exception ex) {
                LOG.error("MailTemplateServiceImpl delete template error...");
            }
        }
    }
}
