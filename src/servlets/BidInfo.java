package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import daos.ItemDAO;
import daos.ItemDAOImpl;

import model.Item;


/**
 * Servlet implementation class BidInfo
 */
@WebServlet("/BidInfo")
public class BidInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BidInfo() {
        super();
       
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doPost(request,response);
    }
    

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String itemname = request.getParameter("item_ID");
		
		String returnPage = null;
		int iID = Integer.parseInt(itemname);
		ItemDAO itemDAO = new ItemDAOImpl();
		Item item = itemDAO.find(iID);
		request.setAttribute("item", item);
		returnPage="/BidPage.jsp";
		
		request.getRequestDispatcher(returnPage).forward(request, response);
	}		

}
