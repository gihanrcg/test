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
 * Servlet implementation class makePurchaseOrder
 */
@WebServlet("/makePurchaseOrder")
public class makePurchaseOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public makePurchaseOrder() {
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
		
		
		String s1= request.getParameter("id");
		String s2= request.getParameter("orderitem");
		String s3= request.getParameter("orderqty");
		String s4=request.getParameter("details");
		
		if(s1.equals("")||s2.equals("")||s3.equals("")||s4.equals("")) {
			JOptionPane.showMessageDialog(null, "A field is Empty.Please Re-enter");
			response.sendRedirect("makePO.jsp?u="+s1+"");
		}else {
			
		
		
		
		
		db.st.executeUpdate("insert into purchaseorder(SupplierID,ItemOrdered,StockOrdered,Details) values('"+s1+"','"+s2+"','"+s3+"','"+s4+"')");
		JOptionPane.showMessageDialog(null, "Purchase Order Successful");
		
		response.sendRedirect("viewSupList.jsp");
		}
		
		}catch(Exception e) {
			JOptionPane.showMessageDialog(null,"Error : "+e);
			response.sendRedirect("viewSupList.jsp");
			
		}
			
		
		doGet(request, response);
	}

}
