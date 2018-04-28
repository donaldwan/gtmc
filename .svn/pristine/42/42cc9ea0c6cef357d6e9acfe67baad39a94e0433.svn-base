package cn.com.gtmc.glaf2.controller.system;

import cn.com.gtmc.glaf2.base.BaseController;
import cn.com.gtmc.glaf2.base.BaseService;
import cn.com.gtmc.glaf2.entity.notify.Message;
import cn.com.gtmc.glaf2.script.ScriptButton;
import cn.com.gtmc.glaf2.security.LoginUser;
import cn.com.gtmc.glaf2.service.common.AttachmentService;
import cn.com.gtmc.glaf2.service.notify.MessageNotifySystemService;
import cn.com.gtmc.glaf2.service.notify.MessageNotifyUserService;
import cn.com.gtmc.glaf2.service.notify.MessageService;
import cn.com.gtmc.glaf2.tools.Util;
import cn.com.gtmc.glaf2.tools.log.Logger;
import cn.com.gtmc.glaf2.tools.web.ReturnMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 角色管理
 *
 * @author intasect
 */
@Controller
@RequestMapping("system/notify")
public class NotifyController implements BaseController<Message> {

    private static final Logger LOG = Logger.getLogger(RoleController.class);

    @Autowired
    private MessageService mMessageService;

    @Autowired
    private MessageNotifySystemService mMessageNotifySystemService;

    @Autowired
    private MessageNotifyUserService mMessageNotifyUserService;

    @Autowired
    private AttachmentService mAttachmentService;

    public NotifyController() {
        LOG.debug("init...");
    }

    @Override
    public BaseService getService() {
        return this.mMessageService;
    }

    @ResponseBody
    @RequestMapping("delete")
    public ReturnMessage delete(Message message) {
        this.mMessageService.delete(message.getId());
        return this.ok();
    }

    /**
     * 发布通知消息
     *
     * @param message 消息对象
     * @return 结果信息
     */
    @Override
    @RequestMapping(
            value = {"save"},
            method = {RequestMethod.POST}
    )
    @ResponseBody
    public ReturnMessage save(Message message) {
        LOG.debug("save...pk:{}", message.getPK());
        try {
        	this.mMessageService.saveMessage(message);
            return this.ok(message);
        } catch (Exception var3) {
            LOG.error("save error!!!", var3);
            return this.error();
        }
    }

    /**
     * 刷新消息数量
     *
     * @return 消息数量信息
     */
    @RequestMapping(value = "refresh-count")
    @ResponseBody
    public Map<String, Integer> refreshCount() {
        HashMap<String, Integer> result = new HashMap<>();
        LoginUser loginUser = Util.getLoginUser();

        // 检查压缩任务完成后是否需要通知
        if (mAttachmentService.isZipTaskNeedNotify()) {
            // 打包压缩文件的信息通知
            mAttachmentService.zipTaskCompleteNotify();
        }

        // 未读的系统消息数量
        Integer unreadCountSystem = mMessageNotifySystemService.findUnreadCountByUser(loginUser);
        // 未读的个人信息数量
        Integer unreadCountUser = mMessageNotifyUserService.findUnreadCountByUser(loginUser);
        result.put("unreadCount", unreadCountSystem + unreadCountUser);
        result.put("unreadCountSystem", unreadCountSystem);
        result.put("unreadCountUser", unreadCountUser);
        return result;
    }

    /**
     * 根据消息类型获取消息列表
     *
     * @param msgType 消息类型
     * @return 消息列表
     */
    @RequestMapping(value = "message")
    public ModelAndView message(String msgType) {
        ModelAndView mav = new ModelAndView(this.getViewPath() + "/message");
        List<Message> messageList = new ArrayList<>();
        LoginUser user = Util.getLoginUser();

        // 检查压缩任务完成后是否需要通知
        if (mAttachmentService.isZipTaskNeedNotify()) {
            // 打包压缩文件的信息通知
            mAttachmentService.zipTaskCompleteNotify();
        }

        // 系统消息的时候
        if ("01".equals(msgType)) {
            messageList = mMessageService.findUnreadSystemMessagesByUser(user);
        }
        // 用户个人消息的时候
        else if ("02".equals(msgType)) {
            messageList = mMessageService.findUnreadUserMessagesByUser(user);
        }
        mav.addObject("messages", messageList);
        return mav;
    }

    /**
     * 显示消息详情
     *
     * @param t 消息
     * @return 消息详细
     */
    @Override
    @RequestMapping({"/detail"})
    public ModelAndView detail(Message t) {
        LOG.debug("detail...{}", t);
        ModelAndView mav = new ModelAndView(this.getViewPath() + "/detail");
        if (t != null && !"".equals(Util.filter(t.getPK()))) {
            Message current = this.getService().findById(t.getPK());
            mav.addObject("model", current);

            // 如果是打包下载信息
            if (mAttachmentService.isZipTaskMessage(current.getId())) {
                List<ScriptButton> list = new ArrayList<>();
                ScriptButton scriptButton = new ScriptButton();
                scriptButton.setName("下载");
                scriptButton.setUrl("common/attachment/download/packaged/" + current.getId());
                list.add(scriptButton);

                mav.addObject("scripts", list);
            } else {
                mMessageService.readMessage(t);
            }
        } else {
            mav.addObject("model", t);
        }

        return mav;
    }


}
