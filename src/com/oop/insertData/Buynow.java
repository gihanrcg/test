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
 * Servlet implementation class Buynow
 */
@WebServlet("/Buynow")
public class Buynow extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Buynow() {
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
		String itemName ="item";
		try {
		connectDb db = new connectDb();
		response.setContentType("text/html;charset=UTF-8");
		
		String uname = request.getParameter("uname");
		String itemID = request.getParameter("itemID");
		int icartqty= Integer.parseInt(request.getParameter("qty"));
		int cartqty = icartqty;
		String unitPrice = request.getParameter("unitPrice");
		itemName = request.getParameter("itemName");
		//delete from stock
		//db.rs=db.st.executeQuery("select * from stock where itemID ='"+itemID+"' order by Date");
		//db.rs.next();
		//JOptionPane.showMessageDialog(null, "Sorry, currently not available in the stock\nplease try again later!");
		
		
		 db.rs=db.st.executeQuery("select CustomerID from customer_details where UserName ='"+uname+"'");
		 db.rs.next();
		 
		 
		 
		 
		 String oderTimeDate;
		 int cqty;
		 int nqty;
		 
		
			
		String CustomerID = db.rs.getString("CustomerID");
		
		
		
		
		db.rs=db.st.executeQuery("select * from stock where itemID ='"+itemID+"' and StockAdded > 0 order by Date");
				db.rs.next();
				String StockID = db.rs.getString("StockID");
				String unitPurchaseprice  = db.rs.getString("PurchasePrice");
				int oldsqty = Integer.parseInt(db.rs.getString("StockAdded"));
				
		if(cartqty<=oldsqty) {
			db.st.executeUpdate("insert into orders(CustomerID,itemID,qty,unitSellPrice,unitPurchaseprice,oderTimeDate) VALUES('"+CustomerID +"','"+itemID+"','"+cartqty+"','"+unitPrice+"','"+unitPurchaseprice+"',CURRENT_TIMESTAMP)");
			cqty = oldsqty - cartqty;
			db.st.executeUpdate("update stock set StockAdded ='"+cqty+"'where StockID='"+StockID+"'");
			db.st.executeUpdate("delete from cart where CustomerName ='"+uname+"' and itemID='"+itemID+"'");
			db.rs=db.st.executeQuery("select orderID from orders where CustomerID ='"+CustomerID+"'"+"group by oderTimeDate desc");
			 db.rs.next();
			 String orderID = db.rs.getString("orderID");
			 
			response.sendRedirect("Buynow.jsp?CustomerID="+CustomerID+"&orderID="+orderID);
		}else{
			String query = "select s.ItemID,s.PurchasePrice,i.Name,sum(s.StockAdded) as 'Count' from stock s,inventory i where i.ItemID='"+itemID+"' and s.ItemID=i.ItemID group by s.ItemID";
			db.rs = db.st.executeQuery(query);
			db.rs.next();
			int sqty = Integer.parseInt(db.rs.getString("Count"));
			System.out.println(sqty);
			if(sqty >= cartqty) {
				db.rs=db.st.executeQuery("select * from stock where itemID ='"+itemID+"' and StockAdded > 0 order by Date");
				//db.rs.next();
				while(cartqty != 0 ) {
					//db.rs=db.st.executeQuery("select * from stock where itemID ='"+itemID+"' order by Date");
					db.rs.next();
					StockID = db.rs.getString("StockID");
					unitPurchaseprice  = db.rs.getString("PurchasePrice");
					oldsqty = Integer.parseInt(db.rs.getString("StockAdded"));
					System.out.println(oldsqty);
					System.out.println(cartqty);
					System.out.println(itemID);
					if(cartqty>=oldsqty) {
						cqty=0;
						cartqty = cartqty -oldsqty ;
					
						db.st1.executeUpdate("update stock set StockAdded ='"+cqty+"' where StockID='"+StockID+"'");
						db.st1.executeUpdate("insert into orders(CustomerID,itemID,qty,unitSellPrice,unitPurchaseprice,oderTimeDate) VALUES('"+CustomerID +"','"+itemID+"','"+oldsqty+"','"+unitPrice+"','"+unitPurchaseprice+"',CURRENT_TIMESTAMP)");
					}else {
						cqty= oldsqty-cartqty;
						
						db.st1.executeUpdate("update stock set StockAdded ='"+cqty+"' where StockID='"+StockID+"'");	
						db.st1.executeUpdate("insert into orders(CustomerID,itemID,qty,unitSellPrice,unitPurchaseprice,oderTimeDate) VALUES('"+CustomerID +"','"+itemID+"','"+cartqty+"','"+unitPrice+"','"+unitPurchaseprice+"',CURRENT_TIMESTAMP)");
						cartqty =0;
					}
					
				}
				//db.st.executeUpdate("insert into orders(CustomerID,itemID,qty,unitSellPrice,unitPurchaseprice,oderTimeDate) VALUES('"+CustomerID +"','"+itemID+"','"+icartqty+"','"+unitPrice+"','"+unitPurchaseprice+"',CURRENT_TIMESTAMP)");
				db.rs1=db.st1.executeQuery("select orderID from orders where CustomerID ='"+CustomerID+"'"+" group by oderTimeDate desc");
				 db.rs1.next();
				 String orderID = db.rs1.getString("orderID");
				 System.out.println(orderID);
				 
				db.st1.executeUpdate("delete from cart where CustomerName ='"+uname+"' and itemID='"+itemID+"'");
				
				 
				
				 
				response.sendRedirect("Buynow.jsp?CustomerID="+CustomerID);
				
				
				
				
			}else {
				
				
				JOptionPane.showMessageDialog(null, "Sorry,"+itemName+" count exeeds the limit of "+ sqty);
				response.sendRedirect("addToCart.jsp");
				
			}
			
			
			
			/*db.rs=db.st.executeQuery("select * from stock where itemID ='"+itemID+"' order by Date");
			db.rs.next();
			StockID = db.rs.getString("StockID");
			unitPurchaseprice  = db.rs.getString("PurchasePrice");
			oldsqty = Integer.parseInt(db.rs.getString("StockAdded"));
			*/
			
		}
				
		
		}catch(Exception e) {
			JOptionPane.showMessageDialog(null, "Sorry,"+itemName+" is currently not available in the stock\nplease try again later!");
			
			
			e.printStackTrace();
			response.sendRedirect("addToCart.jsp");
		}
	}

}
