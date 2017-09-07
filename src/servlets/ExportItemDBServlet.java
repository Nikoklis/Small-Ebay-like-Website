package servlets;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;

import daos.ItemDAO;
import daos.ItemDAOImpl;
import javaxBModels.Items;

import model.Item;

/**
 * Servlet implementation class ExportItemDBServlet
 */
@WebServlet("/ExportItemDBServlet")
public class ExportItemDBServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExportItemDBServlet() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String startID = request.getParameter("startID");
		String finishID = request.getParameter("finishID");
		
		int startingID = -1;
		int finishingID = -1;
		
		ItemDAO itemdao = new ItemDAOImpl();
		List<Item> items ; itemdao.findSomeByID(startingID,finishingID);
		
		if (startID != null)
		{
			startingID = Integer.parseInt(startID);
		}
		if(finishID !=null)
		{
			finishingID = Integer.parseInt(finishID);
		}
		
		if(startingID == -1 || finishingID == -1)
		{
			//if the admin wants all items
			items = itemdao.findAll();
		}
		
	
		//if he doesnt there will be some values in start and finish IDs
		items = itemdao.findSomeByID(startingID,finishingID);
	
		
		
		try{
			File file = new File("C:\\file.xml");
			
			Items itemsXML = new Items();
			
			for(Item item : items)
			{
				javaxBModels.Item itemXML = new javaxBModels.Item();
				itemXML.setItem_ID(item.getItem_ID());
				//CATEGORIES DUPLICATE
				
				for(int i =0 ; i < item.getCategories().size();i++)
				{
					
					if(item.getCategories().get(i) != null)
					{
						javaxBModels.Category temp = new javaxBModels.Category();
						temp.setName(item.getCategories().get(i).getName());
						
						itemXML.getCategories().getCategory().add(temp);
					}
					
				}
			
				itemXML.setName(item.getName());
				itemXML.setCurrently(item.getCurently());
				itemXML.setBuy_Price(item.getBuy_Price());
				itemXML.setFirst_Bid(item.getFirst_Bid());
				itemXML.setNumber_of_Bids(item.getNumber_of_Bids());
				//BIDS DUPLICATE
				for(int i =0;i < item.getBids().size();i++)
				{
					if(item.getBids().get(i) != null)
					{
						javaxBModels.Bid temp = new javaxBModels.Bid();
						javaxBModels.Users tempUsers = new javaxBModels.Users();
						temp.setAmount(item.getBids().get(i).getAmount());
						temp.setTime(item.getBids().get(i).getTime());
						
						tempUsers.setUsername(item.getBids().get(i).getUser().getUsername());
						tempUsers.setRating(item.getBids().get(i).getUser().getBidRating());
						tempUsers.setLocation(item.getBids().get(i).getUser().getLocation());
						tempUsers.setCountry(item.getBids().get(i).getUser().getCountry());
					
						temp.setBidder(tempUsers);
						
						itemXML.getBids().getBid().add(temp);
					}
				}
				itemXML.setLocation(item.getLocation());
				itemXML.setLatitude(item.getLatitude());
				itemXML.setLongtitude(item.getLongtitude());
				itemXML.setCountry(item.getCountry());
				itemXML.setStarted(item.getStarted());
				itemXML.setEnds(item.getEnds());
				//USERS DUPLICATE
				javaxBModels.Users tempUsers = new javaxBModels.Users();
				tempUsers.setUsername(item.getUser().getUsername());
				tempUsers.setRating(item.getUser().getSellRating());
				itemXML.setSeller(tempUsers);
				
				itemXML.setDescription(item.getDescription());
				
				itemsXML.getItem().add(itemXML);
			}
								
				JAXBContext jaxbContext = JAXBContext.newInstance(javaxBModels.Items.class);
				Marshaller jaxbMarshaller =  jaxbContext.createMarshaller();
				jaxbMarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT,true);
				jaxbMarshaller.marshal(itemsXML, file);
				request.getRequestDispatcher("/LoginCheck?username=admin&password=admin").forward(request, response);
		}
		catch (Exception ex)
		{
			System.out.print(ex);
		}
		
	}

	

}
