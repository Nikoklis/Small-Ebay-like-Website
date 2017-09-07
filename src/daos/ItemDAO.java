package daos;

import java.util.List;

import model.Category;
import model.Item;
import model.User;

public interface ItemDAO {
	public void create(Item item);
	public Item find(int id);
	public List<Item> findAll();
	public List<Item> findSome(String UserID);
	public void remove();
	void update(Item item);
	public List<Item> findSearch(String[] categories,String name , String priceFrom,String priceTo, String Location); 
	public List<Item> findByCategory(Category cat);
	public List<Item> findSomeByID(int startingID, int finishingID);
}
