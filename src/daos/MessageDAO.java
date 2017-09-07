package daos;

import model.Message;

public interface MessageDAO {
	public void create(Message message);
	public void remove(int helper);
	public Message find(int helper);
	public void update(Message message);
}

