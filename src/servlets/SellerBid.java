package servlets;

import java.io.IOException;
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
import model.Bid;
import model.Item;

/**
 * Servlet implementation class SellerBid
 */
@WebServlet("/SellerBid")
public class SellerBid extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SellerBid() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String itemID = request.getParameter("AucID");
		int iID = Integer.parseInt(itemID);
		ItemDAO itemdao = new ItemDAOImpl();
		Item item = itemdao.find(iID);
		
		BidDAO biddao = new BidDAOImpl();
		List<Bid> bids = biddao.findSome(item.getItem_ID());
		
		request.setAttribute("bids",bids);
		request.getRequestDispatcher("/AucInfo_Bids.jsp").forward(request, response);
		
		
		
	}

}
