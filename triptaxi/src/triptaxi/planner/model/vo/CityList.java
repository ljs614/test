package triptaxi.planner.model.vo;

public class CityList {
	private String continentName;
	private String nationName;
	private String cityName;
	private Double latitude;
	private Double longitude;
	private String flagUrl;

	public CityList() {
		// TODO Auto-generated constructor stub
	}

	public CityList(String continentName, String nationName, String cityName, Double latitude, Double longitude,
			String flagUrl) {
		super();
		this.continentName = continentName;
		this.nationName = nationName;
		this.cityName = cityName;
		this.latitude = latitude;
		this.longitude = longitude;
		this.flagUrl = flagUrl;
	}

	public String getContinentName() {
		return continentName;
	}

	public void setContinentName(String continentName) {
		this.continentName = continentName;
	}

	public String getNationName() {
		return nationName;
	}

	public void setNationName(String nationName) {
		this.nationName = nationName;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public Double getLatitude() {
		return latitude;
	}

	public void setLatitude(Double latitude) {
		this.latitude = latitude;
	}

	public Double getLongitude() {
		return longitude;
	}

	public void setLongitude(Double longitude) {
		this.longitude = longitude;
	}

	public String getFlagUrl() {
		return flagUrl;
	}

	public void setFlagUrl(String flagUrl) {
		this.flagUrl = flagUrl;
	}

	@Override
	public String toString() {
		return "CityList [continentName=" + continentName + ", nationName=" + nationName + ", cityName=" + cityName
				+ ", latitude=" + latitude + ", longitude=" + longitude + ", flagUrl=" + flagUrl + "]";
	}







}