package cn.com.gtmc.glaf2.tags;

import cn.com.gtmc.glaf2.context.SpringContextHolder;
import cn.com.gtmc.glaf2.entity.security.Authentication;
import cn.com.gtmc.glaf2.security.LoginUser;
import cn.com.gtmc.glaf2.service.security.AuthenticationService;
import cn.com.gtmc.glaf2.tools.Util;
import cn.com.gtmc.glaf2.tools.log.Logger;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import java.util.List;
import java.util.Map;

/**
 * 按钮权限标签
 *
 * @author chenwandong
 */
public class AuthenticationButtonTag extends TagSupport {

    private static final long serialVersionUID = -1382949968227797482L;

    private static final Logger LOG = Logger.getLogger(AuthenticationButtonTag.class);
    private static final String SESSOIN_AUTH_MAP = "SESSOIN_AUTH_MAP";

    private String code;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @SuppressWarnings("unchecked")
    @Override
    public int doStartTag() throws JspException {
        LOG.debug("code:" + code);

        LoginUser loginUser = Util.getLoginUser();
        if (loginUser == null) {
            return SKIP_BODY;
        }

        java.util.Map<String, Boolean> authMap = (Map<String, Boolean>) this.pageContext.getSession().getAttribute(SESSOIN_AUTH_MAP);

        if (authMap == null) {
            AuthenticationService authenticationService = SpringContextHolder.getBean(AuthenticationService.class);
            authMap = new java.util.HashMap<>();

            List<Authentication> authentications = authenticationService.findAuthByUser(loginUser.getId());
            if (authentications != null && !authentications.isEmpty()) {
                for (Authentication authentication : authentications) {
                    authMap.put(authentication.getAuthCode(), true);
                }
            }
            this.pageContext.getSession().setAttribute(SESSOIN_AUTH_MAP, authMap);
        }

        Boolean auth = authMap.get(this.code);

        if (auth != null && auth) {
            return EVAL_BODY_INCLUDE;
        }

        return SKIP_BODY;
    }
}
