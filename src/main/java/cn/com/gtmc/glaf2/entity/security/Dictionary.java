package cn.com.gtmc.glaf2.entity.security;

import cn.com.gtmc.glaf2.simple.DefaultIntegerEntity;

public class Dictionary extends DefaultIntegerEntity {

    private static final long serialVersionUID = -2846117695347451021L;
    private String typeCode;
    private String dictionaryName;
    private String dictionaryCode;
    private String dictionaryValue;
    private String status;
    private Integer sortNum;
    private String remark;

    public String getTypeCode() {
        return typeCode;
    }

    public void setTypeCode(String typeCode) {
        this.typeCode = typeCode;
    }

    public String getDictionaryName() {
        return dictionaryName;
    }

    public void setDictionaryName(String dictionaryName) {
        this.dictionaryName = dictionaryName;
    }

    public String getDictionaryCode() {
        return dictionaryCode;
    }

    public void setDictionaryCode(String dictionaryCode) {
        this.dictionaryCode = dictionaryCode;
    }

    public String getDictionaryValue() {
        return dictionaryValue;
    }

    public void setDictionaryValue(String dictionaryValue) {
        this.dictionaryValue = dictionaryValue;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getSortNum() {
        return sortNum;
    }

    public void setSortNum(Integer sortNum) {
        this.sortNum = sortNum;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }


    public static final class TypeCode {
        /**
         * 附件上传存放目录:Default
         */
        public static final String ATTACHMENT_FOLDER = "ATTACHMENT_FOLDER";

        /**
         * 模版存放目录:Default
         */
        public static final String TEMPLATE_FOLDER = "TEMPLATE_FOLDER";
        
        /**
         * 文档管理系统文件目录:Default
         */
        public static final String DOCUMENT_FOLDER = "DOCUMENT_FOLDER";
    }

}
