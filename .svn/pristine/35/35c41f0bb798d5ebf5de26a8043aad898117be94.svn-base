package cn.com.gtmc.glaf2.mapper.notify;

import cn.com.gtmc.glaf2.base.BaseMapper;
import cn.com.gtmc.glaf2.entity.notify.Message;
import cn.com.gtmc.glaf2.entity.notify.MessageNotifyUser;
import cn.com.gtmc.glaf2.security.LoginUser;

import java.util.List;

/**
 * 站内消息数据操作类
 *
 * @author 胡一鸣
 * @version V1.0
 * @Title: MessageMapper.java
 * @Package cn.com.intasect.mapper.msg
 * @Description: 站内消息数据操作类
 * @date 2016年12月23日 上午11:04:04
 */
public interface MessageMapper extends BaseMapper {

    int insertMessageNotifyUser(List<MessageNotifyUser> list);

    List<Message> findUnreadSystemMessagesByUser(LoginUser user);

    List<Message> findUnreadUserMessagesByUser(LoginUser user);
}
