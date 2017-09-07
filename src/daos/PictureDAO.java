package daos;

import java.util.List;

import model.Item;
import model.Picture;
import model.PicturePK;

public interface PictureDAO {
	public void create(Picture path);
	public void delete(String path);
	public Picture find(PicturePK path);
	public List<Picture> findAllFromItems(Item item);
}
