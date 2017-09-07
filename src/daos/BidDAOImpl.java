package daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import jpautils.EntityManagerHelper;
import model.Bid;
import model.Item;

public class BidDAOImpl implements BidDAO {

	@Override
	public void create(Bid bid) {
		EntityManager em = EntityManagerHelper.getEntityManager();
		em.persist(bid);
	}

	@Override
	public void remove(Bid bid) {
		EntityManager em = EntityManagerHelper.getEntityManager();
	
	}

	@Override
	public List<Bid> findall() {
		EntityManager em = EntityManagerHelper.getEntityManager();
		Query query = em.createNamedQuery("Bid.findAll");
		@SuppressWarnings("unchecked")
		List<Bid> bids = query.getResultList();
		return bids;
	}

	@Override
	public Bid find(int id) {
		EntityManager em = EntityManagerHelper.getEntityManager();
		Bid bid = em.find(Bid.class, id);
		return bid;
	
	}
	
	public void update(Bid bid){
		EntityManager em = EntityManagerHelper.getEntityManager();
	}
	
	public List<Bid> findSome(int id){
		EntityManager em = EntityManagerHelper.getEntityManager();
		Query query = em.createQuery("Select b FROM Bid b where b.item.item_ID = ?1");
		query.setParameter(1,id);
		@SuppressWarnings("unchecked")
		List<Bid> bids = query.getResultList();
		return bids;
	}

}
