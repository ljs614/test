package com.triptaxi.attraction.model.vo;

public class Attraction {
	
	private String attractionId;
	private String attractionName;
	private String attractionEng;
	private String city;
	private double attractionLat;
	private double attractionLng;
	private String imageUrl;
	private String attractionComment;
	private int clipCount;
	private int reviewScore;
	private String category;
	
	public Attraction() {
		
	}

	public Attraction(String attractionId, String attractionName, String attractionEng, String city,
			double attractionLat, double attractionLng, String imageUrl, String attractionComment, int clipCount,
			int reviewScore, String category) {
		super();
		this.attractionId = attractionId;
		this.attractionName = attractionName;
		this.attractionEng = attractionEng;
		this.city = city;
		this.attractionLat = attractionLat;
		this.attractionLng = attractionLng;
		this.imageUrl = imageUrl;
		this.attractionComment = attractionComment;
		this.clipCount = clipCount;
		this.reviewScore = reviewScore;
		this.category = category;
	}

	public String getAttractionId() {
		return attractionId;
	}

	public void setAttractionId(String attractionId) {
		this.attractionId = attractionId;
	}

	public String getAttractionName() {
		return attractionName;
	}

	public void setAttractionName(String attractionName) {
		this.attractionName = attractionName;
	}

	public String getAttractionEng() {
		return attractionEng;
	}

	public void setAttractionEng(String attractionEng) {
		this.attractionEng = attractionEng;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public double getAttractionLat() {
		return attractionLat;
	}

	public void setAttractionLat(double attractionLat) {
		this.attractionLat = attractionLat;
	}

	public double getAttractionLng() {
		return attractionLng;
	}

	public void setAttractionLng(double attractionLng) {
		this.attractionLng = attractionLng;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getAttractionComment() {
		return attractionComment;
	}

	public void setAttractionComment(String attractionComment) {
		this.attractionComment = attractionComment;
	}

	public int getClipCount() {
		return clipCount;
	}

	public void setClipCount(int clipCount) {
		this.clipCount = clipCount;
	}

	public int getReviewScore() {
		return reviewScore;
	}

	public void setReviewScore(int reviewScore) {
		this.reviewScore = reviewScore;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Attraction [attractionId=" + attractionId + ", attractionName=" + attractionName + ", attractionEng="
				+ attractionEng + ", city=" + city + ", attractionLat=" + attractionLat + ", attractionLng="
				+ attractionLng + ", imageUrl=" + imageUrl + ", attractionComment=" + attractionComment + ", clipCount="
				+ clipCount + ", reviewScore=" + reviewScore + ", category=" + category + "]";
	}

	
}
