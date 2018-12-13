package com.oop.insertData;

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
 * Servlet implementation class insertItemCart
 */
@WebServlet("/insertItemCart")
public class insertItemCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertItemCart() {
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
			connectDb db = new connectDb();
			HttpSession session =request.getSession();
			String uname=session.getAttribute("username").toString();
			
			String itemid=request.getParameter("u");
			String qty=request.getParameter("quantity");
		
			/*if(qty.equals("")){

				JOptionPane.showMessageDialog(null, "Please enter a value for quantity");
				response.sendRedirect("Item_popup.jsp");*/
			/*}else {*/
		
			 db.rs=db.st.executeQuery("select * from cart where CustomerName ='"+uname+"'"+" and ItemID='"+itemid+"'" );
			 if(!db.rs.next()) {
				
				db.st.executeUpdate("insert into cart values('"+uname+"','"+itemid+"','"+qty+"')");
				JOptionPane.showMessageDialog(null, "Item Added to Your Cart");
		}else {
			
			int oldqty = Integer.parseInt(db.rs.getString("quantity"));
			int q1 = Integer.parseInt(qty) + oldqty; 
			db.st.executeUpdate("update cart set quantity='"+q1+"'"+"where CustomerName='"+uname+"'"+" and ItemID='"+itemid+"'");
			JOptionPane.showMessageDialog(null, "Item Added to Your Cart");
		}
				response.sendRedirect("Item_popup.jsp?u="+itemid);
			/*	}*/
				
		}catch(Exception e) {
		
			JOptionPane.showMessageDialog(null,"Error : "+e);
			e.printStackTrace();
			response.sendRedirect("Home.jsp");
		}
			
		
		
		
		
	
		
		
		doGet(request, response);
	}

}
