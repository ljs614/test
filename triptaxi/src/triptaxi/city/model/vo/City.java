package triptaxi.city.model.vo;

public class City {
	
	private String cityName;
	private String cityEng;
	private String nationName;
	private int latitude;
	private int longitude;
	private String imageUrl;
	private String cityVideoUrl;
	private String peakSeason;
	private String volt;
	private int timeDiffence;
	private String flightTime;
	private String cityIntro;
	private int clipCount;
	
	public City() {
		// TODO Auto-generated constructor stub
	}

	public City(String cityName, String cityEng, String nationName, int latitude, int longitude, String imageUrl,
			String cityVideoUrl, String peakSeason, String volt, int timeDiffence, String flightTime, String cityIntro,
			int clipCount) {
		super();
		this.cityName = cityName;
		this.cityEng = cityEng;
		this.nationName = nationName;
		this.latitude = latitude;
		this.longitude = longitude;
		this.imageUrl = imageUrl;
		this.cityVideoUrl = cityVideoUrl;
		this.peakSeason = peakSeason;
		this.volt = volt;
		this.timeDiffence = timeDiffence;
		this.flightTime = flightTime;
		this.cityIntro = cityIntro;
		this.clipCount = clipCount;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getCityEng() {
		return cityEng;
	}

	public void setCityEng(String cityEng) {
		this.cityEng = cityEng;
	}

	public String getNationName() {
		return nationName;
	}

	public void setNationName(String nationName) {
		this.nationName = nationName;
	}

	public int getLatitude() {
		return latitude;
	}

	public void setLatitude(int latitude) {
		this.latitude = latitude;
	}

	public int getLongitude() {
		return longitude;
	}

	public void setLongitude(int longitude) {
		this.longitude = longitude;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getCityVideoUrl() {
		return cityVideoUrl;
	}

	public void setCityVideoUrl(String cityVideoUrl) {
		this.cityVideoUrl = cityVideoUrl;
	}

	public String getPeakSeason() {
		return peakSeason;
	}

	public void setPeakSeason(String peakSeason) {
		this.peakSeason = peakSeason;
	}

	public String getVolt() {
		return volt;
	}

	public void setVolt(String volt) {
		this.volt = volt;
	}

	public int getTimeDiffence() {
		return timeDiffence;
	}

	public void setTimeDiffence(int timeDiffence) {
		this.timeDiffence = timeDiffence;
	}

	public String getFlightTime() {
		return flightTime;
	}

	public void setFlightTime(String flightTime) {
		this.flightTime = flightTime;
	}

	public String getCityIntro() {
		return cityIntro;
	}

	public void setCityIntro(String cityIntro) {
		this.cityIntro = cityIntro;
	}

	public int getClipCount() {
		return clipCount;
	}

	public void setClipCount(int clipCount) {
		this.clipCount = clipCount;
	}

	@Override
	public String toString() {
		return "City [cityName=" + cityName + ", cityEng=" + cityEng + ", nationName=" + nationName + ", latitude="
				+ latitude + ", longitude=" + longitude + ", imageUrl=" + imageUrl + ", cityVideoUrl=" + cityVideoUrl
				+ ", peakSeason=" + peakSeason + ", volt=" + volt + ", timeDiffence=" + timeDiffence + ", flightTime="
				+ flightTime + ", cityIntro=" + cityIntro + ", clipCount=" + clipCount + "]";
	}

	
	
}
