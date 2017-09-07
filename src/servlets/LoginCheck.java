package servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
import model.Bid;
import model.Item;
import model.Message;
import model.User;

/**
 * Servlet implementation class LoginCheck
 */
@WebServlet("/LoginCheck")
public class LoginCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginCheck() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doPost(request,response);
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String returnPage = null;
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		String visitor = request.getParameter("visitor");
		
		UserDAO userDAO = new UserDAOImpl();
		
		if(username == null || password == null)
		{
			//user is stupid
			//redirect user to LoginPage
			returnPage = "/LoginPage.jsp";
			//maybe he wants to enter as a visitor
			if(visitor != null )
			{
				if(visitor.equals("visitor"))
				{
					HttpSession session = request.getSession();
					session.setAttribute("visitor", visitor);
					returnPage="/MainNavigation.jsp";

				}
			}
		}
		else if (username.equals("admin") && password.equals("admin"))
		{
			//user is admin
			returnPage = "AdminCheck";
		}
		else
		{
			//user not stupid
			User user = userDAO.find(username);
			
			if ( user == null )
			{
				//user is not in database
				//redirect to loginPage
				returnPage = "/LoginPage.jsp";
			
			}
			else 
			{
				if (user.getPassword().equals(password))
				{
					//user in database 
					if (user.getStatus().equals("Banned") || user.getStatus().equals("Pending"))
					{
						//user not accepted yet
						returnPage = "/LoginPage.jsp";
					}
					else if (user.getStatus().equals("Accepted"))
					{
						//user accepted
						//redirect to MainNavigationPage
						HttpSession session = request.getSession();
						
						
						int unreadMessageCount = 0;
						for (Message message : user.getMessages1())
						{
							if (message.getStatus() == 0)
							{
								unreadMessageCount++;
							}
						}
						
						if(!user.getBids().isEmpty())
						{
							List<Bid> bidsUser = user.getBids();
							List<Item> items = new ArrayList<Item>();
							
							for (Bid bid : bidsUser)
							{
								if (!items.contains(bid.getItem()))
									items.add(bid.getItem());
							}
							
							for (Item item : items)
							{
								if (!item.CanBeBid())
								{
									
									for(Bid bid : item.getBids())
									{		
										if(bid.getAmount() == item.getCurently() && bid.getUser().getUsername().equals(user.getUsername()))
										{
											MessageDAO messagedao = new MessageDAOImpl();
											//get time of bid
											SimpleDateFormat sdfDate = new SimpleDateFormat("MM/dd HH:mm");//dd/MM
										    Date now = new Date();
										    String time = sdfDate.format(now);
											 
										    //create new message for user to see
											user.setBidRating(user.getBidRating()+15);
											Message messageCongratulations = new Message();
											messageCongratulations.setMessage("Congratulations!!You have won");
											messageCongratulations.setStatus(0);
											messageCongratulations.setSubject(String.valueOf(item.getItem_ID()));
											messageCongratulations.setTime(time);
											messageCongratulations.setUser1(user);
											messageCongratulations.setUser2(item.getUser());
											
											int exists = 0;
											for (Message message : user.getMessages1())
											{
												if (message.getSubject().equals(messageCongratulations.getSubject()) &&
														message.getMessage().equals(messageCongratulations.getMessage()))
												{
													exists = 1;
												}
													
											}
											
											if (exists == 0)
											{
												user.getMessages1().add(messageCongratulations);
												item.getUser().getMessages2().add(messageCongratulations);
										
												messagedao.create(messageCongratulations);
												unreadMessageCount++;
											}
											
											
											
							
											
										}
									}
								}
							}
							
						}
						
						
						
						
						session.setAttribute("unreadMessageCount",unreadMessageCount );
						session.setAttribute("savedUsername", username);
						returnPage = "/MainNavigation.jsp";
					}
					
				}
				else
				{
					returnPage = "/LoginPage.jsp";
				}
			
				
			}
		}
		
		request.getRequestDispatcher(returnPage).forward(request, response);
	}

}
