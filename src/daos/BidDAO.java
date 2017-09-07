package daos;

import java.util.List;

import model.Bid;

public interface BidDAO {
	public void create(Bid bid);
	public void remove(Bid bid);
	public List<Bid> findall();
	public Bid find(int id);
	public void update(Bid bid);
	public List<Bid> findSome(int id);
}
