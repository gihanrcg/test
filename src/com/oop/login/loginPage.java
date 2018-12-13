package com.oop.login;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import com.oop.dbconnect.connectDb;

/**
 * Servlet implementation class loginPage
 */
@WebServlet("/loginPage")
public class loginPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try{	
	connectDb db = new connectDb();
		
String uname=request.getParameter("username");
String password=request.getParameter("password");
String unamedb=null;
String pwddb=null;

 db.rs=db.st.executeQuery("select * from customer_details where UserName ='"+uname+"' and Password='"+password+"'");



		while(db.rs.next()) {

				 unamedb = db.rs.getString("Username");
				 pwddb = db.rs.getString("Password");
				
				 
		}
		
		if(uname.equals("admin") && password.equals(pwddb)){
			HttpSession session = request.getSession();
			session.setAttribute("username", unamedb);
			response.sendRedirect("AdminPanel.jsp");
		}
				else if (uname.equals(unamedb) && password.equals(pwddb)) {
					HttpSession session = request.getSession();
					session.setAttribute("username", unamedb);
					response.sendRedirect("Home.jsp");
					
				}
				
				
				else {
					JOptionPane.showMessageDialog(null, "Username or Password Incorrect\n Please Re-enter");
					response.sendRedirect("Login.jsp");

				}
		
		
			 
	}catch(Exception e) {
		JOptionPane.showMessageDialog(null,"Error" +e);
		response.sendRedirect("Login.jsp");

	}

		
		doGet(request, response);
	}

}
