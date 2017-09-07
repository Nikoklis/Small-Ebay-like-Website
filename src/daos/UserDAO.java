package daos;

import java.util.List;

import model.Message;
import model.User;

public interface UserDAO {
	public void create(User user);
	public User find(String id);
	public List<User> findAll();
	void update(User user, String changeValue);
	public void update(User user,Message message,int i);
}
