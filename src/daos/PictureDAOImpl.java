package daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import jpautils.EntityManagerHelper;
import model.Item;
import model.Picture;
import model.PicturePK;


public class PictureDAOImpl implements PictureDAO {

	@Override
	public void create(Picture path) {
		EntityManager em = EntityManagerHelper.getEntityManager();
		em.persist(path);
		em.flush();
		em.refresh(path);
	}

	@Override
	public void delete(String path) {
		// TODO Auto-generated method stub

	}

	@Override
	public Picture find(PicturePK path) {
		EntityManager em = EntityManagerHelper.getEntityManager();
		Picture pic = em.find(Picture.class, path);
		return pic;
	}

	@Override
	public List<Picture> findAllFromItems(Item item) {
		EntityManager em = EntityManagerHelper.getEntityManager();
		Query query = em.createQuery("Select p from pictures where p.Item.item_ID = ?1");
		query.setParameter(1,item.getItem_ID());
		@SuppressWarnings("unchecked")
		List<Picture> pics = query.getResultList();
		return pics;
	}
}
