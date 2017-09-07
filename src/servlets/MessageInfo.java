package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.MessageDAO;
import daos.MessageDAOImpl;
import daos.UserDAO;
import daos.UserDAOImpl;
import model.Message;
import model.User;

/**
 * Servlet implementation class MessageInfo
 */
@WebServlet("/MessageInfo")
public class MessageInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String messageID = request.getParameter("message");
		String outInParameter = request.getParameter("outIn");
		String returnPage=null;
		MessageDAO messagedao = new MessageDAOImpl();
		int messID = Integer.parseInt(messageID);
		
		Message message = messagedao.find(messID);
		
		if(message!=null && outInParameter.equals("Inbox"))
		{
			messagedao.update(message);
			request.setAttribute("message", message);
			
			HttpSession session = request.getSession();
			session.setAttribute("unreadMessageCount",(int)session.getAttribute("unreadMessageCount")-1);
			returnPage="/Message.jsp";
		}
		else {
			request.setAttribute("message", message);
			returnPage="/Message.jsp";
		}
		
		
		
		
		
		
		request.getRequestDispatcher(returnPage).forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
