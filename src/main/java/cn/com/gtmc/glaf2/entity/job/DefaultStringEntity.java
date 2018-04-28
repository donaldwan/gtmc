package cn.com.gtmc.glaf2.entity.job;

import cn.com.gtmc.glaf2.base.BaseEntity;

/**
 * 对ID为字符串的默认实现
 *
 * @author 陈万东
 * @version V1.0
 * @Title: DefaultEntity.java
 * @Package cn.com.gtmc.glaf2.simple
 * @Description: 对ID为字符串的默认实现
 * @date 2016年3月16日 上午11:01:36
 */
public class DefaultStringEntity extends BaseEntity<String> {

    private static final long serialVersionUID = -1497377384410258919L;

    @Override
    public String getId() {
        return super.getId();
    }

    @Override
    public void setId(String id) {
        super.setId(id);
    }

    @Override
    public String getCreatedUserId() {
        return super.getCreatedUserId();
    }

    @Override
    public void setCreatedUserId(String createdUserId) {
        super.setCreatedUserId(createdUserId);
    }

    @Override
    public String getUpdatedUserId() {
        return super.getUpdatedUserId();
    }

    @Override
    public void setUpdatedUserId(String updatedUserId) {
        super.setUpdatedUserId(updatedUserId);
    }
}
