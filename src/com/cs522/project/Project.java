/**
 * 
 */
package com.cs522.project;

/**
 * @author Smitha
 *
 */
public class Project {
	private String projectName;
	private String projectDesc;
	private int layoutId;
	
	public Project(){
		super();
	}
	
	public Project(String projectName, String projectDesc, int layoutId) {
		super();
		this.projectName = projectName;
		this.projectDesc = projectDesc;
		this.layoutId = layoutId;
	}
	/**
	 * @return the projectName
	 */
	public String getProjectName() {
		return projectName;
	}
	/**
	 * @param projectName the projectName to set
	 */
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	/**
	 * @return the projectDesc
	 */
	public String getProjectDesc() {
		return projectDesc;
	}
	/**
	 * @param projectDesc the projectDesc to set
	 */
	public void setProjectDesc(String projectDesc) {
		this.projectDesc = projectDesc;
	}
	/**
	 * @return the layoutId
	 */
	public int getLayoutId() {
		return layoutId;
	}
	/**
	 * @param layoutId the layoutId to set
	 */
	public void setLayoutId(int layoutId) {
		this.layoutId = layoutId;
	}
	
}
