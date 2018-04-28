package cn.com.gtmc.glaf2.entity.security;

import cn.com.gtmc.glaf2.simple.DefaultIntegerEntity;

/**
 * 部门实体类
* @Title: Dept.java
* @Package cn.com.intasect.entity.security
* @Description: TODO(用一句话描述该文件做什么)
* @author 陈万东  
* @date 2016年3月16日 上午11:04:04
* @version V1.0
 */
public class Dept extends DefaultIntegerEntity {

	private static final long serialVersionUID = -4020114048497222287L;
	
	public static final String GROUP_PREFIX = "D_";
	
	private Integer parentId;
	private String deptName;
	private String deptCode;
	
	private java.util.List<Dept> children;
	private boolean isParent;
	private int level = 0;
	private boolean isLeaf = true;
	private boolean expanded = true;
	
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	public String getDeptCode() {
		return deptCode;
	}
	public void setDeptCode(String deptCode) {
		this.deptCode = deptCode;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public java.util.List<Dept> getChildren() {
		return children;
	}
	public void setChildren(java.util.List<Dept> children) {
		this.children = children;
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
	public boolean getIsParent() {
		return isParent;
	}
	public void setIsParent(boolean isParent) {
		this.isParent = isParent;
	}
}
