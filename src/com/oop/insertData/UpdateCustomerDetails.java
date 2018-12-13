package com.oop.insertData;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.swing.JOptionPane;

import com.oop.dbconnect.connectDb;


/**
 * Servlet implementation class UpdateCustomerDetails
 */
@WebServlet("/UpdateCustomerDetails")
@MultipartConfig(fileSizeThreshold=1024*1024*2,maxFileSize=1024*1024*10,maxRequestSize=1024*1024*50)
public class UpdateCustomerDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCustomerDetails() {
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
		connectDb db = new connectDb();
		response.setContentType("text/html;charset=UTF-8");
		try {
			
			String id=request.getParameter("id");
			String name=request.getParameter("name");
			String password=request.getParameter("password");
			String Email=request.getParameter("email");
			String Address=request.getParameter("address");
			String Contactnum=request.getParameter("contactnumber");
			
			Part part=request.getPart("image");
			String filename=extractFile(part);
			
			
			
			if(id.equals("")||name.equals("")||password.equals("")||Email.equals("")){
				JOptionPane.showMessageDialog(null, "A field is Empty.Please Re-enter");
				response.sendRedirect("UpdateCustomer.jsp?c="+id+"");
			}
			
			else if(!valPhone(Contactnum)) {
				JOptionPane.showMessageDialog(null, "Contact No Entered Invalid.Please Re-enter");
				response.sendRedirect("UpdateCustomer.jsp?c="+id+"");
			}
			else if(valEmail(Email)==false) {
				JOptionPane.showMessageDialog(null, "Email Entered Invalid.Please Re-enter");
				response.sendRedirect("UpdateCustomer.jsp?c="+id+"");
			}
			
			else {
			
			
			
			
				String savepath="C:\\Users\\Gihan Saranga\\Desktop\\oopProject\\WebContent\\Resources\\"+filename;
		
			
			part.write(savepath);
			

			db.st.executeUpdate("update customer_details set UserName='"+name+"',Password='"+password+"',Email='"+Email+"',Address='"+Address+"',ContactNum='"+Contactnum+"',Profilepic='"+filename+"' where CustomerID='"+id+"'");
			JOptionPane.showMessageDialog(null, "Update Successful");
			response.sendRedirect("viewCustomerdetails.jsp");
			}
			
			}catch(Exception e) {
				JOptionPane.showMessageDialog(null,"Error : "+e);
				response.sendRedirect("viewCustomerdetails.jsp");
				
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

	
	
	
	
	
	
	
	private String extractFile(Part part) {
		String s=part.getHeader("content-disposition");
		String []items=s.split(";");
			for(String string :items) {
				if(string.trim().startsWith("filename")) {
					return string.substring(string.lastIndexOf("\\")+1,string.length()-1);
					
				}
				
			}
			
			return "";
			
		}

}
