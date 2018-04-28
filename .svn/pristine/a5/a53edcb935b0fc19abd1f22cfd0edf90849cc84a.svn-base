package cn.com.gtmc.glaf2.controller.system;

import cn.com.gtmc.glaf2.base.BaseController;
import cn.com.gtmc.glaf2.base.BaseService;
import cn.com.gtmc.glaf2.entity.security.Role;
import cn.com.gtmc.glaf2.service.security.RoleService;
import cn.com.gtmc.glaf2.tools.log.Logger;
import cn.com.gtmc.glaf2.tools.web.ReturnMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * 角色管理
 *
 * @author intasect
 */
@Controller
@RequestMapping("system/role")
public class RoleController implements BaseController<Role> {

    private static final Logger LOG = Logger.getLogger(RoleController.class);

    @Autowired
    private RoleService mRoleService;

    public RoleController() {
        LOG.debug("init...");
    }

    @Override
    public BaseService getService() {
        return this.mRoleService;
    }

    /**
     * 进去角色权限配置
     *
     * @param role 角色
     * @return 页面
     */
    @RequestMapping("role-auth")
    public ModelAndView roleAuth(Role role) {
        Role current = this.mRoleService.findById(role.getId());
        ModelAndView mav = new ModelAndView(this.getViewPath() + "/role-auth");
        mav.addObject("role", current);
        return mav;
    }

    /**
     * 保存角色对应的权限
     *
     * @param role
     * @return ReturnMessage
     */
    @ResponseBody
    @RequestMapping("save-auth")
    public ReturnMessage saveAuth(Role role) {
        this.mRoleService.saveRoleScreenAuth(role);
        return this.ok();
    }

    /**
     * 删除(物理删除)
     *
     * @param role
     * @return ReturnMessage
     */
    @ResponseBody
    @RequestMapping("delete")
    public ReturnMessage delete(Role role) {
        this.mRoleService.delete(role.getId());
        return this.ok();
    }

    /**
     * 用户选择(公用选择弹窗)
     *
     * @return ModelAndView
     */
    @RequestMapping("choose")
    public ModelAndView choose() {
        return new ModelAndView("system/role/choose");
    }
}
