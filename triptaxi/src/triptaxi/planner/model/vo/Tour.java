package triptaxi.planner.model.vo;

public class Tour {

	private String tourId;
	private String tourName;
	private String tourEng;
	private String city;
	private double tourLat;
	private double tourLng;
	private String imageUrl;
	private int clipCount;
	private int reviewScore;
	private String category;
	
	public Tour() {
		// TODO Auto-generated constructor stub
	}

	public Tour(String tourId, String tourName, String tourEng, String city, double tourLat, double tourLng,
			String imageUrl, int clipCount, int reviewScore, String category) {
		super();
		this.tourId = tourId;
		this.tourName = tourName;
		this.tourEng = tourEng;
		this.city = city;
		this.tourLat = tourLat;
		this.tourLng = tourLng;
		this.imageUrl = imageUrl;
		this.clipCount = clipCount;
		this.reviewScore = reviewScore;
		this.category = category;
	}

	public String getTourId() {
		return tourId;
	}

	public void setTourId(String tourId) {
		this.tourId = tourId;
	}

	public String getTourName() {
		return tourName;
	}

	public void setTourName(String tourName) {
		this.tourName = tourName;
	}

	public String getTourEng() {
		return tourEng;
	}

	public void setTourEng(String tourEng) {
		this.tourEng = tourEng;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public double getTourLat() {
		return tourLat;
	}

	public void setTourLat(double tourLat) {
		this.tourLat = tourLat;
	}

	public double getTourLng() {
		return tourLng;
	}

	public void setTourLng(double tourLng) {
		this.tourLng = tourLng;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
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
		return "Tour [tourId=" + tourId + ", tourName=" + tourName + ", tourEng=" + tourEng + ", city=" + city
				+ ", tourLat=" + tourLat + ", tourLng=" + tourLng + ", imageUrl=" + imageUrl + ", clipCount="
				+ clipCount + ", reviewScore=" + reviewScore + ", category=" + category + "]";
	}
	
	
	
}
