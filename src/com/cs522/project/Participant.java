/**
 * 
 */
package com.cs522.project;

/**
 * @author Smitha
 *
 */
 //Basic pojo class
public class Participant {
	private String partiName;
	private String partiDesc;
	private int partiId;
	
	/**
	 * @return the partiId
	 */
	public int getPartiId() {
		return partiId;
	}
	/**
	 * @param partiId the partiId to set
	 */
	public void setPartiId(int partiId) {
		this.partiId = partiId;
	}
	/**
	 * @return the partiName
	 */
	public String getPartiName() {
		return partiName;
	}
	/**
	 * @param partiName the partiName to set
	 */
	public void setPartiName(String partiName) {
		this.partiName = partiName;
	}
	/**
	 * @return the partiDesc
	 */
	public String getPartiDesc() {
		return partiDesc;
	}
	/**
	 * @param partiDesc the partiDesc to set
	 */
	public void setPartiDesc(String partiDesc) {
		this.partiDesc = partiDesc;
	}
	
	
}
