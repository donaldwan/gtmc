package cn.com.gtmc.glaf2.mapper.notify;

import cn.com.gtmc.glaf2.base.BaseMapper;
import cn.com.gtmc.glaf2.entity.notify.MessageNotifyUser;
import cn.com.gtmc.glaf2.security.LoginUser;

/**
 * 站内消息用户通知数据操作类
 *
 * @author 胡一鸣
 * @version V1.0
 * @Title: MessageReadMapper.java
 * @Package cn.com.intasect.mapper.msg
 * @Description: 站内消息用户通知数据操作类
 * @date 2016年12月23日 上午11:04:04
 */
public interface MessageNotifyUserMapper extends BaseMapper {

    /**
     * 获取用户未读用户信息数量
     *
     * @param user 用户
     * @return 未读用户信息数量
     */
    int findUnreadCountByUser(LoginUser user);

    /**
     * 更新用户通知
     *
     * @param messageNotifyUser 消息用户通知
     * @return 结果
     */
    int updateByMessageAndUser(MessageNotifyUser messageNotifyUser);
}
