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
 * Servlet implementation class AucInfoChoose
 */
@WebServlet("/AucInfoChoose")
public class AucInfoChoose extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AucInfoChoose() {
        super();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doPost(request,response);
    }
    	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String itemID = request.getParameter("hiddenitemid");
		Item itemIDAttribute =  (Item) request.getAttribute("auc");
		ItemDAO itemdao = new ItemDAOImpl();
		
		String returnPage = null;
		int iId = -1;
		Item item = null;
		
		if(itemID != null)
		{
			iId = Integer.parseInt(itemID);
			item = itemdao.find(iId);
		}
		else if (itemIDAttribute != null)
		{
			item = itemIDAttribute;
		}
		
		
		if (item.getHas_Started().equals("Yes"))
		{
			if(item.getNumber_of_Bids() == 0)
			{
				request.setAttribute("auc", item);
				returnPage="/AucInfo_SN.jsp";
			}
			else
			{
				request.setAttribute("auc", item);
				returnPage="/AucInfo_S.jsp";
			}
				
		}
		else if (item.getHas_Started().equals("No"))
		{
			request.setAttribute("auc", item);
			returnPage = "/AucInfo_NS.jsp";
		}
		
		request.getRequestDispatcher(returnPage).forward(request, response);
		
		
	}

}
