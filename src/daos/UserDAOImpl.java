package daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import jpautils.EntityManagerHelper;
import model.Message;
import model.User;

public class UserDAOImpl implements UserDAO {

	@Override
	public void create(User user) {
		EntityManager em = EntityManagerHelper.getEntityManager();
		em.persist(user);
	}

	@Override
	public User find(String id) {
		EntityManager em = EntityManagerHelper.getEntityManager();
		User user = em.find(User.class, id);
		return user;
	}

	@Override
	public List<User> findAll() {
		EntityManager em = EntityManagerHelper.getEntityManager();
		Query query = em.createNamedQuery("User.findAll");
		@SuppressWarnings("unchecked")
		List<User> users = query.getResultList();
		return users;
	}

	@Override
	public void update(User user,String changeValue) {
		user.setStatus(changeValue);
	}
	
	public void update(User user,Message message , int i) {
		if(i==1)
		{
			user.getMessages1().add(message);
		}
		else if (i==2)
		{
			user.getMessages2().add(message);
		}
		
	}


}
