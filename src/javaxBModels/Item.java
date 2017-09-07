package javaxBModels;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Item {
	public Categories getCategories() {
		return categories;
	}
	@XmlElement
	public void setCategories(Categories categories) {
		categories = categories;
	}
	public Bids getBids() {
		return bids;
	}
	@XmlElement
	public void setBids(Bids bids) {
		this.bids = bids;
	}
	public Users getSeller() {
		return Seller;
	}
	@XmlElement
	public void setSeller(Users seller) {
		Seller = seller;
	}
	public int getItem_ID() {
		return Item_ID;
	}
	@XmlAttribute(name="Item_ID")
	public void setItem_ID(int item_ID) {
		Item_ID = item_ID;
	}
	public String getName() {
		return Name;
	}
	@XmlElement
	public void setName(String name) {
		Name = name;
	}
	public float getCurrently() {
		return Currently;
	}
	@XmlElement
	public void setCurrently(float currently) {
		Currently = currently;
	}
	public float getBuy_Price() {
		return Buy_Price;
	}
	@XmlElement
	public void setBuy_Price(float buy_Price) {
		Buy_Price = buy_Price;
	}
	public float getFirst_Bid() {
		return First_Bid;
	}
	@XmlElement
	public void setFirst_Bid(float first_Bid) {
		First_Bid = first_Bid;
	}
	public int getNumber_of_Bids() {
		return Number_of_Bids;
	}
	@XmlElement
	public void setNumber_of_Bids(int number_of_Bids) {
		Number_of_Bids = number_of_Bids;
	}
	public String getLocation() {
		return Location;
	}
	@XmlElement
	public void setLocation(String location) {
		Location = location;
	}
	public float getLatitude() {
		return latitude;
	}
	@XmlElement
	public void setLatitude(float latitude) {
		this.latitude = latitude;
	}
	public float getLongtitude() {
		return longtitude;
	}
	@XmlElement
	public void setLongtitude(float longtitude) {
		this.longtitude = longtitude;
	}
	public String getCountry() {
		return Country;
	}
	@XmlElement
	public void setCountry(String country) {
		Country = country;
	}
	public String getStarted() {
		return Started;
	}
	@XmlElement
	public void setStarted(String started) {
		Started = started;
	}
	public String getEnds() {
		return Ends;
	}
	@XmlElement
	public void setEnds(String ends) {
		Ends = ends;
	}
	public String getDescription() {
		return Description;
	}
	@XmlElement
	public void setDescription(String description) {
		Description = description;
	}
	private int Item_ID;
	private String Name;
	private Categories categories = new Categories();
	private float Currently;
	private float Buy_Price;
	private float First_Bid;
	private int Number_of_Bids;
	private Bids bids = new Bids();
	private String Location;
	private float latitude;
	private float longtitude;
	private String Country;
	private String Started;
	private String Ends;
	private Users Seller;
	private String Description;
}
