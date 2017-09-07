package javaxBModels;

import java.util.ArrayList;
import java.util.List;

import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement	
public class Categories {

	public List<Category> getCategory() {
		return Category;
	}
	@XmlElement
	public void setCategory(List<Category> category) {
		this.Category = category;
	}

	private List<Category> Category = new ArrayList<Category>();
}
