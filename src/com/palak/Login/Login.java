package com.palak.Login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.PreparedStatement;


@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 Connection con;
	 PreparedStatement stmt;
	 ResultSet rs;
     public Login() {
        super();
        con=ConnectionManager.makeConnection();
       
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
		String uname=request.getParameter("email");
		String pwd=request.getParameter("pwd");
		stmt=con.prepareStatement("select name,email,password from users where email=? and password= ?");
		stmt.setString(1, uname);
		stmt.setString(2, pwd);
		rs=stmt.executeQuery();
		System.out.println("khgkgkjgkjg");
		if(rs.next()){
			String cname= rs.getString(1);
			HttpSession  session=request.getSession(true);
			session.setAttribute("currentSessionUser",cname);
			System.out.println("jgjgmnbmnbjgjh,mbmhfjhgf");
			//response.sendRedirect("index.jsp");
			RequestDispatcher rs = request.getRequestDispatcher("index.jsp");
            rs.forward(request, response);
		}
		else
		{
			response.sendRedirect("InvalidLogin.jsp");		   
		}
		}catch(Exception e)
		{
			System.out.println(e);
		}
		
	}
}