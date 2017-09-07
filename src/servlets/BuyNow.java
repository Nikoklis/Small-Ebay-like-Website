package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.ItemDAO;
import daos.ItemDAOImpl;
import daos.UserDAO;
import daos.UserDAOImpl;
import model.Item;
import model.User;

/**
 * Servlet implementation class BuyNow
 */
@WebServlet("/BuyNow")
public class BuyNow extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyNow() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String itemID = request.getParameter("itemID");
		HttpSession session = request.getSession();
		
		String username = (String) session.getAttribute("savedUsername");
		
		
		int iID = Integer.parseInt(itemID);
		
		ItemDAO itemdao = new ItemDAOImpl();
		UserDAO userdao = new UserDAOImpl();
		
		User user = userdao.find(username);
		Item item = itemdao.find(iID);
		
		item.setHas_Ended("Yes");
		user.setBidRating(user.getBidRating() + 150);
		
		request.getRequestDispatcher("NewMessage.jsp").forward(request, response);
		
		
	}

	

}
