package com.palak.Login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/YourCart")
public class YourCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con;
	 PreparedStatement stmt;
	 ResultSet rs;     
    
    public YourCart() {
        super();
        con=ConnectionManager.makeConnection();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		Cart1 shoppingCart;
		HttpSession session = request.getSession();
		shoppingCart = (Cart1) session.getAttribute("cart");
		if(shoppingCart == null){
	         shoppingCart = new Cart1();
	         session.setAttribute("cart", shoppingCart);
	       }
		  try{
		  stmt=con.prepareStatement("select * from medicines where sno=?");
		  stmt.setString(1, request.getParameter("sno"));
		  rs=stmt.executeQuery();
		  if(rs.next())
		  {
		shoppingCart.addToCart(rs.getString(2),Float.parseFloat(rs.getString(4)));
		  }
		  }catch(Exception e)
		  {
			  System.out.println(e);
		  }
		session.setAttribute("cart",shoppingCart);
		 /* try (PrintWriter out = response.getWriter()) {
	            /* TODO output your page here. You may use following sample code. 
	            out.println("<!DOCTYPE html>");
	            out.println("<html>");
	            out.println("<head>");
	            out.println("<title>result</title>");            
	            out.println("</head>");
	            out.println("<body>");
	            out.println("<h1>Pizza successfully added to cart </h1>");
	            out.println("<form action='index.html'>Add more pizza item<input type='submit' value='go'></form>");
	            out.println("<hr>");
	            out.println("<h2>Cart</h2>");
	            HashMap<String, Integer> items = shoppingCart.getCartItems();
	            out.println("<table border='1px'>");
	             
	            for(String key: items.keySet()){
	                out.println("<tr><td>"+key+" - </td><td>"+"$"+items.get(key)+"</td></tr>");
	            }
	            out.println("<table>");
	            out.println("</body>");
	            out.println("</html>");
	             
	        }*/
		//request.setAttribute("myCart", shoppingCart.getCartItems());
		response.sendRedirect("ShoppingCart.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
