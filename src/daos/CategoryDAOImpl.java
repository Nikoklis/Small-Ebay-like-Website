package daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import jpautils.EntityManagerHelper;
import model.Category;

public class CategoryDAOImpl implements CategoryDAO {

	@Override
	public Category find(String idCat) {
		EntityManager em = EntityManagerHelper.getEntityManager();
		Category cat = em.find(Category.class, idCat);
		return cat;
	}

	@Override
	public List<Category> findAll() {
		EntityManager em = EntityManagerHelper.getEntityManager();
		Query query = em.createNamedQuery("Category.findAll");
		@SuppressWarnings("unchecked")
		List<Category> cat = query.getResultList();
		return cat;
	}

}
