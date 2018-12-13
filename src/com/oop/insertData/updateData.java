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
 * Servlet implementation class updateData
 */
@WebServlet("/updateData")
@MultipartConfig(fileSizeThreshold=1024*1024*2,maxFileSize=1024*1024*10,maxRequestSize=1024*1024*50)
public class updateData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateData() {
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
		response.setContentType("text/html;charset=UTF-8");
		
		try {
		
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String category=request.getParameter("category");
		String subcategory=request.getParameter("subcategory");
		String details=request.getParameter("details");
		String price=request.getParameter("price");
		//String supid=request.getParameter("supid");
		Part part=request.getPart("image");
		String filename=extractFile(part);
		
		
		
		if(name.equals("")||price.equals("")||category.equals("")||subcategory.equals("")){
			JOptionPane.showMessageDialog(null, "A field is Empty.Please Re-enter");
			response.sendRedirect("updateInvItems.jsp?u="+id+"");
		}else {
		
		
		
		
		String savepath="D:\\eclipseEE\\oopProject\\WebContent\\Resources\\"+filename;
	
		
		part.write(savepath);
		

		db.st.executeUpdate("update inventory set Name='"+name+"',Category='"+category+"',SubCategory='"+subcategory+"',Photo='"+filename+"',Details='"+details+"',UnitPrice='"+price+"' where ItemID='"+id+"'");
		JOptionPane.showMessageDialog(null, "Update Successful");
		response.sendRedirect("viewInvItems.jsp");
		}
		
		}catch(Exception e) {
			JOptionPane.showMessageDialog(null,"Error : "+e);
			response.sendRedirect("viewInvItems.jsp");
			
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
