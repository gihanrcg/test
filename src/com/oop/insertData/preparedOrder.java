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
@WebServlet("/preparedOrder")
public class preparedOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public preparedOrder() {
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
			String preapredEID= request.getParameter("preparedEID");
			String sql = "select * from orders where preapredEID and OrderID";

			db.st.executeUpdate("update orders set preapredEID='"+preapredEID +"' where OrderID='"+OrderID+"'");
			
			JOptionPane.showMessageDialog(null, "Successfully prepared!");
			
			response.sendRedirect("prepareOrder.jsp");
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
