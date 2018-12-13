package com.oop.insertData;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.oop.dbconnect.connectDb;

/**
 * Servlet implementation class updateDiliverDatails
 */
@WebServlet("/updateDiliverDatails")
public class updateDiliverDatails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateDiliverDatails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		//http://localhost:1010/oopProject/updateDiliverDatails?CustomerID=1&orderID=20&name=Gihan&address=Galle&contactNumber=0714914133&paymentType=Visahttp://localhost:1010/oopProject/updateDiliverDatails?CustomerID=1&orderID=20&name=Gihan&address=Galle&contactNumber=0714914133&paymentType=Visa
		PrintWriter out = response.getWriter();
		String CustomerID = request.getParameter("CustomerID");
		out.print(CustomerID);
		String orderID;
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String contactNumber = request.getParameter("contactNumber");
		String paymentType = request.getParameter("paymentType");
		try {
			connectDb db = new connectDb();
			db.rs=db.st.executeQuery("select * from orders where name is null and CustomerID='"+CustomerID+"'");
			while(db.rs.next()) {
			orderID =db.rs.getString("orderID");
			db.st1.executeUpdate("update orders set name='"+name+"',address='"+address+"',contactNo='"+contactNumber+"',paymentType='"+paymentType+"' where orderID='"+orderID+"'");
			
			}
			JOptionPane.showMessageDialog(null, "Purchase Succesfully");
			response.sendRedirect("addToCart.jsp");
		}
		catch(Exception e ) {
			e.printStackTrace();
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
