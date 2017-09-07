package filters;

import java.io.IOException;

import javax.persistence.EntityTransaction;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import jpautils.EntityManagerHelper;

/**
 * Servlet Filter implementation class JPA_Database_filter
 */
@WebFilter("/JPA_db_filter")
public class JPA_db_filter implements Filter {

    /**
     * Default constructor. 
     */
    public JPA_db_filter() {
        
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		try{
			EntityManagerHelper.beginTransaction();
			// pass the request along the filter chain
			chain.doFilter(request, response);
			EntityManagerHelper.commit();
		}
		catch (RuntimeException e) {
			EntityTransaction tx = EntityManagerHelper.getTransaction();
			if (tx != null && tx.isActive()) 
				EntityManagerHelper.rollback();
		    throw e;
		}
		finally {
			EntityManagerHelper.closeEntityManager();
		}
		
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
