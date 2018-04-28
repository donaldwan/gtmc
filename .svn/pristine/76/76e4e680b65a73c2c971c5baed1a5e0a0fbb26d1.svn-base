package cn.com.gtmc.glaf2.service.security.impl;

import cn.com.gtmc.glaf2.base.BaseMapper;
import cn.com.gtmc.glaf2.entity.security.Dictionary;
import cn.com.gtmc.glaf2.mapper.security.DictionaryMapper;
import cn.com.gtmc.glaf2.service.security.DictionaryService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class DictionaryServiceImpl implements DictionaryService {

    @Autowired
    private DictionaryMapper mDictionaryMapper;

    @Override
    public BaseMapper getBaseMapper() {
        return this.mDictionaryMapper;
    }

    @Override
    public List<Dictionary> findByTypeCode(String typeId) {
        return this.mDictionaryMapper.findByTypeCode(typeId);
    }

    @Override
    public List<Dictionary> findByNameAndCode(Dictionary dictionary) {
        return this.mDictionaryMapper.findByNameAndCode(dictionary);
    }

    @Transactional
	@Override
	public int deleteDictionary(String[] ids) {
		for (int i = 0; i < ids.length; i++) {
            this.mDictionaryMapper.delete(ids[i]);
        }
		return 1;
	}

}
