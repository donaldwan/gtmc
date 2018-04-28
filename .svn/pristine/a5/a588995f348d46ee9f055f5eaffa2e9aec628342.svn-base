package cn.com.gtmc.glaf2.controller.system;

import cn.com.gtmc.glaf2.base.BaseController;
import cn.com.gtmc.glaf2.base.BaseService;
import cn.com.gtmc.glaf2.entity.security.Dictionary;
import cn.com.gtmc.glaf2.service.security.DictionaryService;
import cn.com.gtmc.glaf2.tools.log.Logger;
import cn.com.gtmc.glaf2.tools.web.Page;
import cn.com.gtmc.glaf2.tools.web.ReturnMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("system/dictionary")
public class DictionaryController implements BaseController<Dictionary> {
    private static final Logger LOG = Logger.getLogger(DictionaryController.class);

    @Autowired
    private DictionaryService mDictionaryService;

    public DictionaryController() {
        LOG.debug("init...");
    }


    @Override
    public BaseService getService() {
        return this.mDictionaryService;
    }

    /**
     * 查选全部数据字典
     */
    @RequestMapping("find")
    @ResponseBody
    @Override
    public java.util.List<Dictionary> findAll() {
        return mDictionaryService.findAll();
    }

    /**
     * 删除字典(物理删除)
     *
     * @param ids 字典id
     * @return 结果
     */
    @RequestMapping("delet/{ids}")
    @ResponseBody
    public ReturnMessage delet(@PathVariable String[] ids) {
        try {
        	this.mDictionaryService.deleteDictionary(ids);
            return this.ok();
        } catch (Exception e) {
            LOG.error("delete error!!!", e);
            return this.error();
        }
    }

    //根据Dictionary中的typecode查询字典信息
    @RequestMapping("find-by-dictionary-typecode")
    @ResponseBody
    public java.util.List<Dictionary> findByTypeCode(String typeCode) {
        return mDictionaryService.findByTypeCode(typeCode);
    }

    @Override
    public Page<Dictionary> findPage(Dictionary dictionary) {
        //修改特殊字符%和_
        if (null != dictionary.getDictionaryName() && !"".equals(dictionary.getDictionaryName())) {
            if (dictionary.getDictionaryName().contains("%")) {
                dictionary.setDictionaryName(dictionary.getDictionaryName().replace("%", "\\%%"));
            }
            if (dictionary.getDictionaryName().contains("_")) {
                dictionary.setDictionaryName(dictionary.getDictionaryName().replace("_", "\\_"));
            }
        }
        return mDictionaryService.findPage(dictionary);
    }

    @Override
    public ReturnMessage save(Dictionary t) {
        LOG.debug("save...dictionary.." + t.getId());
        return BaseController.super.save(t);
    }

    @RequestMapping("find-by-name-code")
    @ResponseBody
    public boolean findByName(String dictionaryCode, String dictionaryName, Integer id) {
        boolean flag = true;
        Dictionary dictionary = new Dictionary();
        dictionary.setDictionaryCode(dictionaryCode);
        dictionary.setDictionaryName(dictionaryName);
        List<Dictionary> dictionaryList = mDictionaryService.findByNameAndCode(dictionary);
        if (!dictionaryList.isEmpty()) {
            for (int i = 0; i < dictionaryList.size(); i++) {
                if (dictionaryList.get(i).getId().equals(id)) {
                    continue;
                }
                flag = false;
            }
        }
        return flag;
    }
}
