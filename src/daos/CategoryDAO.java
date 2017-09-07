package daos;

import java.util.List;

import model.Category;

public interface CategoryDAO {
	public Category find(String idCat);
	public List<Category> findAll();
	
}
