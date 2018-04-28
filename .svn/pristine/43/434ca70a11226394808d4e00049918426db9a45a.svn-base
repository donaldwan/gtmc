package cn.com.gtmc.glaf2.service.security.impl;

import cn.com.gtmc.glaf2.base.BaseMapper;
import cn.com.gtmc.glaf2.entity.security.AuthenticationResource;
import cn.com.gtmc.glaf2.entity.security.Resource;
import cn.com.gtmc.glaf2.mapper.security.ResourceMapper;
import cn.com.gtmc.glaf2.service.security.ResourceService;
import cn.com.gtmc.glaf2.tools.log.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ResourceServiceImpl implements ResourceService {

    private static final Logger LOG = Logger.getLogger(ResourceServiceImpl.class);

    @Autowired
    private ResourceMapper mResourceMapper;

    public ResourceServiceImpl() {
        LOG.debug("init...");
    }

    @Override
    public BaseMapper getBaseMapper() {
        return this.mResourceMapper;
    }

    @Override
    public List<Resource> findByAuthentication(AuthenticationResource mAuthenticationResource) {
        return this.mResourceMapper.findByAuthentication(mAuthenticationResource);
    }

    @Override
    public Resource findByScreenId(String screenId) {
        return mResourceMapper.findByScreenId(screenId);
    }

	@Override
	public int deleteResourceList(String[] ids) {
		for (int i = 0; i < ids.length; i++) {
			this.mResourceMapper.delete(ids[i]);
		}
		return 1;
	}
}
