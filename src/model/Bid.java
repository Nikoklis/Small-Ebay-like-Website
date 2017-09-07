package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the bids database table.
 * 
 */
@Entity
@Table(name="bids")
@NamedQuery(name="Bid.findAll", query="SELECT b FROM Bid b")
public class Bid implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(unique=true, nullable=false)
	private int bids_ID;

	@Column(nullable=false)
	private float amount;

	@Column(nullable=false, length=20)
	private String time;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="Bidder_ID", nullable=false)
	private User user;

	//bi-directional many-to-one association to Item
	@ManyToOne
	@JoinColumn(name="Item_ID", nullable=false)
	private Item item;

	public Bid() {
	}

	public int getBids_ID() {
		return this.bids_ID;
	}

	public void setBids_ID(int bids_ID) {
		this.bids_ID = bids_ID;
	}

	public float getAmount() {
		return this.amount;
	}

	public void setAmount(float amount) {
		this.amount = amount;
	}

	public String getTime() {
		return this.time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Item getItem() {
		return this.item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

}