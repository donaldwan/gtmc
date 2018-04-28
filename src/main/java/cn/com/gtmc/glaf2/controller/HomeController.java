package cn.com.gtmc.glaf2.controller;

import cn.com.gtmc.glaf2.tools.log.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 系统登录后首页内容页面,各个业务系统需要自己实现首页展现内容
 *
 * @author 陈万东
 * @version V1.0
 * @Title: HomeController.java
 * @Package cn.com.intasect.controller
 * @Description: 系统登录后首页内容页面,各个业务系统需要自己实现首页展现内容
 * @date 2016年5月2日 上午11:14:14
 */

@Controller
public class HomeController {
    private static final Logger LOG = Logger.getLogger(HomeController.class);
    
    /**
     * 进入首页页面
     *
     * @return 首页页面
     */
    @RequestMapping("home")
    public ModelAndView home() {
        LOG.debug("home...");
        return new ModelAndView("home");
    }
}
