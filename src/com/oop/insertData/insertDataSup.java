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
 * Servlet implementation class insertDataSup
 */
@WebServlet("/insertDataSup")
public class insertDataSup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertDataSup() {
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
		
		
		String s1= request.getParameter("sname");
		String s2= request.getParameter("saddress");
		String s3= request.getParameter("scontactno");
		String s4=request.getParameter("semail");
		
		if(s1.equals("")||s2.equals("")||s3.equals("")||s4.equals("")) {
			JOptionPane.showMessageDialog(null, "A field is Empty.Please Re-enter");
			response.sendRedirect("addSup.jsp");
		}else if(!valPhone(s3)) {
			JOptionPane.showMessageDialog(null, "Contact No Entered Invalid.Please Re-enter");
			response.sendRedirect("addSup.jsp");
		}
		else if(valEmail(s4)==false) {
			JOptionPane.showMessageDialog(null, "Email Entered Invalid.Please Re-enter");
			response.sendRedirect("addSup.jsp");
		}
		else {
		
		db.st.executeUpdate("insert into supplier(SName,SAddress,SContact,SEmail) values('"+s1+"','"+s2+"','"+s3+"','"+s4+"')");
		JOptionPane.showMessageDialog(null, "Added to Database Successfully");
		
		response.sendRedirect("viewSupList.jsp");
		}
		
	}catch(Exception e) {
		JOptionPane.showMessageDialog(null,"Error : "+e);
		response.sendRedirect("addSup.jsp");
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
