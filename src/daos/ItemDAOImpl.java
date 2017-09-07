package daos;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import jpautils.EntityManagerHelper;
import model.Category;
import model.Item;
import model.User;

public class ItemDAOImpl implements ItemDAO {

	@Override
	public void create(Item item) {
		EntityManager em = EntityManagerHelper.getEntityManager();
		em.persist(item);
		em.flush();
		em.refresh(item);
	}

	@Override
	public Item find(int id) {
		EntityManager em = EntityManagerHelper.getEntityManager();
		Item item = em.find(Item.class, id);
		return item;
	}

	@Override
	public List<Item> findAll() {
		EntityManager em = EntityManagerHelper.getEntityManager();
		Query query = em.createNamedQuery("Item.findAll");
		@SuppressWarnings("unchecked")
		List<Item> items= query.getResultList();
		return items;
	}

	@Override
	public void remove() {
		
	}

	@Override
	public void update(Item item) {
		EntityManager em = EntityManagerHelper.getEntityManager();
		Item item1 = find(item.getItem_ID());
		if (item1==item)
		{
			em.remove(item);
			em.persist(item1);
		}
		else
		{
			em.persist(item1);
		}
	}

	@Override
	public List<Item> findSome(String UserID) {
		EntityManager em = EntityManagerHelper.getEntityManager();
		Query query = em.createQuery("Select i from Item i where i.user.username=?1");
		query.setParameter(1, UserID);
		@SuppressWarnings("unchecked")
		List<Item> items= query.getResultList();
		return items;
	}
	
	public List<Item> findSomeByID(int startingID,int finishingID)
	{
		EntityManager em = EntityManagerHelper.getEntityManager();
		Query query = em.createQuery("Select i from Item i where i.item_ID between ?1 and ?2");
		query.setParameter(1, startingID);
		query.setParameter(2, finishingID);
		@SuppressWarnings("unchecked")
		List<Item> items= query.getResultList();
		return items;

	}

	@Override
	public List<Item> findSearch(String[] categories , String name , String priceFrom , String priceTo, String Location) {
		float floatPriceFrom = 0;
		float floatPriceTo = 0;
		boolean hasNameTag = false;
		boolean hasFromTag = false;
		boolean hasToTag = false;
		boolean hasLocationTag = false;
		
		if (!name.isEmpty())
		{
			 hasNameTag = true;
		}
		
		if (!priceFrom.isEmpty())
		{
			  floatPriceFrom = Float.parseFloat(priceFrom);
			  hasFromTag = true;
		}
		
		if(!priceTo.isEmpty())
		{
			  floatPriceTo = Float.parseFloat(priceTo);
			  hasToTag = true;
		}
		
		if(!Location.isEmpty())
		{
			hasLocationTag = true;
		}
		
		EntityManager em = EntityManagerHelper.getEntityManager();
		
		if(hasNameTag && hasFromTag && hasToTag && hasLocationTag)
		{
			Query query = em.createQuery("Select i from Item i where (i.name=?1) and (i.curently between ?2 and ?3) and i.location = ?4");
			query.setParameter(1, name);
			query.setParameter(2, floatPriceFrom);
			query.setParameter(3, floatPriceTo);
			query.setParameter(4, Location);
			@SuppressWarnings("unchecked")
			List<Item> items= query.getResultList();
			return items;
		}
		if(hasNameTag && !hasFromTag && !hasToTag && hasLocationTag)
		{
			Query query = em.createQuery("Select i from Item i where (i.name=?1) and i.location = ?2 ");
			query.setParameter(1, name);
			query.setParameter(2, Location);
			@SuppressWarnings("unchecked")
			List<Item> items= query.getResultList();
			return items;
		}
		if(hasNameTag && !hasFromTag && hasToTag && hasLocationTag)
		{
			Query query = em.createQuery("Select i from Item i where (i.name=?1) and i.curently < ?2 and i.location = ?3  ");
			query.setParameter(1, name);
			query.setParameter(2, floatPriceTo);
			query.setParameter(3, Location);
			@SuppressWarnings("unchecked")
			List<Item> items= query.getResultList();
			return items;
		}
		if(hasNameTag && hasFromTag && !hasToTag && hasLocationTag)
		{
			Query query = em.createQuery("Select i from Item i where (i.name=?1) and i.curently > ?2  and i.location = ?3");
			query.setParameter(1, name);
			query.setParameter(2, floatPriceFrom);
			query.setParameter(3, Location);
			@SuppressWarnings("unchecked")
			List<Item> items= query.getResultList();
			return items;
		}
		if(!hasNameTag && hasFromTag && hasToTag && hasLocationTag)
		{
			Query query = em.createQuery("Select i from Item i where i.curently between ?1 and ?2 and i.location = ?3 ");
			query.setParameter(1, floatPriceFrom);
			query.setParameter(2, floatPriceTo);
			query.setParameter(3, Location);
			@SuppressWarnings("unchecked")
			List<Item> items= query.getResultList();
			return items;
		}
		if(!hasNameTag && !hasFromTag && hasToTag && hasLocationTag)
		{
			Query query = em.createQuery("Select i from Item i where i.curently < ?1 and i.location = ?2");
			query.setParameter(1, floatPriceTo);
			query.setParameter(2, Location);
			@SuppressWarnings("unchecked")
			List<Item> items= query.getResultList();
			return items;
		}
		if(!hasNameTag && hasFromTag && !hasToTag && hasLocationTag)
		{
			Query query = em.createQuery("Select i from Item i where i.curently > ?1 and i.location = ?2");
			query.setParameter(1, floatPriceFrom);
			query.setParameter(2, Location);
			@SuppressWarnings("unchecked")
			List<Item> items= query.getResultList();
			return items;
		}
			
		if(!hasNameTag && !hasFromTag && !hasToTag && hasLocationTag)
		{
			Query query = em.createQuery("Select i from Item i where i.location = ?1");
			query.setParameter(1, Location);
			@SuppressWarnings("unchecked")
			List<Item> items= query.getResultList();
			return items;
		}
		if(hasNameTag && hasFromTag && hasToTag && !hasLocationTag)
		{
			Query query = em.createQuery("Select i from Item i where (i.name=?1) and (i.curently between ?2 and ?3) ");
			query.setParameter(1, name);
			query.setParameter(2, floatPriceFrom);
			query.setParameter(3, floatPriceTo);
			@SuppressWarnings("unchecked")
			List<Item> items= query.getResultList();
			return items;
		}
		if(hasNameTag && !hasFromTag && !hasToTag && !hasLocationTag)
		{
			Query query = em.createQuery("Select i from Item i where (i.name=?1)  ");
			query.setParameter(1, name);
			@SuppressWarnings("unchecked")
			List<Item> items= query.getResultList();
			return items;
		}
		if(hasNameTag && !hasFromTag && hasToTag && !hasLocationTag)
		{
			Query query = em.createQuery("Select i from Item i where (i.name=?1) and i.curently < ?2 ");
			query.setParameter(1, name);
			query.setParameter(2, floatPriceTo);
			@SuppressWarnings("unchecked")
			List<Item> items= query.getResultList();
			return items;
		}
		if(hasNameTag && hasFromTag && !hasToTag && !hasLocationTag)
		{
			Query query = em.createQuery("Select i from Item i where (i.name=?1) and i.curently > ?2");
			query.setParameter(1, name);
			query.setParameter(2, floatPriceFrom);
			@SuppressWarnings("unchecked")
			List<Item> items= query.getResultList();
			return items;
		}
		if(!hasNameTag && hasFromTag && hasToTag && !hasLocationTag)
		{
			Query query = em.createQuery("Select i from Item i where i.curently between ?1 and ?2 ");
			query.setParameter(1, floatPriceFrom);
			query.setParameter(2, floatPriceTo);
			@SuppressWarnings("unchecked")
			List<Item> items= query.getResultList();
			return items;
		}
		if(!hasNameTag && !hasFromTag && hasToTag && !hasLocationTag)
		{
			Query query = em.createQuery("Select i from Item i where i.curently < ?1");
			query.setParameter(1, floatPriceTo);
			@SuppressWarnings("unchecked")
			List<Item> items= query.getResultList();
			return items;
		}
		if(!hasNameTag && hasFromTag && !hasToTag && !hasLocationTag)
		{
			Query query = em.createQuery("Select i from Item i where i.curently > ?1 ");
			query.setParameter(1, floatPriceFrom);
			@SuppressWarnings("unchecked")
			List<Item> items= query.getResultList();
			return items;
		}
			
		if(!hasNameTag && !hasFromTag && !hasToTag && !hasLocationTag)
		{
			Query query = em.createQuery("Select i from Item i ");
			@SuppressWarnings("unchecked")
			List<Item> items= query.getResultList();
			return items;
		}
		return null;
	}

	@Override
	public List<Item> findByCategory(Category cat) {
		EntityManager em = EntityManagerHelper.getEntityManager();
		Query query = em.createQuery("Select i from Item i");
		@SuppressWarnings("unchecked")
		List<Item> items= query.getResultList();
		
		List<Item> wantedItems = new ArrayList<Item>();
		for (Item item:items)
		{
			if (item.getCategories().contains(cat))
			{
				wantedItems.add(item);
			}
		}
		
		return wantedItems;
		
	}

}
