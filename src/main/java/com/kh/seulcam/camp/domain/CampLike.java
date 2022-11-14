package com.kh.seulcam.camp.domain;

import java.sql.Date;

public class CampLike {
	private String memberId;
	private String campId;
	private String mapX;
	private String mapY;
	private Date campLikeDate;
	private String imgUrl;
	private String campName;
	private String campAddr;
	
	
	
	public CampLike() {}



    public CampLike(String memberId, String campId, String mapX, String mapY, Date campLikeDate, String imgUrl,
            String campName, String campAddr) {
        this.memberId = memberId;
        this.campId = campId;
        this.mapX = mapX;
        this.mapY = mapY;
        this.campLikeDate = campLikeDate;
        this.imgUrl = imgUrl;
        this.campName = campName;
        this.campAddr = campAddr;
    }



    @Override
    public String toString() {
        return "CampLike [memberId=" + memberId + ", campId=" + campId + ", mapX=" + mapX + ", mapY=" + mapY
                + ", campLikeDate=" + campLikeDate + ", imgUrl=" + imgUrl + ", campName=" + campName + ", campAddr="
                + campAddr + "]";
    }



    public String getMemberId() {
        return memberId;
    }



    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }



    public String getCampId() {
        return campId;
    }



    public void setCampId(String campId) {
        this.campId = campId;
    }



    public String getMapX() {
        return mapX;
    }



    public void setMapX(String mapX) {
        this.mapX = mapX;
    }



    public String getMapY() {
        return mapY;
    }



    public void setMapY(String mapY) {
        this.mapY = mapY;
    }



    public Date getCampLikeDate() {
        return campLikeDate;
    }



    public void setCampLikeDate(Date campLikeDate) {
        this.campLikeDate = campLikeDate;
    }



    public String getImgUrl() {
        return imgUrl;
    }



    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }



    public String getCampName() {
        return campName;
    }



    public void setCampName(String campName) {
        this.campName = campName;
    }



    public String getCampAddr() {
        return campAddr;
    }



    public void setCampAddr(String campAddr) {
        this.campAddr = campAddr;
    }
	
	
	

	
}
