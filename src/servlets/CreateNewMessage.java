package servlets;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

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
 * Servlet implementation class CreateNewMessage
 */
@WebServlet("/CreateNewMessage")
public class CreateNewMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CreateNewMessage() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String usernameSender = (String) request.getSession().getAttribute("savedUsername");
		String usernameRecipient = request.getParameter("username");
		String subject = request.getParameter("subject");
		String messageBody = request.getParameter("comment");
		String returnPage= null;
		
		if (!usernameRecipient.isEmpty())
		{
			MessageDAO messagedao = new MessageDAOImpl();
			UserDAO userdao = new UserDAOImpl();
			
			User userRecipient = userdao.find(usernameRecipient);
			User userSender = userdao.find(usernameSender);
			if (userRecipient != null)
			{
				//get current time
				DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
				Date date = new Date();
				String currentTime = dateFormat.format(date);
				
				//create new message
				Message message = new Message();
				message.setSubject(subject);
				message.setUser1(userRecipient);
				message.setUser2(userSender);
				message.setMessage(messageBody);
				message.setTime(currentTime);
				//update user
				userdao.update(userRecipient, message, 1);
				userdao.update(userSender, message , 2);
				//set in database
				messagedao.create(message);
				returnPage = "MessageServlet?function=Inbox";
				
			}
			else
			{
				//there is no user with Recipient username
				returnPage = "/NewMessage.jsp";
			}
			
		}
		else
		{
			//user Sender didn't put a recipient username
			returnPage = "/NewMessage.jsp";
		}
		
		request.getRequestDispatcher(returnPage).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
