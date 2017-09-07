package javaxBModels;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Bids {
	public List<Bid> getBid() {
		return Bid;
	}
	@XmlElement
	public void setBid(List<Bid> bids) {
		this.Bid = bids;
	}

	private List<Bid> Bid = new ArrayList<Bid>();
}
