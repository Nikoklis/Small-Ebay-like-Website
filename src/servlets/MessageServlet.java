package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.MessageDAO;
import daos.MessageDAOImpl;
import daos.UserDAO;
import daos.UserDAOImpl;
import model.Message;
import model.User;

/**
 * Servlet implementation class MessageServlet
 */
@WebServlet("/MessageServlet")
public class MessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = (String) request.getSession().getAttribute("savedUsername");
		String function = request.getParameter("function");
		
		if (function!= null)
		{
			if(function.equals("Inbox"))
			{
				UserDAO userdao = new UserDAOImpl();
				User user = userdao.find(username);
				request.setAttribute("userMessagesInc", user.getMessages1());
				request.getRequestDispatcher("/UserInbox.jsp").forward(request, response);
			}
			else if(function.equals("Outbox"))
			{
				UserDAO userdao = new UserDAOImpl();
				User user = userdao.find(username);
				request.setAttribute("userMessagesOut", user.getMessages2());
				request.getRequestDispatcher("/UserOutbox.jsp").forward(request, response);
			}
			else if(function.equals("delete"))
			{
				UserDAO userdao = new UserDAOImpl();
				User user = userdao.find(username);
				String messageID = request.getParameter("messageToDelete");
				int messID = Integer.parseInt(messageID);
				MessageDAO messagedao = new MessageDAOImpl();
				Message message = messagedao.find(messID);
				
				
				user.getMessages1().remove(message);
				message.getUser2().getMessages2().remove(message);
				
				
				messagedao.remove(messID);
				request.getRequestDispatcher("/UserOutbox.jsp").forward(request, response);
			}
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
