package cn.com.gtmc.glaf2.controller.system;

import cn.com.gtmc.glaf2.base.BaseController;
import cn.com.gtmc.glaf2.base.BaseService;
import cn.com.gtmc.glaf2.entity.security.Authentication;
import cn.com.gtmc.glaf2.entity.security.Role;
import cn.com.gtmc.glaf2.entity.security.Screen;
import cn.com.gtmc.glaf2.security.LoginUser;
import cn.com.gtmc.glaf2.service.security.AuthenticationService;
import cn.com.gtmc.glaf2.service.security.RoleScreenService;
import cn.com.gtmc.glaf2.service.security.ScreenService;
import cn.com.gtmc.glaf2.tools.Util;
import cn.com.gtmc.glaf2.tools.log.Logger;
import cn.com.gtmc.glaf2.tools.web.ReturnMessage;
import org.apache.http.util.TextUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("system/screen")
public class ScreenController implements BaseController<Screen> {

    private static final Logger LOG = Logger.getLogger(ScreenController.class);

    @Autowired
    private ScreenService mScreenService;

    @Autowired
    private AuthenticationService mAuthenticationService;

    @Autowired
    private RoleScreenService mRoleScreenService;

    public ScreenController() {
        LOG.debug("ScreenController init...");
    }

    @Override
    public BaseService getService() {
        return this.mScreenService;
    }

    /**
     * 获取某个用户的菜单
     *
     * @param userId userId
     * @return 用户的菜单
     */
    @ResponseBody
    @RequestMapping("find-by-user")
    public java.util.List<Screen> findByUser(
            @RequestParam(value = "userId", required = false) java.io.Serializable userId) {
        if ("".equals(Util.filter(userId))) {
            return this.mScreenService.findScreenByUser(Util.getLoginUser().getId());
        }
        return this.mScreenService.findScreenByUser(userId);
    }

    /**
     * 查询角色对应的菜单
     *
     * @param role 角色
     * @return 角色对应的菜单
     */
    @ResponseBody
    @RequestMapping("find-by-role")
    public java.util.List<Screen> findByRole(Role role) {
        return this.mScreenService.findScreenByRole(role.getId());
    }

    /**
     * 编辑子菜单
     *
     * @param parentScreenId parentScreenId
     * @param screenId       screenId
     * @return 编辑子菜单
     */
    @RequestMapping("edit-screen")
    @ResponseBody
    public ModelAndView editScreen(Integer parentScreenId, String screenId) {
        LOG.debug("editScreen....:" + parentScreenId + "_" + screenId);
        ModelAndView mav = new ModelAndView(this.getViewPath() + "/edit-screen");
        Screen mScreen = new Screen();
        if (!TextUtils.isEmpty(screenId)) {
            mScreen = mScreenService.findByScreenId(screenId);
        } else {
            mScreen.setParentId(parentScreenId);
        }
        mav.addObject("model", mScreen);
        return mav;
    }

    /**
     * 菜单资源配置
     * authId按钮id
     * authName按钮名称
     * authParentName按钮父级菜单名称
     */
    @RequestMapping("auth-screen-resource")
    @ResponseBody
    public ModelAndView authScreenResource(String screenId, String screenName) {
        LOG.debug("auth-resource:" + screenId + "_" + screenName);
        ModelAndView mav = new ModelAndView(this.getViewPath() + "/auth-resource");
        mav.addObject("authId", "");
        mav.addObject("screenId", screenId);
        mav.addObject("authParentName", screenName);
        mav.addObject("authOrScreen", false);//true:按钮,false:菜单
        return mav;
    }

    /**
     * 保存/修改菜单权限
     */
    @RequestMapping("update-resource")
    @ResponseBody
    public ReturnMessage updateResourceById(Integer screenId, Integer resourceId) {
        LOG.debug("update-resource", screenId + "_" + resourceId);
        Screen mScreen = new Screen();
        mScreen.setId(screenId);
        mScreen.setResourceId(resourceId);
        try {
            java.util.Date now = new java.util.Date();
            mScreen.setUpdatedTime(now);
            LoginUser loginUser = LoginUser.getLoginUser();
            if (loginUser != null) {
                mScreen.setUpdatedUserId(loginUser.getId());
                mScreen.setUpdatedUserName(loginUser.getUsername());
            }
            this.mScreenService.updateResource(mScreen);
            return this.ok();
        } catch (Exception ex) {
            LOG.error("save error!!!", ex);
            return this.error();
        }
    }

    /**
     * 级联删除菜单
     */
    @RequestMapping("del-screen")
    @ResponseBody
    public ReturnMessage delScreens(Integer id) {
        LOG.debug("del-screen.." + id);
        
        try {
        	this.mScreenService.delScreens(id);
            return this.ok();
        } catch (Exception ex) {
            LOG.error("del screen!!!", ex);
            return this.error();
        }
    }

    /**
     * 按钮资源配置
     * authId按钮id
     * authName按钮名称
     * authParentName按钮父级菜单名称
     */
    @RequestMapping("auth-resource")
    @ResponseBody
    public ModelAndView authResource(String authId, String authName, String authParentName) {
        LOG.debug("auth-resource:" + authId + "_" + authName + "_" + authParentName);
        ModelAndView mav = new ModelAndView(this.getViewPath() + "/auth-resource");
        mav.addObject("authId", authId);
        mav.addObject("authName", authName);
        mav.addObject("authParentName", authParentName);
        mav.addObject("authOrScreen", true);//true:按钮,false:菜单
        return mav;
    }
}
