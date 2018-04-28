package cn.com.gtmc.glaf2.service.security;

import cn.com.gtmc.glaf2.base.BaseService;
import cn.com.gtmc.glaf2.entity.security.UserProperty;
import cn.com.gtmc.glaf2.entity.security.UserPropertyValue;

import java.io.Serializable;
import java.util.List;


public interface UserPropertyService extends BaseService {

    /**
     * 查询用户属性值
     *
     * @return 用户属性值
     */
    List<UserProperty> findUserPropertyValue(Serializable id);

    /**
     * 判断数据库中是否存在该属性Code
     *
     * @param userProperty userProperty
     * @return 结果
     */
    List<UserProperty> isExistPropertyCode(UserProperty userProperty);

}
