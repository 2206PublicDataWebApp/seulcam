package com.kh.seulcam.camp.domain;

public class Camp {
	private int contentId;
	private String facltNm;
	private String lineIntro;
	private String intro;
	private String bizrno;
	private String featureNm;
	private String induty;
	private String lctCl;
	private String doNm;
	private String sigunguNm;
	private String zipcode;
	private String addr1;
	private String tel;
	private String mapX;
	private String mapY;
	private String homepage;
	private String resveUrl;
	private String tooltip;
	private String glampInnerFclty;
	private String caravInnerFclty;
	private String operPdCl;
	private String operDeCl;
	private String sbrsCl;
	private String sbrsEtc;
	private String animalCmgCl;
	private String tourEraCl;
	private String firstImageUrl;
	private int blogCount;
	private String registAvi;
	private int likeCheck;
	private int likeCount;
	private String starAvg;
	
	
	
	public Camp() {}



    public Camp(int contentId, String facltNm, String lineIntro, String intro, String bizrno, String featureNm,
            String induty, String lctCl, String doNm, String sigunguNm, String zipcode, String addr1, String tel,
            String mapX, String mapY, String homepage, String resveUrl, String tooltip, String glampInnerFclty,
            String caravInnerFclty, String operPdCl, String operDeCl, String sbrsCl, String sbrsEtc, String animalCmgCl,
            String tourEraCl, String firstImageUrl, int blogCount, String registAvi, int likeCheck, int likeCount,
            String starAvg) {
        this.contentId = contentId;
        this.facltNm = facltNm;
        this.lineIntro = lineIntro;
        this.intro = intro;
        this.bizrno = bizrno;
        this.featureNm = featureNm;
        this.induty = induty;
        this.lctCl = lctCl;
        this.doNm = doNm;
        this.sigunguNm = sigunguNm;
        this.zipcode = zipcode;
        this.addr1 = addr1;
        this.tel = tel;
        this.mapX = mapX;
        this.mapY = mapY;
        this.homepage = homepage;
        this.resveUrl = resveUrl;
        this.tooltip = tooltip;
        this.glampInnerFclty = glampInnerFclty;
        this.caravInnerFclty = caravInnerFclty;
        this.operPdCl = operPdCl;
        this.operDeCl = operDeCl;
        this.sbrsCl = sbrsCl;
        this.sbrsEtc = sbrsEtc;
        this.animalCmgCl = animalCmgCl;
        this.tourEraCl = tourEraCl;
        this.firstImageUrl = firstImageUrl;
        this.blogCount = blogCount;
        this.registAvi = registAvi;
        this.likeCheck = likeCheck;
        this.likeCount = likeCount;
        this.starAvg = starAvg;
    }



    @Override
    public String toString() {
        return "Camp [contentId=" + contentId + ", facltNm=" + facltNm + ", lineIntro=" + lineIntro + ", intro=" + intro
                + ", bizrno=" + bizrno + ", featureNm=" + featureNm + ", induty=" + induty + ", lctCl=" + lctCl
                + ", doNm=" + doNm + ", sigunguNm=" + sigunguNm + ", zipcode=" + zipcode + ", addr1=" + addr1 + ", tel="
                + tel + ", mapX=" + mapX + ", mapY=" + mapY + ", homepage=" + homepage + ", resveUrl=" + resveUrl
                + ", tooltip=" + tooltip + ", glampInnerFclty=" + glampInnerFclty + ", caravInnerFclty="
                + caravInnerFclty + ", operPdCl=" + operPdCl + ", operDeCl=" + operDeCl + ", sbrsCl=" + sbrsCl
                + ", sbrsEtc=" + sbrsEtc + ", animalCmgCl=" + animalCmgCl + ", tourEraCl=" + tourEraCl
                + ", firstImageUrl=" + firstImageUrl + ", blogCount=" + blogCount + ", registAvi=" + registAvi
                + ", likeCheck=" + likeCheck + ", likeCount=" + likeCount + ", starAvg=" + starAvg + "]";
    }



    public int getContentId() {
        return contentId;
    }



    public void setContentId(int contentId) {
        this.contentId = contentId;
    }



    public String getFacltNm() {
        return facltNm;
    }



    public void setFacltNm(String facltNm) {
        this.facltNm = facltNm;
    }



    public String getLineIntro() {
        return lineIntro;
    }



    public void setLineIntro(String lineIntro) {
        this.lineIntro = lineIntro;
    }



    public String getIntro() {
        return intro;
    }



    public void setIntro(String intro) {
        this.intro = intro;
    }



    public String getBizrno() {
        return bizrno;
    }



    public void setBizrno(String bizrno) {
        this.bizrno = bizrno;
    }



    public String getFeatureNm() {
        return featureNm;
    }



    public void setFeatureNm(String featureNm) {
        this.featureNm = featureNm;
    }



    public String getInduty() {
        return induty;
    }



    public void setInduty(String induty) {
        this.induty = induty;
    }



    public String getLctCl() {
        return lctCl;
    }



    public void setLctCl(String lctCl) {
        this.lctCl = lctCl;
    }



    public String getDoNm() {
        return doNm;
    }



    public void setDoNm(String doNm) {
        this.doNm = doNm;
    }



    public String getSigunguNm() {
        return sigunguNm;
    }



    public void setSigunguNm(String sigunguNm) {
        this.sigunguNm = sigunguNm;
    }



    public String getZipcode() {
        return zipcode;
    }



    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }



    public String getAddr1() {
        return addr1;
    }



    public void setAddr1(String addr1) {
        this.addr1 = addr1;
    }



    public String getTel() {
        return tel;
    }



    public void setTel(String tel) {
        this.tel = tel;
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



    public String getHomepage() {
        return homepage;
    }



    public void setHomepage(String homepage) {
        this.homepage = homepage;
    }



    public String getResveUrl() {
        return resveUrl;
    }



    public void setResveUrl(String resveUrl) {
        this.resveUrl = resveUrl;
    }



    public String getTooltip() {
        return tooltip;
    }



    public void setTooltip(String tooltip) {
        this.tooltip = tooltip;
    }



    public String getGlampInnerFclty() {
        return glampInnerFclty;
    }



    public void setGlampInnerFclty(String glampInnerFclty) {
        this.glampInnerFclty = glampInnerFclty;
    }



    public String getCaravInnerFclty() {
        return caravInnerFclty;
    }



    public void setCaravInnerFclty(String caravInnerFclty) {
        this.caravInnerFclty = caravInnerFclty;
    }



    public String getOperPdCl() {
        return operPdCl;
    }



    public void setOperPdCl(String operPdCl) {
        this.operPdCl = operPdCl;
    }



    public String getOperDeCl() {
        return operDeCl;
    }



    public void setOperDeCl(String operDeCl) {
        this.operDeCl = operDeCl;
    }



    public String getSbrsCl() {
        return sbrsCl;
    }



    public void setSbrsCl(String sbrsCl) {
        this.sbrsCl = sbrsCl;
    }



    public String getSbrsEtc() {
        return sbrsEtc;
    }



    public void setSbrsEtc(String sbrsEtc) {
        this.sbrsEtc = sbrsEtc;
    }



    public String getAnimalCmgCl() {
        return animalCmgCl;
    }



    public void setAnimalCmgCl(String animalCmgCl) {
        this.animalCmgCl = animalCmgCl;
    }



    public String getTourEraCl() {
        return tourEraCl;
    }



    public void setTourEraCl(String tourEraCl) {
        this.tourEraCl = tourEraCl;
    }



    public String getFirstImageUrl() {
        return firstImageUrl;
    }



    public void setFirstImageUrl(String firstImageUrl) {
        this.firstImageUrl = firstImageUrl;
    }



    public int getBlogCount() {
        return blogCount;
    }



    public void setBlogCount(int blogCount) {
        this.blogCount = blogCount;
    }



    public String getRegistAvi() {
        return registAvi;
    }



    public void setRegistAvi(String registAvi) {
        this.registAvi = registAvi;
    }



    public int getLikeCheck() {
        return likeCheck;
    }



    public void setLikeCheck(int likeCheck) {
        this.likeCheck = likeCheck;
    }



    public int getLikeCount() {
        return likeCount;
    }



    public void setLikeCount(int likeCount) {
        this.likeCount = likeCount;
    }



    public String getStarAvg() {
        return starAvg;
    }



    public void setStarAvg(String starAvg) {
        this.starAvg = starAvg;
    }



    
	
	
}
