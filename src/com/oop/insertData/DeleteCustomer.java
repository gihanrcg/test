package com.oop.insertData;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.oop.dbconnect.connectDb;


/**
 * Servlet implementation class DeleteCustomer
 */
@WebServlet("/DeleteCustomer")
public class DeleteCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCustomer() {
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
		// TODO Auto-generated method stub
		
		try {
			connectDb db = new connectDb();
			response.setContentType("text/html;charset=UTF-8");
			
			
			String id=request.getParameter("c");
		
			int value=JOptionPane.showConfirmDialog(null, "Delete Customer ?");
			
			if(value==0) {
				db.st.executeUpdate("delete from customer_details where CustomerID='"+id+"'");
				response.sendRedirect("viewCustomerdetails.jsp");
			}
			else {
				response.sendRedirect("viewCustomerdetails.jsp");
			}
			
	}catch(Exception e) {
		JOptionPane.showMessageDialog(null,"Error : "+e);
		response.sendRedirect("viewCustomerDdetails.jsp");
	}
		doGet(request, response);
	}

}
