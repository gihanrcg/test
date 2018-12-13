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
 * Servlet implementation class insertDataStock
 */
@WebServlet("/insertDataStock")
public class insertDataStock extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertDataStock() {
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
		try {

			connectDb db=new connectDb();
		
			String s1=request.getParameter("id");
			String s2= request.getParameter("stockadded");
			String s3= request.getParameter("purchaseprice");
			String s4= request.getParameter("supid");
		    
			
			
			if(s2.equals("")) {
				JOptionPane.showMessageDialog(null, "A field is Empty.Please Re-enter");
				response.sendRedirect("addStock.jsp?u="+s1+"");
			}else {
				
				db.st.executeUpdate("insert into stock(ItemID,StockAdded,PurchasePrice,SupplierID,StartQTY) values('"+s1+"','"+s2+"','"+s3+"','"+s4+"','"+s2+"')");
				JOptionPane.showMessageDialog(null, "Add to Stock Successful");
				response.sendRedirect("stockLevel.jsp");
				
			}
		
		}catch(Exception e) {
			JOptionPane.showMessageDialog(null,"Error"+e);
			response.sendRedirect("stockLevel.jsp");
		}
		
		doGet(request, response);
	}

}
