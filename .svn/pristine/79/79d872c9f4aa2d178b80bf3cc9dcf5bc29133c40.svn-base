package cn.com.gtmc.glaf2.demo;

import cn.com.gtmc.glaf2.entity.mail.MailInfo;
import cn.com.gtmc.glaf2.service.common.MailService;
import cn.com.gtmc.glaf2.tools.log.Logger;
import cn.com.gtmc.glaf2.tools.web.ReturnMessage;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Calendar;
import java.util.Map;


/**
 * 模版DEMO控制器
 *
 * @author huyiming
 */
@Controller
@RequestMapping("demo/template-demo")
public class TemplateDemoController {

    private static final Logger LOG = Logger.getLogger(TemplateDemoController.class);

    @Autowired
    private MailService mMailService;

    /**
     * 模版邮件DEMO
     *
     * @return 视图
     */
    @RequestMapping("mail")
    public ModelAndView mail() {
        return new ModelAndView("demo/template-demo/mail");
    }

    @RequestMapping("sendMail")
    @ResponseBody
    public ReturnMessage sendMail(@RequestBody Map<String, Object> params) {
        ReturnMessage returnMessage = new ReturnMessage();
        try {
            String toAddress = params.get("toAddress").toString();
            String templateName = params.get("templateName").toString();
            String p = params.get("params").toString();
            ObjectMapper mapper = new ObjectMapper();
            Map<String, Object> paramsMap = mapper.readValue(p, Map.class);

            MailInfo mail = new MailInfo();
            mail.getToAddresses().add(toAddress);
            mail.setSubject("模版邮件测试" + Calendar.getInstance().getTimeInMillis());

            mMailService.sendTemplateEmail(mail, templateName, paramsMap);
        } catch (Exception ex) {
            LOG.error("模版邮件测试异常！", ex);
            returnMessage.setResultCode(ReturnMessage.ResultCode.ERROR);
            return returnMessage;
        }
        return returnMessage;
    }
}
