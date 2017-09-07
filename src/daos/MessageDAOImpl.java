package daos;

import javax.persistence.EntityManager;

import jpautils.EntityManagerHelper;
import model.Message;

public class MessageDAOImpl implements MessageDAO {

	@Override
	public void create(Message message) {
		EntityManager em = EntityManagerHelper.getEntityManager();
		em.persist(message);
	}

	@Override
	public void remove(int helper) {
		EntityManager em = EntityManagerHelper.getEntityManager();
		Message message = em.find(Message.class, helper);
		em.remove(message);
	}

	@Override
	public Message find(int helper) {
		EntityManager em = EntityManagerHelper.getEntityManager();
		Message message = em.find(Message.class, helper);
		return message;
	}

	@Override
	public void update(Message message) {
		if (message.getStatus() == 0)
		{
			message.setStatus(1);
		}
		else if (message.getStatus() == 1)
		{
			message.setStatus(0);
		}	
	}

}
