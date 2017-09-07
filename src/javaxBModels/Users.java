package javaxBModels;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Users {
	public String getLocation() {
		return Location;
	}
	@XmlElement
	public void setLocation(String location) {
		Location = location;
	}
	public String getCountry() {
		return country;
	}
	@XmlElement
	public void setCountry(String country) {
		this.country = country;
	}
	public String getUsername() {
		return username;
	}
	@XmlAttribute(name="Username")
	public void setUsername(String username) {
		this.username = username;
	}
	public float getRating() {
		return Rating;
	}
	@XmlAttribute(name="Rating")
	public void setRating(float Rating) {
		this.Rating = Rating;
	}
	private String username;
	private float Rating;
	private String Location;
	private String country;
}
