package com.palak.Login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Signup
 */
@WebServlet("/Signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 Connection con;
	 PreparedStatement stmt;
	 ResultSet rs;   
    
    public Signup() {
        super();
        con=ConnectionManager.makeConnection();  
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			String name=request.getParameter("name");
			String uname=request.getParameter("email");
			String pwd=request.getParameter("pwd");
			stmt=con.prepareStatement("select * from users where email=?");
			stmt.setString(1, uname);
			rs=stmt.executeQuery();
			if(rs.next()){
				response.sendRedirect("InvalidSignup.jsp");
			}
			else
			{
				stmt=con.prepareStatement("insert into users values(?,?,?)");
				stmt.setString(1,name );
				stmt.setString(2, uname);
				stmt.setString(3, pwd);
				stmt.executeUpdate();
				HttpSession session=request.getSession(true);
				session.setAttribute("currentSessionUser", name);
				RequestDispatcher rs=request.getRequestDispatcher("Home.jsp");
				rs.forward(request,response);		   
			}
			}catch(Exception e)
			{
				System.out.println(e);
			}
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
