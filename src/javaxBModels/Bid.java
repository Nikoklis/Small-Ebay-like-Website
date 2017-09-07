package javaxBModels;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Bid {
	public Users getBidder() {
		return bidder;
	}
	@XmlElement
	public void setBidder(Users bidder) {
		this.bidder = bidder;
	}
	public String getTime() {
		return time;
	}
	@XmlElement
	public void setTime(String time) {
		this.time = time;
	}
	public float getAmount() {
		return amount;
	}
	@XmlElement
	public void setAmount(float amount) {
		this.amount = amount;
	}
	private Users bidder;
	private String time;
	private float amount;
}
