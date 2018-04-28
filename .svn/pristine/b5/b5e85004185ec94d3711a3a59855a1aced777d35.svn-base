package cn.com.gtmc.glaf2.controller;

import cn.com.gtmc.glaf2.entity.security.Authentication;
import cn.com.gtmc.glaf2.security.LoginUser;
import cn.com.gtmc.glaf2.service.notify.MessageNotifySystemService;
import cn.com.gtmc.glaf2.service.notify.MessageNotifyUserService;
import cn.com.gtmc.glaf2.service.security.AuthenticationService;
import cn.com.gtmc.glaf2.service.security.ScreenService;
import cn.com.gtmc.glaf2.tools.Util;
import cn.com.gtmc.glaf2.tools.log.Logger;
import org.apache.http.util.TextUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;


@Controller
public class MainController {
    private static final Logger LOG = Logger.getLogger(MainController.class);
    private static final String PARENT_ID = "parentId";
    private static final String LEVEL = "level";
    private static final String IS_LEAF = "isLeaf";
    private static final String EXPANDED = "expanded";

    @Autowired
    private AuthenticationService mAuthenticationService;

    @Autowired
    private ScreenService mScreenService;

    @Autowired
    private MessageNotifySystemService mMessageNotifySystemService;

    @Autowired
    private MessageNotifyUserService mMessageNotifyUserService;

    public MainController() {
        LOG.debug("Main init...");
    }

    @RequestMapping(value = "login")
    public String login() {
        LOG.debug("login...");
        return "login";
    }

    @RequestMapping(value = "main")
    public ModelAndView main() {
        LOG.debug("main...");
        ModelAndView mav = new ModelAndView("main");
        LoginUser loginUser = Util.getLoginUser();
        // 站内消息新加 2016-12-28 start
        Integer unreadCountSystem = mMessageNotifySystemService.findUnreadCountByUser(loginUser);
        Integer unreadCountUser = mMessageNotifyUserService.findUnreadCountByUser(loginUser);
        mav.addObject("unreadCount", unreadCountSystem + unreadCountUser);
        mav.addObject("unreadCountSystem", unreadCountSystem);
        mav.addObject("unreadCountUser", unreadCountUser);
        // 站内消息新加 2016-12-28 end
        mav.addObject("user", loginUser);
        mav.addObject("menus", this.mScreenService.findScreenByUser(loginUser.getId()));

        return mav;
    }

    /***
     * 加载用户对应角色的按钮权限
     * @param userId userId
     */
    public void setUserAuth(Serializable userId) {

        List<String> authList = new ArrayList<>();
        //查询用户权限
        List<Authentication> tempList = mAuthenticationService.findAuthByUser(userId);
        for (int j = 0; j < tempList.size(); j++) {
            //判空，并且去重
            if (!TextUtils.isEmpty(tempList.get(j).getAuthCode()) &&
                    !authList.contains(tempList.get(j).getAuthCode())) {
                authList.add(tempList.get(j).getAuthCode());
            }
        }
        //将查询到的权限保存到session中
        if (!authList.isEmpty()) {
            HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
            HttpSession hs = request.getSession(true);
            //将查询到的权限，添加到session中
            for (int i = 0; i < authList.size(); i++) {
                hs.setAttribute(authList.get(i), authList.get(i));
                LOG.debug("user auth..." + authList.get(i));
            }
        }
    }

    @RequestMapping("timeout")
    public String timeout() {
        LOG.debug("timeout...");
        return "timeout";
    }

    /**
     * 获取所有的业务静态资源文件
     *
     * @return 业务静态资源文件
     */
    @RequestMapping("get-js-modules")
    @ResponseBody
    public java.util.List<String> getJsModules(javax.servlet.http.HttpServletRequest request) {

        String root = request.getSession().getServletContext().getRealPath("static");
        java.io.File rootFolder = new java.io.File(root, "modules");

        return this.getFiles(rootFolder, root);
    }

    /**
     * 获取指定文件夹下的所有文件
     *
     * @param folder 文件夹
     * @return 文件
     */
    private java.util.List<String> getFiles(java.io.File folder, String rootPath) {
        java.util.List<String> files = new java.util.ArrayList<>();
        if (folder != null) {
            for (java.io.File file : folder.listFiles()) {
                if (file.isFile()) {
                    LOG.debug(file.getPath());
                    files.add("static" + file.getPath().replace(rootPath, "").replace("\\", "/"));
                } else {
                    files.addAll(this.getFiles(file, rootPath));
                }
            }
        }
        return files;
    }

    @RequestMapping("demo/tree")
    @ResponseBody
    public java.util.List<Object> tree() {
        java.util.List<Object> list = new java.util.ArrayList<>();

        java.util.Map<String, Object> map4 = new java.util.HashMap<>();
        map4.put("id", 4);
        map4.put(PARENT_ID, 3);
        map4.put("name", "name4");
        map4.put(LEVEL, 1);
        map4.put(IS_LEAF, false);
        map4.put(EXPANDED, true);
        list.add(map4);

        java.util.Map<String, Object> map5 = new java.util.HashMap<>();
        map5.put("id", 5);
        map5.put(PARENT_ID, 4);
        map5.put("name", "name5");
        map5.put(LEVEL, 2);
        map5.put(IS_LEAF, true);
        map5.put(EXPANDED, true);
        list.add(map5);

        java.util.Map<String, Object> map1 = new java.util.HashMap<>();
        map1.put("id", 1);
        map1.put(PARENT_ID, null);
        map1.put("name", "name1");
        map1.put(LEVEL, 0);
        map1.put(IS_LEAF, false);
        map1.put(EXPANDED, true);

        list.add(map1);

        java.util.Map<String, Object> map2 = new java.util.HashMap<>();
        map2.put("id", 2);
        map2.put(PARENT_ID, 1);
        map2.put("name", "name2");
        map2.put(LEVEL, 1);
        map2.put(IS_LEAF, true);
        map2.put(EXPANDED, true);

        list.add(map2);

        java.util.Map<String, Object> map3 = new java.util.HashMap<>();
        map3.put("id", 3);
        map3.put(PARENT_ID, null);
        map3.put("name", "name3");
        map3.put(LEVEL, 0);
        map3.put(IS_LEAF, false);
        map3.put(EXPANDED, true);
        list.add(map3);


        return list;
    }
}
