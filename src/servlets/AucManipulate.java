package servlets;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.CategoryDAO;
import daos.CategoryDAOImpl;
import daos.ItemDAO;
import daos.ItemDAOImpl;
import daos.PictureDAO;
import daos.PictureDAOImpl;
import model.Category;
import model.Item;
import model.Picture;
import model.PicturePK;

/**
 * Servlet implementation class AucManipulate
 */
@WebServlet("/AucManipulate")
public class AucManipulate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final String SAVE_DIRECTORY = "uploadedFiles";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AucManipulate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String itemID = request.getParameter("auc");
		String function = request.getParameter("function");
		String returnPage=null;		
		ItemDAO itemdao = new ItemDAOImpl();
		
		if (itemID == null || itemID.isEmpty())
		{
			returnPage="/MainNavigation.jsp";
		}
		else if( itemID != null )
		{
			int iID = Integer.parseInt(itemID);
			if (function.equals("Start"))
			{
				Item item = itemdao.find(iID);
				
				//String started = request.getParameter("dateStarts");
				//get time of auction starting
				SimpleDateFormat sdfDate = new SimpleDateFormat("MM/dd HH:mm");
			    Date now = new Date();
			    String started = sdfDate.format(now);
			    
				String ends = request.getParameter("dateEnds");
				if(ends!=null && !ends.isEmpty() && !ends.equals(""))
				{
					//split current dateTime in date and Time
					String[] dateTime = ends.split(" ");
					
					String date = dateTime[0];
					String time = dateTime[1];
					
					//date manipulation and checking
					String[] datSplit = date.split("/");
					String day = datSplit[0];
					String month = datSplit[1];
								
					//time manipulation and checking
					String[] timeSplit = time.split(":");
					String hours = timeSplit[0];
					String minutes = timeSplit[1];
					
					
					//getting integer values of date and time
					int monthInteger = Integer.parseInt(month);
					int dayInteger = Integer.parseInt(day);
					
					int hoursInteger = Integer.parseInt(hours);
					int minutesInteger = Integer.parseInt(minutes);
					
					if (monthInteger <= 12 && monthInteger > 0 && 
							dayInteger > 0 && dayInteger <= 30 &&
							hoursInteger < 24 && hoursInteger >= 0 &&
							minutesInteger < 60  && minutesInteger >= 0)
					{
						item.setStarted(started);
						item.setEnds(ends);
						item.setHas_Started("Yes");
						request.setAttribute("auc", item);
						returnPage ="/AucInfoChoose";
					}
					else
					{
						returnPage = "/MainNavigation.jsp";
					}
				}
				else
				{
					returnPage = "/MainNavigation.jsp";
					
				}
			}
			else if (function.equals("Edit"))
			{
				//get Values
				Item item = itemdao.find(iID);
				if (item.getBids().isEmpty())
				{
					String aucName = request.getParameter("AucName");
					String aucFirstBid = request.getParameter("AucFirstBid");
					String aucBuyPrice = request.getParameter("AucBuyPrice");
					String aucCoun = request.getParameter("AucCoun");
					String aucLong = request.getParameter("AucLong");
					String aucLat = request.getParameter("AucLat");
					String aucLoc = request.getParameter("AucLoc");
					String[] categories = request.getParameterValues("category");
					String description = request.getParameter("AucDesc");
					String[] aucPics = request.getParameterValues("Aucpics");
					//set Values
					if (aucFirstBid !=null && !aucFirstBid.isEmpty())
					{
						Float floatValueFirstBid = Float.valueOf(aucFirstBid);
						item.setFirst_Bid(floatValueFirstBid);
						item.setCurently(floatValueFirstBid);
					}
					if(aucBuyPrice != null && !aucBuyPrice.isEmpty())
					{
						Float floatValueBuyPrice= Float.valueOf(aucBuyPrice);	
						item.setBuy_Price(floatValueBuyPrice);
						
					}
					
					if (aucLong != null && !aucLong.isEmpty())
					{
						Float floatValueAucLong = Float.parseFloat(aucLong);
						item.setLongtitude(floatValueAucLong);
					}
					if (aucLat != null && !aucLat.isEmpty())
					{
						Float floatValueAucLat = Float.parseFloat(aucLat);
						item.setLatitude(floatValueAucLat);
					}
					
					if(aucName != null && !aucName.isEmpty())
					{
						item.setName(aucName);
					}
					if (aucCoun != null && !aucCoun.isEmpty())
					{
						item.setCountry(aucCoun);
					}
					
					if (description != null && !description.isEmpty())
					{
						item.setDescription(description);
					}
					
					if (aucLoc != null && !aucLoc.isEmpty())
					{
						item.setLocation(aucLoc);
					}
					
					
					
					if (categories != null)
					{
						for( String cat: categories)
						{
							CategoryDAO catdao = new CategoryDAOImpl();
							Category category = catdao.find(cat);
							item.getCategories().add(category);
						}
					}
					
					
					
					////////pics
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
					
					
					itemdao.update(item);
					request.setAttribute("auc", item);
					returnPage="/MyAuctionsManagement.jsp";
				}
				else if (!item.getBids().isEmpty())
				{
					
				}
			}
		}

		request.getRequestDispatcher(returnPage).forward(request, response);
		//response.sendRedirect(returnPage);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
