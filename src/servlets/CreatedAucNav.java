package servlets;

import java.io.IOException;
import org.apache.commons.lang3.math.NumberUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.CategoryDAO;
import daos.CategoryDAOImpl;
import daos.ItemDAO;
import daos.ItemDAOImpl;
import daos.UserDAO;
import daos.UserDAOImpl;
import model.Item;
import model.User;
import model.Category;

/**
 * Servlet implementation class CreatedAucNav
 */
@WebServlet("/CreatedAucNav")
public class CreatedAucNav extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreatedAucNav() {
        super();

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getRequestDispatcher("/CreatedAucNav.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ItemDAO itemdao = new ItemDAOImpl();
		String UserID = request.getParameter("User_ID");
		List<Item> items = itemdao.findSome(UserID);
		request.setAttribute("itemsUserAuc", items);
		request.getRequestDispatcher("/CreatedAucNav.jsp").forward(request, response);
	}

}
