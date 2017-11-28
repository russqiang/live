package com.j1703.vo;

import java.io.Serializable;

public class Anchor implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String username;
	private String password;
	private String nickName;
	private String gender;
	private String imgUrl;
	private String email;
	private String phone;
	private Integer state;
	private Integer isHot;
	private Integer typeId;
	private String liveType;
	private Integer liveCode;
	private String focusList;
	private Integer focusCount;
	private Integer liveCount;
	private String title;
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	

	

	public String getLiveType() {
		return liveType;
	}

	public void setLiveType(String liveType) {
		this.liveType = liveType;
	}

	public Integer getLiveCode() {
		return liveCode;
	}

	public void setLiveCode(Integer liveCode) {
		this.liveCode = liveCode;
	}

	public String getFocusList() {
		return focusList;
	}

	public void setFocusList(String focusList) {
		this.focusList = focusList;
	}

	public Integer getFocusCount() {
		return focusCount;
	}

	public void setFocusCount(Integer focusCount) {
		this.focusCount = focusCount;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Integer getLiveCount() {
		return liveCount;
	}

	public void setLiveCount(Integer liveCount) {
		this.liveCount = liveCount;
	}

	public Integer getIsHot() {
		return isHot;
	}

	public void setIsHot(Integer isHot) {
		this.isHot = isHot;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", password=" + password + ", nickName=" + nickName + ", gender=" + gender
				+ ", imgUrl=" + imgUrl + ", phone=" + phone + ", state=" + state + ", isHot=" + isHot + ", liveType="
				+ liveType + ", liveCode=" + liveCode + ", focusList=" + focusList + ", focusCount=" + focusCount
				+ ", liveCount=" + liveCount + ", title=" + title + "]";
	}

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	
	
}
