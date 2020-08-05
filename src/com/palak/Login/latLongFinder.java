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


@WebServlet("/latLongFinder")
public class latLongFinder extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 Connection con;
	 PreparedStatement stmt;
	 ResultSet rs;  
    
    public latLongFinder() {
        super();
        con=ConnectionManager.makeConnection();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			String city=request.getParameter("city");
			String radius=request.getParameter("radius");
			String placeType=request.getParameter("placeType");
			stmt=con.prepareStatement("select * from statelist where city_name=?");
			stmt.setString(1, city);
			rs=stmt.executeQuery();
			if(rs.next())
			{
				String lat=rs.getString(3);
				String longi=rs.getString(4);
				double dlat=Double.parseDouble(lat);
				double dlongi=Double.parseDouble(longi);
				System.out.println(dlat+" "+dlongi);
				request.setAttribute("lat", dlat);
				request.setAttribute("longi",dlongi);
				request.setAttribute("radius", radius);
				request.setAttribute("placeType", placeType);
				RequestDispatcher rd=request.getRequestDispatcher("findHospitals.jsp");
				rd.forward(request, response);
				
			}
		}catch(Exception e)
		{
			System.out.println(e);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
