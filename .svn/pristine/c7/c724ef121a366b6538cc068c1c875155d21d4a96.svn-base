package cn.com.gtmc.glaf2.demo;

import cn.com.gtmc.glaf2.tools.Util;
import cn.com.gtmc.glaf2.tools.log.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import java.util.Locale;

/**
 * 关于国际化的Demo演示
 *
 * @author chenwandong
 */
@Controller
@RequestMapping("demo")
public class I18NController {
    private static final Logger LOG = Logger.getLogger(I18NController.class);

    public I18NController() {
        LOG.info("init...");
    }

    @RequestMapping("i18n")
    public ModelAndView i18n() {
        LOG.debug("i18n...");
        return new ModelAndView("demo/i18n");
    }

    @RequestMapping("i18n-change")
    public ModelAndView i18nChange(
            @RequestParam(required = false, value = "language") String language,
            @RequestParam(required = false, value = "country") String country,
            javax.servlet.http.HttpServletRequest request) {

        if (!"".equals(Util.filter(language))) {
            java.util.Locale locale = new Locale(language, country);
            request.getSession().setAttribute(SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME, locale);
        }

        LOG.debug("localName:" + SessionLocaleResolver.LOCALE_SESSION_ATTRIBUTE_NAME);
        return new ModelAndView("demo/i18n-change");
    }
}
