package servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.BidDAO;
import daos.BidDAOImpl;
import daos.ItemDAO;
import daos.ItemDAOImpl;
import daos.UserDAO;
import daos.UserDAOImpl;
import model.Bid;
import model.Item;
import model.User;

/**
 * Servlet implementation class Bids
 */
@WebServlet("/Bids")
public class Bids extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Bids() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String returnPage= null;
		String sellerIF = request.getParameter("function");
		
		if(sellerIF == null || sellerIF.isEmpty())
		{
			BidDAO biddao = new BidDAOImpl();
			ItemDAO itemdao = new ItemDAOImpl();
			UserDAO userdao = new UserDAOImpl();
			
			
			String itemname = request.getParameter("item_ID");
			String user_id = request.getParameter("user_ID");
			String amount = request.getParameter("bidamount");
			int iID = Integer.parseInt(itemname);
				
			//get user and item
			User user = userdao.find(user_id);
			Item item = itemdao.find(iID);
				
			//get time of bid
			SimpleDateFormat sdfDate = new SimpleDateFormat("MM/dd HH:mm");//dd/MM
		    Date now = new Date();
		    String time = sdfDate.format(now);
			 
				
			Bid bid = new Bid();
				
				
			if (amount !=null && !amount.isEmpty() && item.getHas_Started().equals("Yes"))
			{
				Float floatAmountValue = Float.valueOf(amount);
				if (floatAmountValue > item.getCurently() && item.CanBeBid())
				{
					
					//different conditions if buyPrice is set or not
					if(item.getBuy_Price() == 0 )
					{
						bid.setAmount(floatAmountValue);
						bid.setItem(item);
						user.setBidRating(user.getBidRating() + (float) 100.0);
						bid.setUser(user);
						bid.setTime(time);
						item.getBids().add(bid);
						item.setCurently(floatAmountValue);
						user.getBids().add(bid);
						item.setNumber_of_Bids(item.getNumber_of_Bids()+1);
						
						
						
						biddao.create(bid);
						List<Bid> bids = biddao.findSome(item.getItem_ID());
						request.setAttribute("bids", bids);
						returnPage = "/AucInfo_Bids.jsp";
					}
					else 
					{
						//1 extra condition if buyPrice is set
						if (floatAmountValue < item.getBuy_Price())
						{
							bid.setAmount(floatAmountValue);
							bid.setItem(item);
							user.setBidRating(user.getBidRating() + (float) 100.0);
							bid.setUser(user);
							bid.setTime(time);
							item.getBids().add(bid);
							item.setCurently(floatAmountValue);
							user.getBids().add(bid);
							item.setNumber_of_Bids(item.getNumber_of_Bids()+1);
							
							
							
							biddao.create(bid);
							List<Bid> bids = biddao.findSome(item.getItem_ID());
							request.setAttribute("bids", bids);
							returnPage = "/AucInfo_Bids.jsp";
						}
						else
						{
							returnPage = "BidInfo";
						}
							
					}
					
				}
				else {
					//need a bigger bid 
					//lowest one is bigger than the one offered
					//or bigger than buy price
					returnPage = "BidInfo";
				}
				
			}
			else
			{
				//auction has started
				returnPage = "BidInfo";
			}
		}
		else if (sellerIF.equals("seller"))
		{
			String itemID = request.getParameter("AucID");
			int iID = Integer.parseInt(itemID);
			ItemDAO itemdao = new ItemDAOImpl();
			Item item = itemdao.find(iID);
			
			BidDAO biddao = new BidDAOImpl();
			List<Bid> bids = biddao.findSome(item.getItem_ID());
			
			returnPage="/AucInfo_Bids.jsp";
			request.setAttribute("bids",bids);
			request.setAttribute("auc", item);
		}
		request.getRequestDispatcher(returnPage).forward(request, response);
	}



}
