/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package filter;

/**
 *
 * @author iapereira
 */

import javax.servlet.*;
import java.util.*;
 
// Implements Filter class
public class LogFilter implements Filter  {
   @Override
   public void  init(FilterConfig config) 
                         throws ServletException{
      // Get init parameter 
      String testParam = config.getInitParameter("test-param"); 
 
      //Print the init parameter 
      System.out.println("Test Param: " + testParam); 
   }
   @Override
   public void  doFilter(ServletRequest request, 
                 ServletResponse response,
                 FilterChain chain) 
                 throws java.io.IOException, ServletException {
 
      // Get the IP address of client machine.   
      String ipAddress = request.getRemoteAddr();
 
      // Log the IP address and current timestamp.
      System.out.println("IP "+ ipAddress + ", Time "
                                       + new Date().toString());
 
      // Pass request back down the filter chain
      chain.doFilter(request,response);
   }
   @Override
   public void destroy( ){
      /* Called before the Filter instance is removed 
      from service by the web container*/
   }
}