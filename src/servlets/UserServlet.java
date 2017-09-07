package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.UserDAO;
import daos.UserDAOImpl;
import model.Message;
import model.User;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		UserDAO userdao = new UserDAOImpl();
		String username = (String) request.getSession().getAttribute("savedUsername");
		User user = userdao.find(username);
		
		int userUnreadCount =0;
		for (Message message : user.getMessages1())
		{
			if (message.getStatus() == 0)
			{
				userUnreadCount ++;
			}
		}
		
		request.setAttribute("user1", user);
		request.setAttribute("UserUnreadCount", userUnreadCount);
		request.getRequestDispatcher("/UserPage.jsp").forward(request, response);
	}
}
