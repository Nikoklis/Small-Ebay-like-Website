package servlets;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.io.FileUtils;

import daos.CategoryDAO;
import daos.CategoryDAOImpl;
import daos.ItemDAO;
import daos.ItemDAOImpl;
import daos.PictureDAO;
import daos.PictureDAOImpl;
import daos.UserDAO;
import daos.UserDAOImpl;
import model.Category;
import model.Item;
import model.Picture;
import model.PicturePK;
import model.User;

/**
 * Servlet implementation class CreateAuction
 */
@WebServlet("/CreateAuction")
@MultipartConfig(fileSizeThreshold = 1024*1024*2,
				maxFileSize = 1024*1024*10,
				maxRequestSize = 1024*1024*50)
public class CreateAuction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//pictures directory
	private static final String SAVE_DIRECTORY = "uploadedFiles";
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateAuction() {
        super();
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String aucName = request.getParameter("AucName");
		String aucFirstBid = request.getParameter("AucFirstBid");
		String aucBuyPrice = request.getParameter("AucBuyPrice");
		String aucCoun = request.getParameter("AucCoun");
		String aucLoc = request.getParameter("AucLoc");
		String description = request.getParameter("AucDesc");
		String aucLong = request.getParameter("AucLong");
		String aucLat = request.getParameter("AucLat");
		
		
		
		
		
		
		////end of picture create code in server
     
		String[] categories = request.getParameterValues("category");
		
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute("savedUsername");
		
		/////
		UserDAO userdao = new UserDAOImpl();
		User user = userdao.find(username);
		
		/////
		ItemDAO itemdao = new ItemDAOImpl();
		Item item = new Item();
		
		
		
		Float floatValueBuyPrice;
		Float floatValueFirstBid;
		Float floatValueAucLong;
		Float floatValueAucLat;
		//////
		
		if(description == null )
		{
			description = "-";
		}
		
		if (aucFirstBid!= null && !aucFirstBid.isEmpty() ) 
		{
			 floatValueFirstBid = Float.valueOf(aucFirstBid);
		}
		else
		{
			floatValueFirstBid = (float) 0;
		}
		
		if(aucBuyPrice!=null && !aucBuyPrice.isEmpty())
		{
			 floatValueBuyPrice= Float.valueOf(aucBuyPrice);
		}
		else
		{
			floatValueBuyPrice = (float) 0;
		}
		
		if (aucLong != null && !aucLong.isEmpty())
		{
			floatValueAucLong = Float.parseFloat(aucLong);
		}
		else
		{
			floatValueAucLong = (float) 0;
		}
		
		if (aucLat != null && !aucLat.isEmpty())
		{
			floatValueAucLat = Float.parseFloat(aucLat);
		}
		else
		{
			floatValueAucLat = (float) 0;
		}
		
		
	
		
		//set values of item to create
		item.setName(aucName);
		if(floatValueFirstBid > floatValueBuyPrice && floatValueBuyPrice != 0)
		{
			floatValueFirstBid = floatValueBuyPrice;
		}
		
		item.setFirst_Bid(floatValueFirstBid);
		item.setBuy_Price(floatValueBuyPrice);
		item.setNumber_of_Bids(0);
		item.setCountry(aucCoun);
		item.setDescription(description);
		item.setLocation(aucLoc);
		item.setStarted("-");
		item.setEnds("-");
		item.setHas_Ended("No");
		item.setHas_Started("No");
		item.setLongtitude(floatValueAucLong);
		item.setLatitude(floatValueAucLat);
		user.setSellRating(user.getSellRating() + (float) 200.0);
		item.setUser(user);
		item.setCurently(item.getFirst_Bid());
		
		
		
		
		
		//go through categories to check where the item belongs
		if (categories!=null)
			for( String cat: categories)
			{
				CategoryDAO catdao = new CategoryDAOImpl();
				Category category = catdao.find(cat);
				item.getCategories().add(category);
			}
		
		//create item
		itemdao.create(item);
		
		//pictures in server
		String[] aucPics = request.getParameterValues("Aucpics");
		
		if(aucPics!=null)
		{
			
			
			//get picture link
			for(String pic : aucPics)
			{
				if (pic!=null && !pic.isEmpty())
				{
					String path = request.getServletContext().getRealPath("");
					String savePath = path + SAVE_DIRECTORY;
					
					String filename = pic.substring(pic.lastIndexOf("\\") + 1);
					String  newPathToSave= savePath + File.separator + filename;
					
					//save picture in database
					
					PictureDAO picdao = new PictureDAOImpl();
					PicturePK picturepk = new PicturePK();
					
					
					
					picturepk.setItems_Item_ID(item.getItem_ID());
					picturepk.setPicLink(newPathToSave);
					
					Picture picture = picdao.find(picturepk);
					
					if (picture == null)
					{
						//if pic doesnt exist in database
						picture = new Picture();
						picture.setId(picturepk);
						picture.setItem(item);
						item.getPictures().add(picture);
						
						picdao.create(picture);
						
			        }
					
					//write in server
					
					
					File fileSaveDir = new File(savePath);
					if(!fileSaveDir.exists())
					{
						//create directory for pics
						fileSaveDir.mkdir();
					}
					
					
					//write in disk
					

					
					FileWriter out = new FileWriter(newPathToSave);
					out.write(newPathToSave);
					out.close();
					
					File oldFile = new File(pic);
					File dest = new File(newPathToSave);
				
					String path1 = oldFile.getAbsolutePath();
					String path2 = dest.getAbsolutePath();
					
					
					Path source = Paths.get(path1);
					Path target = Paths.get(path2);
					
				
					
					Files.copy(source, target, StandardCopyOption.REPLACE_EXISTING);
					
					
				}
				
				
				
				
			}
			
			
			
		}
		
		request.getRequestDispatcher("/MyAuctionsManagement.jsp").forward(request, response);
	}
	

}
