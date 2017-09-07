package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.ItemDAO;
import daos.ItemDAOImpl;
import model.Item;

/**
 * Servlet implementation class AuctionSearch
 */
@WebServlet("/AuctionSearch")
public class AuctionSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AuctionSearch() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ItemDAO itemDAO = new ItemDAOImpl();
		List<Item> items = itemDAO.findAll();
		request.setAttribute("items", items);
		request.getRequestDispatcher("/SearchingAuc.jsp").forward(request, response);
		
		
	}


}
