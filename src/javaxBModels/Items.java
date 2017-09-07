package javaxBModels;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement
public class Items {
	
	public List<Item> getItem() {
		return item;
	}
	@XmlElement
	public void setItem(List<Item> items) {
		this.item = items;
	}

	private List<Item> item = new ArrayList<Item>();
	
}
