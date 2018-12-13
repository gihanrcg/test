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
 * Servlet implementation class preparedOrder
 */
@WebServlet("/deliverOrder")
public class deliverOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deliverOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {

			connectDb db = new connectDb();
			String OrderID = request.getParameter("OrderID");
			String diliverEID= request.getParameter("diliverEID");
			

			db.st.executeUpdate("update orders set diliver =CURRENT_TIMESTAMP , diliverEID='"+diliverEID +"' where OrderID='"+OrderID+"'");
			
			JOptionPane.showMessageDialog(null, "Successfully Delivered!");
			
			response.sendRedirect("deliverOrder.jsp");
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

}
