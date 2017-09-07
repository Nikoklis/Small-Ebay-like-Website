package model;

import java.io.Serializable;
import java.text.SimpleDateFormat;

import javax.persistence.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the items database table.
 * 
 */
@Entity
@Table(name="items")
@NamedQuery(name="Item.findAll", query="SELECT i FROM Item i")
public class Item implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int item_ID;

	private float buy_Price;

	@Column(length=45)
	private String country;

	@Column(nullable=false)
	private float curently;

	@Column(nullable=false, length=45)
	private String description;

	@Column(nullable=false, length=20)
	private String ends;

	@Column(nullable=false)
	private float first_Bid;

	@Column(nullable=false, length=5)
	private String has_Started;

	@Column(nullable=false, length=5)
	private String has_Ended;

	private float latitude;

	@Column(length=45)
	private String location;

	private float longtitude;

	@Column(length=45)
	private String name;

	@Column(nullable=false)
	private int number_of_Bids;

	@Column(nullable=false, length=20)
	private String started;

	//bi-directional many-to-one association to Bid
	@OneToMany(mappedBy="item", cascade={CascadeType.ALL})
	private List<Bid> bids = new ArrayList<Bid>();;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="Users_username", nullable=false)
	private User user;

	//bi-directional many-to-many association to Category
	@ManyToMany
	@JoinTable(
		name="items_has_category"
		, joinColumns={
			@JoinColumn(name="Items_Item_ID", nullable=false)
			}
		, inverseJoinColumns={
			@JoinColumn(name="Category_Name", nullable=false)
			}
		)
	private List<Category> categories = new ArrayList<Category>();;

	//bi-directional many-to-one association to Picture
	@OneToMany(mappedBy="item")
	private List<Picture> pictures = new ArrayList<Picture>();

	public Item() {
		this.has_Ended = new String();
	}

	public int getItem_ID() {
		return this.item_ID;
	}

	public void setItem_ID(int item_ID) {
		this.item_ID = item_ID;
	}

	public float getBuy_Price() {
		return this.buy_Price;
	}

	public void setBuy_Price(float buy_Price) {
		this.buy_Price = buy_Price;
	}

	public String getCountry() {
		return this.country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public float getCurently() {
		return this.curently;
	}

	public String getHas_Ended() {
		return this.has_Ended;
	}

	public void setHas_Ended(String has_Ended) {
		this.has_Ended = has_Ended;
	}

	public void setCurently(float curently) {
		this.curently = curently;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getEnds() {
		return this.ends;
	}

	public void setEnds(String ends) {
		this.ends = ends;
	}

	public float getFirst_Bid() {
		return this.first_Bid;
	}

	public void setFirst_Bid(float first_Bid) {
		this.first_Bid = first_Bid;
	}

	public String getHas_Started() {
		return this.has_Started;
	}

	public void setHas_Started(String has_Started) {
		this.has_Started = has_Started;
	}

	public float getLatitude() {
		return this.latitude;
	}

	public void setLatitude(float latitude) {
		this.latitude = latitude;
	}

	public String getLocation() {
		return this.location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public float getLongtitude() {
		return this.longtitude;
	}

	public void setLongtitude(float longtitude) {
		this.longtitude = longtitude;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getNumber_of_Bids() {
		return this.number_of_Bids;
	}

	public void setNumber_of_Bids(int number_of_Bids) {
		this.number_of_Bids = number_of_Bids;
	}

	public String getStarted() {
		return this.started;
	}

	public void setStarted(String started) {
		this.started = started;
	}

	public List<Bid> getBids() {
		return this.bids;
	}

	public void setBids(List<Bid> bids) {
		this.bids = bids;
	}

	public Bid addBid(Bid bid) {
		getBids().add(bid);
		bid.setItem(this);

		return bid;
	}

	public Bid removeBid(Bid bid) {
		getBids().remove(bid);
		bid.setItem(null);

		return bid;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Category> getCategories() {
		return this.categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	public List<Picture> getPictures() {
		return this.pictures;
	}

	public void setPictures(List<Picture> pictures) {
		this.pictures = pictures;
	}

	public Picture addPicture(Picture picture) {
		getPictures().add(picture);
		picture.setItem(this);

		return picture;
	}

	public Picture removePicture(Picture picture) {
		getPictures().remove(picture);
		picture.setItem(null);

		return picture;
	}
	
	public boolean CanBeBid()
	{
		//get time of bid
		SimpleDateFormat sdfDate = new SimpleDateFormat("MM/dd HH:mm");//dd/MM
	    Date now = new Date();
	    String time = sdfDate.format(now);
	    int[] integerValuesTimeGiven;
	    int[] integerValuesEndTime = null;
	    
	    integerValuesTimeGiven = Helper(time);
	    if(!this.getEnds().equals("-") )
	    	integerValuesEndTime = Helper(this.getEnds());
	    
	    if(this.getHas_Ended().equals("Yes"))
	    	return false;
	    
	    //check for month
	    if(integerValuesEndTime != null)
	    {
	    	if(integerValuesTimeGiven[0] < integerValuesEndTime[0])
		    {
		    	//month before end month so we are ok
		    	return true;
		    }
		    else if(integerValuesTimeGiven[0] == integerValuesEndTime[0]) 
		    {
		    	//we need to check for days
		    	if (integerValuesTimeGiven[1] < integerValuesEndTime[1])
		    	{
		    		//day given before end day so we are ok
		    		return true;
		    	}
		    	else if (integerValuesTimeGiven[1] == integerValuesEndTime[1])
		    	{
		    		//we need to check hours
			    	if (integerValuesTimeGiven[2] < integerValuesEndTime[2])
			    	{
			    		//hour given before end hour so we are ok
			    		return true;
			    	}
			    	else if (integerValuesTimeGiven[2] == integerValuesEndTime[2])
			    	{
			    		//we need to check minutes
				    	if (integerValuesTimeGiven[3] < integerValuesEndTime[3])
				    	{
				    		//minute given before end minute so we are ok
				    		return true;
				    	}
				    	else if (integerValuesTimeGiven[3] == integerValuesEndTime[3])
				    	{
				    		//same time return true
				    		return true;
				    	}
				    	else
				    	{
				    		//we are ahead in time so we cannot bid
				    		return false;
				    	}
			    	}
			    	else
			    	{
			    		//we are ahead in time so we cannot bid
			    		return false;
			    	}
		    	}
		    	else
		    	{
		    		//we are ahead in time so we cannot bid
		    		return false;
		    	}
		    }
		    else
		    {
		    	//we are ahead in time so we cannot bid
		    	return false;
		    }
	    }
	    else 
	    	return false;
	    
	    
	    
	}
	
	private int[] Helper(String time)
	{
		int[] integerValues = new int[4];
		
		//split date and time
		String[] dateTime = time.split(" ");
		
		//get date and time
		String date = dateTime[0];
		String time1 = dateTime[1];
			
		//split date
		String[] dateSplit = date.split("/");
		String[] timeSplit = time1.split(":");
			
		//get months and days
		String month = dateSplit[0];
		String days = dateSplit[1];
			
		//get hours and minutes
		String hours = timeSplit[0];
		String minutes = timeSplit[1];
			
		//get integerValues
		int intDays = Integer.parseInt(days);
		int intMonth = Integer.parseInt(month);
		int intHours = Integer.parseInt(hours);
		int intMinutes = Integer.parseInt(minutes);
			

		integerValues[0] = intMonth;
		integerValues[1] = intDays;
		integerValues[2] = intHours;
		integerValues[3] = intMinutes;
			
		return integerValues;
		
		
		
	}

}