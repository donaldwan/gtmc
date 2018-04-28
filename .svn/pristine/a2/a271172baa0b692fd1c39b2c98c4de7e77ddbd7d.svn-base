package cn.com.gtmc.glaf2.entity.security;

import cn.com.gtmc.glaf2.simple.DefaultIntegerEntity;

/**
 * 系统画面
 * 
 * @author lyq
 *
 */
public class Screen extends DefaultIntegerEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 4888336489902472974L;	
	
	private Integer parentId;
	private String screenName;
	private String normalCss;
	private String hotKeyCss;
	private String openType;
	private Integer resourceId;
	private int sortNum;

	private Integer checked;
	
	private boolean isParent;
	private int level = 0;
	private boolean isLeaf = true;
	private boolean expanded = true;
	
	private java.util.List<Screen> children = new java.util.ArrayList<Screen>();
	
	private java.util.List<Authentication> auths = new java.util.ArrayList<Authentication>();
	
	
	
	// 菜单
	private String uri;

	public String getScreenName() {
		return screenName;
	}

	public void setScreenName(String screenName) {
		this.screenName = screenName;
	}

	public String getNormalCss() {
		return normalCss;
	}

	public void setNormalCss(String normalCss) {
		this.normalCss = normalCss;
	}

	public String getHotKeyCss() {
		return hotKeyCss;
	}

	public void setHotKeyCss(String hotKeyCss) {
		this.hotKeyCss = hotKeyCss;
	}

	

	public String getOpenType() {
		return openType;
	}

	public void setOpenType(String openType) {
		this.openType = openType;
	}

	public int getSortNum() {
		return sortNum;
	}

	public void setSortNum(int sortNum) {
		this.sortNum = sortNum;
	}

	public String getUri() {
		return uri;
	}

	public void setUri(String uri) {
		this.uri = uri;
	}

	public Integer getChecked() {
		return checked;
	}

	public void setChecked(Integer checked) {
		this.checked = checked;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public Integer getResourceId() {
		return resourceId;
	}

	public void setResourceId(Integer resourceId) {
		this.resourceId = resourceId;
	}

	public void setSortNum(Integer sortNum) {
		this.sortNum = sortNum;
	}

	public java.util.List<Screen> getChildren() {
		return children;
	}

	public void setChildren(java.util.List<Screen> children) {
		this.children = children;
	}
	
	public boolean getIsParent() {
		return isParent;
	}

	public void setIsParent(boolean isParent) {
		this.isParent = isParent;
	}

	public java.util.List<Authentication> getAuths() {
		return auths;
	}

	public void setAuths(java.util.List<Authentication> auths) {
		this.auths = auths;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public boolean isLeaf() {
		return isLeaf;
	}

	public void setLeaf(boolean isLeaf) {
		this.isLeaf = isLeaf;
	}

	public boolean isExpanded() {
		return expanded;
	}

	public void setExpanded(boolean expanded) {
		this.expanded = expanded;
	}
}
