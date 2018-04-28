package cn.com.gtmc.glaf2.security;

import cn.com.gtmc.glaf2.entity.security.User;
import cn.com.gtmc.glaf2.mapper.security.UserMapper;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

public class UserDetailsServiceImpl implements UserDetailsService {

    private static final Logger LOG = LoggerFactory.getLogger(UserDetailsServiceImpl.class);

    @Autowired
    private UserMapper mUserMapper;

    @Autowired
    private UrlAuthentication mAuthentication;

    @Override
    public UserDetails loadUserByUsername(String loginName) throws UsernameNotFoundException {
        LOG.debug("loadUserByUsername:{}", loginName);

        User user = this.mUserMapper.findByLoginName(loginName);

        if (user == null) {
            throw new UsernameNotFoundException(loginName);
        }
        LOG.debug("password:" + user.getPassword());

        user.setAuthorities(this.mAuthentication.getGrantedAuthorityByUser(user.getId()));
        return user;
    }


}
