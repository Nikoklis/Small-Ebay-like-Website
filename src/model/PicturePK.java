package model;

import java.io.Serializable;
import javax.persistence.*;

/**
 * The primary key class for the pictures database table.
 * 
 */
@Embeddable
public class PicturePK implements Serializable {
	//default serial version id, required for serializable classes.
	private static final long serialVersionUID = 1L;

	@Column(unique=true, nullable=false, length=200)
	private String picLink;

	@Column(unique=true, nullable=false)
	private int items_Item_ID;

	public PicturePK() {
	}
	public String getPicLink() {
		return this.picLink;
	}
	public void setPicLink(String picLink) {
		this.picLink = picLink;
	}
	public int getItems_Item_ID() {
		return this.items_Item_ID;
	}
	public void setItems_Item_ID(int items_Item_ID) {
		this.items_Item_ID = items_Item_ID;
	}

	public boolean equals(Object other) {
		if (this == other) {
			return true;
		}
		if (!(other instanceof PicturePK)) {
			return false;
		}
		PicturePK castOther = (PicturePK)other;
		return 
			this.picLink.equals(castOther.picLink)
			&& (this.items_Item_ID == castOther.items_Item_ID);
	}

	public int hashCode() {
		final int prime = 31;
		int hash = 17;
		hash = hash * prime + this.picLink.hashCode();
		hash = hash * prime + this.items_Item_ID;
		
		return hash;
	}
}