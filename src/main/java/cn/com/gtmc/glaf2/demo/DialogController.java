package cn.com.gtmc.glaf2.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * 演示各种Dialog例子
 *
 * @author intasect
 */
@Controller
@RequestMapping("demo/dialog")
public class DialogController {

    @RequestMapping("index")
    public ModelAndView index() {
        return new ModelAndView("demo/dialog/index");
    }
}
