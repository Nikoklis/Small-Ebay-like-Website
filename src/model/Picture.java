package model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the pictures database table.
 * 
 */
@Entity
@Table(name="pictures")
@NamedQuery(name="Picture.findAll", query="SELECT p FROM Picture p")
public class Picture implements Serializable {
	private static final long serialVersionUID = 1L;

	@EmbeddedId
	private PicturePK id;

	//bi-directional many-to-one association to Item
	@ManyToOne
	@JoinColumn(name="Items_Item_ID", nullable=false, insertable=false, updatable=false)
	private Item item;

	public Picture() {
	}

	public PicturePK getId() {
		return this.id;
	}

	public void setId(PicturePK id) {
		this.id = id;
	}

	public Item getItem() {
		return this.item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

}