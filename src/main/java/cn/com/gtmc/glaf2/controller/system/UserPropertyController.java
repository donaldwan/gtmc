package cn.com.gtmc.glaf2.controller.system;

import cn.com.gtmc.glaf2.base.BaseController;
import cn.com.gtmc.glaf2.base.BaseService;
import cn.com.gtmc.glaf2.entity.security.UserProperty;
import cn.com.gtmc.glaf2.service.security.UserPropertyService;
import cn.com.gtmc.glaf2.tools.log.Logger;
import cn.com.gtmc.glaf2.tools.web.ReturnMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 用户属性扩展管理
 *
 * @author gaoxiaodan
 */
@Controller
@RequestMapping("system/user/property")
public class UserPropertyController implements BaseController<UserProperty> {

    private static final Logger LOG = Logger.getLogger(UserPropertyController.class);

    @Autowired
    private UserPropertyService userPropertyService;

    public UserPropertyController() {
        LOG.debug("init...");
    }

    @Override
    public BaseService getService() {
        return this.userPropertyService;
    }

    /**
     * 用户属性状态调整
     *
     * @return ReturnMessage
     */
    @RequestMapping("change-status")
    @ResponseBody
    @Override
    public ReturnMessage changeStatus(UserProperty userProperty) {
        UserProperty dbUserProperty = this.userPropertyService.findById(userProperty.getId());
        if ("D".equals(dbUserProperty.getStatus())) {
            userProperty.setStatus("A");
        } else {
            userProperty.setStatus("D");
        }
        this.userPropertyService.changeStatus(userProperty);
        return this.ok();
    }

    /**
     * 判断用户属性编码是否重复
     *
     * @param userProperty userProperty
     * @return 是否重复
     */
    @RequestMapping("isExistPropertyCode")
    @ResponseBody
    public boolean isExistPropertyCode(UserProperty userProperty) {
        return this.userPropertyService.isExistPropertyCode(userProperty).isEmpty();
    }
}