package cn.com.gtmc.glaf2.controller.system;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import cn.com.gtmc.glaf2.base.BaseController;
import cn.com.gtmc.glaf2.base.BaseService;
import cn.com.gtmc.glaf2.entity.security.Dictionary;
import cn.com.gtmc.glaf2.entity.security.User;
import cn.com.gtmc.glaf2.entity.security.UserProperty;
import cn.com.gtmc.glaf2.entity.security.UserRole;
import cn.com.gtmc.glaf2.security.LoginUser;
import cn.com.gtmc.glaf2.service.security.DictionaryService;
import cn.com.gtmc.glaf2.service.security.UserPropertyService;
import cn.com.gtmc.glaf2.service.security.User2Service;
import cn.com.gtmc.glaf2.tools.Util;
import cn.com.gtmc.glaf2.tools.log.Logger;
import cn.com.gtmc.glaf2.tools.web.Page;
import cn.com.gtmc.glaf2.tools.web.ReturnMessage;

/**
 * 用户管理
 *
 * @author intasect
 */
@Controller
@RequestMapping("system/user2")
public class User2Controller implements BaseController<User> {

    private static final Logger LOG = Logger.getLogger(User2Controller.class);

    @Autowired
    private User2Service mUserService;

    @Autowired
    private DictionaryService dictionaryService;

    @Autowired
    private UserPropertyService userPropertyService;

    public User2Controller() {
        LOG.debug("init...");
    }

    @Override
    public BaseService getService() {
        return this.mUserService;
    }

    /**
     * 用户状态调整
     *
     * @return ReturnMessage
     */
    @RequestMapping("change-status")
    @ResponseBody
    @Override
    public ReturnMessage changeStatus(User user) {
        User dbUser = this.mUserService.findById(user.getId());
        if ("D".equals(dbUser.getStatus())) {
            user.setStatus("A");
        } else {
            user.setStatus("D");
        }
        this.mUserService.changeStatus(user);
        return this.ok();
    }

    /**
     * 进入用户选择页面
     *
     * @return ModelAndView
     */
    @RequestMapping("choose")
    public ModelAndView choose() {
        return new ModelAndView(this.getViewPath() + "/choose");
    }

    /**
     * 用户角色配置页面
     *
     * @return ModelAndView
     */
    @RequestMapping("edit-role/{id}")
    public ModelAndView editRole(@PathVariable("id") String userId) {
        LOG.debug("edit-role...");
        ModelAndView mv = new ModelAndView(this.getViewPath() + "/edit-role");
        mv.addObject("userId", userId);
        return mv;
    }

    /**
     * 查询用户角色
     *
     * @return
     */
    @RequestMapping("find-user-role")
    @ResponseBody
    public List<UserRole> findUserRole(String id) {
        LOG.debug("find-user-role...");
        return this.mUserService.findUserRole(id);
    }

    /**
     * 保存用户角色
     *
     * @return
     */
    @RequestMapping("save-user-role")
    @ResponseBody
    public ReturnMessage saveUserRole(@RequestBody List<UserRole> userRoleList) {
        LOG.debug("save-user-role...");
        this.mUserService.saveUserRole(userRoleList);
        return this.ok();
    }

    /**
     * 显示修改用户登录密码的界面
     *
     * @param showCloseBtnFlag
     * @param modelMap
     * @return
     */
    @RequestMapping("/showPwdChangePage")
    public String showPwdChangePage(@RequestParam("showCloseBtnFlag") int showCloseBtnFlag, ModelMap modelMap) {
        modelMap.put("showCloseBtnFlag", showCloseBtnFlag);
        return "system/user/pwd-change";
    }

    @RequestMapping(value = "check-old-pwd", method = RequestMethod.POST)
    @ResponseBody
    public boolean checkOldPwd(@RequestParam("oldLoginPassword") String oldLoginPassword) {
        User loginUser = (User) LoginUser.getLoginUser();
        if (!loginUser.getPassword().equals(Util.MD5(oldLoginPassword))) {
            return false;
        }
        return true;
    }

    /**
     * 修改用户登录密码
     *
     * @param oldLoginPassword
     * @param newLoginPassword
     * @return
     */
    @RequestMapping(value = "update-pwd", method = RequestMethod.POST)
    @ResponseBody
    public ReturnMessage updatePWD(
            @RequestParam("oldLoginPassword") String oldLoginPassword,
            @RequestParam("newLoginPassword") String newLoginPassword) {
        try {
            User loginUser = (User) LoginUser.getLoginUser();

            LOG.debug("旧密码:{}", loginUser.getLoginPass());
            LOG.debug("对比值:{}", Util.MD5(oldLoginPassword));

            if (!loginUser.getPassword().equals(Util.MD5(oldLoginPassword))) {
                return this.error("输入的旧登录密码错误!");
            }

            // 更新用户登录密码时，同时记录这次修改密码的时间
            Date pwdChangeTime = new Date();
            mUserService.updateLoginPassword(Util.MD5(newLoginPassword), loginUser.getId(), pwdChangeTime);
            // 当用户登录密码修改成功后，同时将缓存中的LoginUser对象的相关属性进行更改
            loginUser.setLoginPass(Util.MD5(newLoginPassword));
            loginUser.setPwdChangeTime(pwdChangeTime);
            return this.ok();

        } catch (Exception e) {
            LOG.error("登录密码修改异常！", e);
            return this.error("登录密码修改失败！");
        }
    }

    /**
     * 进入修改编辑页面(新增也同样适用，如果新增和编辑是采用同一个view，建议采用此方法)
     *
     * @param user 参数为对应实体对象
     * @return ModelAndView
     */
    @RequestMapping(EDIT_VIEW_NAME)
    @Override
    public ModelAndView edit(User user) {
        ModelAndView mav = new ModelAndView(this.getViewPath() + EDIT_VIEW_NAME);

        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();

        if (user != null && !"".equals(Util.filter(user.getPK()))) {
            mav.addObject("model", this.getService().findById(user.getPK()));
            //获取用户扩展属性值
            List<UserProperty> userPropertyValueList = userPropertyService.findUserPropertyValue(user.getPK());
            mav.addObject("userPropertyValueList", userPropertyValueList);
        } else {
            mav.addObject("model", user);
        }
        boolean isDetail = false;
        try {
            isDetail = Boolean.parseBoolean(request.getParameter("isDetail"));
        } catch (Exception ex) {
            LOG.error("转换错误!", ex.getMessage());
        }
        mav.addObject("isDetail", isDetail);

        //获取用户类型
        List<Dictionary> dictionaryList = dictionaryService.findByTypeCode("USER_TYPE");
        mav.addObject("dictionaryList", dictionaryList);

        //获取用户扩展属性
        List<UserProperty> userPropertyList = userPropertyService.findAll();

        mav.addObject("userPropertyList", userPropertyList);


        return mav;
    }

    /**
     * 数据新增保存、编辑保存
     *
     * @param user user
     * @return ReturnMessage
     */
    @RequestMapping(value = "save", method = RequestMethod.POST)
    @ResponseBody
    @Transactional
    @Override
    public ReturnMessage save(@RequestBody User user) {
        LOG.debug("save...pk:{}", user.getPK());
        try {
            if ("".equals(Util.filter(user.getPK())) || "0".equals(Util.filter(user.getPK()))) {
                this.mUserService.insert(user);
            } else {
            	this.mUserService.update(user);
            }
            return this.ok(user);
        } catch (Exception ex) {
            LOG.error("save error!!!", ex);
            return this.error();
        }
    }
    
    /**
	 * 分页查询
	 * @param t
	 * @return
	 */
	@RequestMapping("find-custom-page")
	@ResponseBody
	public HashMap<String, Object> findCustomPage(User user){
		logger.debug("findCustomPage...");
		List<UserProperty> userPropertyList = this.userPropertyService.findAll();
		
		return this.mUserService.findCustomPage(user,userPropertyList);
	}
	/**
	 * 分页查询
	 * @param t
	 * @return
	 */
	@RequestMapping("find-custom-page2")
	@ResponseBody
	public Page<HashMap<String, Object>> findCustomPage2(@RequestParam HashMap<String, Object> userMap){
		logger.debug("findCustomPage...");
		List<UserProperty> userPropertyList = this.userPropertyService.findAll();
		
		userMap.put("userPropertyList", userPropertyList);
		return this.mUserService.findCustomPage2(userMap);
	}

	
	/**
     * 同步u_user_temp表 用户信息
     * @return
     */
    @RequestMapping(value = "syncUserInfo", method = RequestMethod.POST)
    @ResponseBody
    public void syncDeptInfo(){
    	 this.mUserService.syncUserInfo();
    }
	
}