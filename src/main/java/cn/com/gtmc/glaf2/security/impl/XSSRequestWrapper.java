package cn.com.gtmc.glaf2.security.impl;

import cn.com.gtmc.glaf2.tools.log.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class XSSRequestWrapper extends HttpServletRequestWrapper {

    private static final Logger LOG = Logger.getLogger(XSSRequestWrapper.class);

    public XSSRequestWrapper(HttpServletRequest request) {
        super(request);
    }

    @Override
    public String getHeader(String name) {
        return this.cleanXSS(super.getHeader(name));
    }

    @Override
    public String getParameter(String name) {
        return this.cleanXSS(super.getParameter(name));
    }

    @Override
    public String[] getParameterValues(String name) {
        String[] values = super.getParameterValues(name);
        if (values == null) {
            return new String[0];
        }
        for (int i = 0; i < values.length; i++) {
            values[i] = this.cleanXSS(values[i]);
        }
        return values;
    }

    private String cleanXSS(String value) {
        if (value == null) {
            return null;
        }
        LOG.debug("oldValue:{}", value);
        String newValue = value.replaceAll("<", "&lt;")
                .replaceAll(">", "&gt;");
/*                .replaceAll("'", "&acute;")
                .replaceAll("\"", "&quot;")
                .replaceAll("\\(", "&#40;")
                .replaceAll("\\)", "&#41;")
                .replaceAll("'", "&#39;")
                .replaceAll("eval\\((.*)\\)", "")
                .replaceAll("[\\\"\\\'][\\s]*javascript:(.*)[\\\"\\\']", "\"\"")
                .replaceAll("script", "");*/
        LOG.debug("newValue:{}", newValue);
        return newValue;
    }

}
