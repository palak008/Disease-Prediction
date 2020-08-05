package com.palak.Login;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Search")
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;
       Connection con;
       PreparedStatement stmt;
       ResultSet rs;
       
       public Search() {
        super();
        con=ConnectionManager.makeConnection();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int total;
		int i;
		try{
		String symp=request.getParameter("search_query");
		String newSymp=symp.substring(0,symp.length()-1);
		String[] symps=newSymp.split(",");
		String s1="";
		String s2="";
		String s3="";
		String s4="";
		String s5="";
		System.out.println(symps.length);
		if(symps.length==1)
		{
		s1="%"+symps[0]+"%";
		stmt=con.prepareStatement("Select * from data where symptoms like ?");
		stmt.setString(1, s1);
		}
		if(symps.length==2)
		{
		s1="%"+symps[0]+"%";
		s2="%"+symps[1]+"%";
		stmt=con.prepareStatement("Select * from data where symptoms like ? or symptoms like ?");
		stmt.setString(1, s1);
		stmt.setString(2, s2);
		}
		if(symps.length==3)
		{
		s1="%"+symps[0]+"%";
		s2="%"+symps[1]+"%";
		s3="%"+symps[2]+"%";
		stmt=con.prepareStatement("Select * from data where symptoms like ? or symptoms like ? or symptoms like ?");
		stmt.setString(1, s1);
		stmt.setString(2, s2);
		stmt.setString(3, s3);
		}
		if(symps.length==4)
		{
		s1="%"+symps[0]+"%";
		s2="%"+symps[1]+"%";
		s3="%"+symps[2]+"%";
		s4="%"+symps[3]+"%";
		stmt=con.prepareStatement("Select * from data where symptoms like ? or symptoms like ? or symptoms like ? or symptoms like ?");
		stmt.setString(1, s1);
		stmt.setString(2, s2);
		stmt.setString(3, s3);
		stmt.setString(4, s4);
		}
		if(symps.length==5)
		{
		s1="%"+symps[0]+"%";
		s2="%"+symps[1]+"%";
		s3="%"+symps[2]+"%";
		s4="%"+symps[3]+"%";
		s5="%"+symps[4]+"%";
		stmt=con.prepareStatement("Select * from data where symptoms like ? or symptoms like ? or symptoms like ? or symptoms like ? or symptoms like ?");
		stmt.setString(1, s1);
		stmt.setString(2, s2);
		stmt.setString(3, s3);
		stmt.setString(4, s4);
		stmt.setString(5, s5);
		}
		rs=stmt.executeQuery();
		List<Disease> disease = new ArrayList<Disease>();
		List<String> prob_diseases= new ArrayList<String>();
		i=0;
		while(rs.next())
		{
			prob_diseases.add(rs.getString(1));
			i++;
			disease.add(new Disease(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5)));
			//System.out.println(rs.getString(1)+" "+rs.getString(2)+" "+rs.getString(3)+" "+rs.getString(4)+" "+rs.getString(5));
		}
		request.setAttribute("prob_diseases", prob_diseases);
		request.setAttribute("results", disease);
		//}
        RequestDispatcher rd=request.getRequestDispatcher("Home1.jsp");
		rd.forward(request, response);
		}catch(Exception ee)
		{
			System.out.println(ee);
		}
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
