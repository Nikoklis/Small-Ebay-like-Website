package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import daos.UserDAO;
import daos.UserDAOImpl;
import model.User;

/**
 * Servlet implementation class RegisterSucces
 */
@WebServlet("/RegisterCheck")
public class RegisterCheck extends HttpServlet {
	private static final long serialVersionUID = 102831973239L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//page to be displayed next
		String returnPage = null;
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String verifyPassword = request.getParameter("verify");
		String afm = request.getParameter("afm");
		String location = request.getParameter("location");
		String address = request.getParameter("address");
		String email = request.getParameter("mail");
		String phone_number = request.getParameter("phone");
		String country = request.getParameter("country");
		
		
		UserDAO userDAO = new UserDAOImpl();
		
		if ( !username.isEmpty() && !password.isEmpty() )
		{
			//user didn't give empty strings for username and password
			
			User user = userDAO.find(username);
			
			if (user != null)
			{
				//the USER exists 
				//redirect to register page
				returnPage = "/RegisterPage.jsp";
			}
			else 
			{
				if (verifyPassword.equals(password))
				{
					//insert new USER to database
					user = new User();
					user.setUsername(username);
					user.setPassword(password);
					user.setAfm(afm);
					user.setLocation(location);
					user.setAdress(address);
					user.setEmail(email);
					user.setCountry(country);
					user.setPhone(phone_number);
					user.setBidRating(0);
					user.setSellRating(0);
					user.setStatus("Pending");
					
					userDAO.create(user);
					
					//redirect to success message
					returnPage = "/Pending.jsp";
				}
				else
				{
					//user didnt give same password and verify password
					returnPage= "/RegisterPage.jsp";
				}
				
			}
		}
		else
		{
			//user is stupid :P
			returnPage = "/RegisterPage.jsp";
		}
		
		//redirect with returnPage in mind
		RequestDispatcher disp = request.getRequestDispatcher(returnPage);
		disp.forward(request, response);
		
		
	}

}
