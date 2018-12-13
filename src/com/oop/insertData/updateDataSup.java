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
 * Servlet implementation class updateDataSup
 */
@WebServlet("/updateDataSup")
public class updateDataSup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateDataSup() {
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

		connectDb db = new connectDb();
try {	
		String sid=request.getParameter("id");
		String sname=request.getParameter("sname");
		String saddress=request.getParameter("saddress");
		String contact= request.getParameter("scontactno");
		String semail=request.getParameter("semail");
		
		
		if(sid.equals("")||sname.equals("")||saddress.equals("")||contact.equals("")||semail.equals("")) {
			JOptionPane.showMessageDialog(null, "A field is Empty.Please Re-enter");
			response.sendRedirect("updateSupplier.jsp?u="+sid+"");
		}else if(!valPhone(contact)) {
			JOptionPane.showMessageDialog(null, "Contact No Entered Invalid.Please Re-enter");
			response.sendRedirect("updateSupplier.jsp?u="+sid+"");
		}
		else if(valEmail(semail)==false) {
			JOptionPane.showMessageDialog(null, "Email Entered Invalid.Please Re-enter");
			response.sendRedirect("updateSupplier.jsp?u="+sid+"");
		}
		
		else {
			
		
		db.st.executeUpdate("update supplier set SName='"+sname+"',SAddress='"+saddress+"',SContact='"+contact+"',SEmail='"+semail+"' where SupplierID='"+sid+"'");
		JOptionPane.showMessageDialog(null, "Update Successful");
		response.sendRedirect("viewSupList.jsp");
		
		}
		
}catch(Exception e) {
	JOptionPane.showMessageDialog(null,"Error : "+e);
	response.sendRedirect("viewSupList.jsp");
	
}
		
		
		
		
		doGet(request, response);
	}
	
	private boolean valEmail(String s4) {
		
		
		int atpos=s4.indexOf("@");
		int dotpos=s4.indexOf(".");
		
		if(atpos <1 || dotpos + 2 >= s4.length() ||atpos +2 >dotpos){
			return false;
		}
		else
			return true;
		
	}

	private boolean valPhone(String s3) {
		
		return s3.charAt(0)=='0' && s3.length()==10 && s3.matches("[0-9]+");
	}
	
	
	
	
	
	
	
	
	

}
