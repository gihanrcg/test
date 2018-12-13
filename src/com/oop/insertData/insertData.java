package com.oop.insertData;


import java.io.File;
import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.swing.JOptionPane;

import com.oop.dbconnect.connectDb;

/**
 * Servlet implementation class insertData
 */
@WebServlet("/insertData")
@MultipartConfig(fileSizeThreshold=1024*1024*2,maxFileSize=1024*1024*10,maxRequestSize=1024*1024*50)


public class insertData extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertData() {
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
			response.setContentType("text/html;charset=UTF-8");
			
		
			String s1= request.getParameter("name");
			String s2= request.getParameter("category");
			String s3= request.getParameter("subcategory");
			String s4=request.getParameter("price");
			String s6= request.getParameter("details");
			//String s8=request.getParameter("supid");
			Part part=request.getPart("image");
			String filename=extractFile(part);
		
		
				
			if(s1.equals("")||s2.equals("")||s3.equals("")||s4.equals("")){
				JOptionPane.showMessageDialog(null, "A field is Empty.Please Re-enter");
				response.sendRedirect("inventoryItems.jsp");
			}else {
				
			
			
		
			

			String savepath="D:\\eclipseEE\\oopProject\\WebContent\\Resources\\"+filename;
			
			
			
			part.write(savepath);
			
	
			
			db.st.executeUpdate("insert into inventory(Name,Category,SubCategory,UnitPrice,Photo,Details) values('"+s1+"','"+s2+"','"+s3+"','"+s4+"','"+filename+"','"+s6+"')");
			JOptionPane.showMessageDialog(null, "Added to Database Successfully");
			
			response.sendRedirect("viewInvItems.jsp");
			}
			
	}catch(Exception e) {
	
		JOptionPane.showMessageDialog(null,"Error : "+e);
		response.sendRedirect("inventoryItems.jsp");
	}
		
		

		doGet(request, response);
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