package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.CategoryDAO;
import daos.CategoryDAOImpl;
import daos.ItemDAO;
import daos.ItemDAOImpl;
import model.Category;
import model.Item;

/**
 * Servlet implementation class CheckForAdvancedSearch
 */
@WebServlet("/CheckForAdvancedSearch")
public class CheckForAdvancedSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public CheckForAdvancedSearch() {
        super();
        
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String function = request.getParameter("function");
		String returnPage = null;
		if(function.equals("otherSearch"))
		{
			String name = request.getParameter("name");
			String priceFrom = request.getParameter("PriceFrom");
			String priceTo= request.getParameter("PriceTo");
			String Location = request.getParameter("location");
			
			String[] categories = request.getParameterValues("category");
			
			ItemDAO itemdao = new ItemDAOImpl();
			
			List<Item> wantedItemList = itemdao.findSearch(categories,name,priceFrom,priceTo,Location);
			request.setAttribute("wantedItems", wantedItemList);
			returnPage = "/RenewedSearchPage.jsp";
		}
		else if(function.equals("Art"))
		{
			ItemDAO itemdao = new ItemDAOImpl();
			CategoryDAO catdao = new CategoryDAOImpl();
			Category cat = catdao.find("art");
			List<Item> wantedItemList= itemdao.findByCategory(cat);
			
			request.setAttribute("wantedItems", wantedItemList);
			returnPage = "/RenewedSearchPage.jsp";
		} 
		else if(function.equals("Collectibles"))
		{
			ItemDAO itemdao = new ItemDAOImpl();
			CategoryDAO catdao = new CategoryDAOImpl();
			Category cat = catdao.find("collectibles");
			List<Item> wantedItemList= itemdao.findByCategory(cat);
			request.setAttribute("wantedItems", wantedItemList);
			returnPage = "/RenewedSearchPage.jsp";
		}
		else if(function.equals("Food"))
		{
			ItemDAO itemdao = new ItemDAOImpl();
			CategoryDAO catdao = new CategoryDAOImpl();
			Category cat = catdao.find("food");
			List<Item> wantedItemList= itemdao.findByCategory(cat);
			
			request.setAttribute("wantedItems", wantedItemList);
			returnPage = "/RenewedSearchPage.jsp";
		}
		else if(function.equals("Clothing"))
		{
			ItemDAO itemdao = new ItemDAOImpl();
			CategoryDAO catdao = new CategoryDAOImpl();
			Category cat = catdao.find("clothing");
			List<Item> wantedItemList= itemdao.findByCategory(cat);
			
			request.setAttribute("wantedItems", wantedItemList);
			returnPage = "/RenewedSearchPage.jsp";
		}
		else if(function.equals("Literature"))
		{
			ItemDAO itemdao = new ItemDAOImpl();
			CategoryDAO catdao = new CategoryDAOImpl();
			Category cat = catdao.find("literature");
			List<Item> wantedItemList= itemdao.findByCategory(cat);
			
			request.setAttribute("wantedItems", wantedItemList);
			returnPage = "/RenewedSearchPage.jsp";
		}
		else if(function.equals("Health"))
		{
			ItemDAO itemdao = new ItemDAOImpl();
			CategoryDAO catdao = new CategoryDAOImpl();
			Category cat = catdao.find("health");
			System.out.println(cat.getName());
			List<Item> wantedItemList= itemdao.findByCategory(cat);
			
			request.setAttribute("wantedItems", wantedItemList);
			returnPage = "/RenewedSearchPage.jsp";
		}
		else if(function.equalsIgnoreCase("Electronics"))
		{
			ItemDAO itemdao = new ItemDAOImpl();
			CategoryDAO catdao = new CategoryDAOImpl();
			Category cat = catdao.find("electronics");
			List<Item> wantedItemList= itemdao.findByCategory(cat);
			
			request.setAttribute("wantedItems", wantedItemList);
			returnPage = "/RenewedSearchPage.jsp";
		}
		else if(function.equalsIgnoreCase("Gaming"))
		{
			ItemDAO itemdao = new ItemDAOImpl();
			CategoryDAO catdao = new CategoryDAOImpl();
			Category cat = catdao.find("gaming");
			List<Item> wantedItemList= itemdao.findByCategory(cat);
			
			request.setAttribute("wantedItems", wantedItemList);
			returnPage = "/RenewedSearchPage.jsp";
		}
		else if(function.equalsIgnoreCase("Decor"))
		{
			ItemDAO itemdao = new ItemDAOImpl();
			CategoryDAO catdao = new CategoryDAOImpl();
			Category cat = catdao.find("decor");
			List<Item> wantedItemList= itemdao.findByCategory(cat);
			
			request.setAttribute("wantedItems", wantedItemList);
			returnPage = "/RenewedSearchPage.jsp";
		}
		
		request.getRequestDispatcher(returnPage).forward(request, response);
	}

}
