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
 * Servlet implementation class customerRegistration
 */
@WebServlet("/customerRegistration")
@MultipartConfig(fileSizeThreshold=1024*1024*2,maxFileSize=1024*1024*10,maxRequestSize=1024*1024*50)
public class customerRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public customerRegistration() {
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
				try {

					connectDb db=new connectDb();
					response.setContentType("text/html;charset=UTF-8");
				
				
					String s1= request.getParameter("name");
					String s2= request.getParameter("password");
					
					String s3= request.getParameter("email");
					String s4=request.getParameter("address");
					String s5= request.getParameter("contactnumber");
					String s6= request.getParameter("password1");
					
					Part part=request.getPart("image");
					String filename=extractFile(part);
				
				
						
					if(s1.equals("")||s2.equals("")||s3.equals("")||s4.equals("")||s6.equals("")){
						JOptionPane.showMessageDialog(null, "A field is Empty.Please Re-enter");
						response.sendRedirect("Register.jsp");
					}
					else if(!s2.equals(s6)) {
						JOptionPane.showMessageDialog(null, "Passwords Do Not Match ! \n Please Re-enter");
						response.sendRedirect("Register.jsp");
					}
				
					else if(!valPhone(s5)) {
					JOptionPane.showMessageDialog(null, "Contact No Entered Invalid.Please Re-enter");
					response.sendRedirect("Register.jsp");
				}
				
					else if(valEmail(s3)==false) {
					JOptionPane.showMessageDialog(null, "Email Entered Invalid.Please Re-enter");
					response.sendRedirect("Register.jsp");
				}
					
				else {
						
						//String savepath="D:\\eclipseEE\\oopProject\\WebContent\\Resources\\"+filename;
						String savepath="C:\\Users\\Gihan Saranga\\Desktop\\oopProject\\WebContent\\Resources"+filename;
					
					part.write(savepath);
					
			
					
					db.st.executeUpdate("insert into customer_details(UserName,Password,Email,Address,ContactNum,Profilepic) values('"+s1+"','"+s2+"','"+s3+"','"+s4+"','"+s5+"','"+filename+"')");
					JOptionPane.showMessageDialog(null, "You Have Successfully Created An Account!\n Please Login Again");
					
					response.sendRedirect("Login.jsp");
					}
					
			}catch(Exception e) {
			
				e.printStackTrace();
				response.sendRedirect("Register.jsp");
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

