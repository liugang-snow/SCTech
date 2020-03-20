package com.sctech.equipment.domain;

import com.sctech.common.core.domain.Ztree;

/**
 * 用于维修分类树结构
 * 
 * @author Snow
 *
 */
public class ZtreeSClass extends Ztree {
	
	private static final long serialVersionUID = 1L; 
	
	/** 紧急程度 */
    private String emergency;
    
    /** 维修班组 主键 */
    private Long teamId;
    
	/** 维修班组 名称 */
    private String teamName;

	public String getEmergency() {
		return emergency;
	}

	public void setEmergency(String emergency) {
		this.emergency = emergency;
	}

	public Long getTeamId() {
		return teamId;
	}

	public void setTeamId(Long teamId) {
		this.teamId = teamId;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
}
