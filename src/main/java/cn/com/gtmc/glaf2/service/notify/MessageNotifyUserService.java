package cn.com.gtmc.glaf2.service.notify;

import cn.com.gtmc.glaf2.base.BaseService;
import cn.com.gtmc.glaf2.entity.notify.MessageNotifyUser;
import cn.com.gtmc.glaf2.security.LoginUser;

/**
 * 消息用户通知服务
 *
 * @author huyiming
 */
public interface MessageNotifyUserService extends BaseService {

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
