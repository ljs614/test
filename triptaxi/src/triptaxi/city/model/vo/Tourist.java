package triptaxi.city.model.vo;

public class Tourist {
	
	private String imgUrl;
	private String touristTitle;
	private String touristContent;
	
	public Tourist() {
		// TODO Auto-generated constructor stub
	}

	public Tourist(String imgUrl, String touristTitle, String touristContent) {
		super();
		this.imgUrl = imgUrl;
		this.touristTitle = touristTitle;
		this.touristContent = touristContent;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public String getTouristTitle() {
		return touristTitle;
	}

	public void setTouristTitle(String touristTitle) {
		this.touristTitle = touristTitle;
	}

	public String getTouristContent() {
		return touristContent;
	}

	public void setTouristContent(String touristContent) {
		this.touristContent = touristContent;
	}

	@Override
	public String toString() {
		return "Tourist [imgUrl=" + imgUrl + ", touristTitle=" + touristTitle + ", touristContent=" + touristContent
				+ "]";
	}
	
	

}
