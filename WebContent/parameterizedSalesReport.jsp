<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="com.oop.dbconnect.connectDb"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*"%>

<html>
<head>

</head>

<body style="color: black">

	<%@include file="Header.jsp"%>
	
	<%

	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	
	if((session.getAttribute("username")==null) ||(!session.getAttribute("username").equals("admin") )){
		response.sendRedirect("Login.jsp");
	}
	



%>
	
	<script type="text/javascript" src="jquery-2.1.3.js"></script>
<script type="text/javascript" src="jspdf (2).js"></script>
<script type="text/javascript" src="pdfFromHTML.js"></script>




	<form action="parameterizedSalesReport.jsp" metod="get">
		<!--  
 <label>Start Date:</label><input  type="date"  name="sDate" id="sDate" placeholder="yyyy/mm/d" min="2000-01-02" required pattern="[0-9]{4}/[0-9]{2}/[0-9]{2}">
 <label>End Date:</label><input type="text" name ="eDate" id="eDate" placeholder="yyyy/mm/d" min="2000-01-02" required pattern="[0-9]{4}/[0-9]{2}/[0-9]{2}">
 -->
		<br>
		<label>Start Date:</label><input type="date" name="sDate" data-date=""
			data-date-format="YYYY/MM/DD" style="height: 30px;color: #008CBA" placeholder="Select Date" required="required"> 
			<label>End Date:</label><input
			type="date" name="eDate" data-date="" data-date-format="YYYY/MM/DD" required="required">
		<select name="groupBy">
			<option value="Name">Item</option>
			<option value="Category">Category</option>
			<option value="SubCategory">Sub Category</option>

		</select> <input type="submit" value="submit">
	</form>
	
	<input type="button" onclick="HTMLtoPDF()" value="Download">



	
	<%
		connectDb db = new connectDb();
		try {

			//HH:mm:ss

			/* 
			
			   Date curDate = new Date();
			   SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
			   
			   String today = format.format(curDate);
			   
			  
			   Calendar myCal = Calendar.getInstance();
			       myCal.setTime(now);    
			   myCal.add(Calendar.MONTH, +1);    
			   now = myCal.getTime();
			   String nextmonth = format.format(now);
			   */

			double totalSales, totalProfit, totalPurchasePrice;
			totalSales = 0;
			totalProfit = 0;
			totalPurchasePrice = 0;

			String eDate = request.getParameter("eDate");
			String sDate = request.getParameter("sDate");
			String groupBy = request.getParameter("groupBy");

			System.out.println(sDate);
			System.out.println(eDate);
			//db.rs = db.st.executeQuery("select CURRENT_DATE");
			//db.rs.next();

			//db.rs = db.st.executeQuery("select o.itemID as itemID,i.Name as ItemName,sum(o.qty) as qty ,sum(o.qty*o.unitSellPrice) as itemSalesPrice,sum(o.qty*o.unitPurchaseprice) as ItemUnitPurchaseprice from orders o,inventory i where cast(o.oderTimeDate as date) <'"+eDate+"' and cast(o.oderTimeDate as date) > '"+sDate+ "' and o.itemID = i.itemID group by o.itemID,i.Name order by itemSalesPrice");
			db.rs = db.st.executeQuery("select i." + groupBy
					+ ",sum(o.qty) as qty ,sum(o.qty*o.unitSellPrice) as itemSalesPrice,sum(o.qty*o.unitPurchaseprice) as ItemUnitPurchaseprice from orders o,inventory i where cast(o.oderTimeDate as date) <='"
					+ eDate + "' and cast(o.oderTimeDate as date) >= '" + sDate
					+ "' and o.itemID = i.itemID group by i." + groupBy + " order by itemSalesPrice");
			
			
			
	%>
	<div style="z-index: -1" id = "HTMLtoPDF">
	
	<h3 align="left" style="padding-left: 180px">Sale Details Of From <%out.print(sDate); %> To <%out.print(eDate); %></h3>
	<table border="1"  cellpadding="20px"
		style="border-collapse: collapse;margin-left: 40px">
		<tr style="color: white; background-color: black">
			<th><%=groupBy%></th>
			<th>Sales Quantity</th>
			<th>Total Sales</th>
			<th>Sales Profit</th>
		</tr>

		<%
			while (db.rs.next()) {
					double salesProfit = Double.parseDouble(db.rs.getString("itemSalesPrice"))
							- Double.parseDouble(db.rs.getString("ItemUnitPurchaseprice"));
					totalSales += Integer.parseInt(db.rs.getString("itemSalesPrice"));
					totalProfit += salesProfit;
		%>

		<tr>
			<td><%=db.rs.getString(groupBy)%></td>
			<td><%=db.rs.getString("qty")%></td>
			<td>Rs. <%=db.rs.getString("itemSalesPrice")%>0</td>
			<td>Rs. <%=salesProfit%>0</td>
		</tr>
		<%
			}
		%>
		</table>
		
		<table border="1" cellpadding="20px" style="z-index:-1; margin-left: 750px;border-collapse: collapse;position: absolute;top:430px;right:20;">

		<tr style="background-color: #008CBA; color: white">
			<td>Total sales</td>
			<td>Total Profit</td>
		</tr>

		<tr>
		
			<td>Rs. <%=totalSales%>0</td>
			<td>Rs. <%=totalProfit%>0</td>
		</tr>
	</table>
	<%
		//db.rs = db.st.executeQuery("select i.Name as Name,sum(StockAdded) as stock,sum(PurchasePrice*StockAdded) as totalpurchasePrice from inventory i,stock s WHERE i.ItemId=s.ItemID and cast(s.Date as date) <='"+eDate+"' and cast(s.Date as date) >= '"+sDate +"' GROUP by i.Name");
			db.rs = db.st.executeQuery("select i." + groupBy
					+ " as name,sum(StartQTY) as stock,sum(PurchasePrice*StartQTY) as totalpurchasePrice from inventory i,stock s WHERE i.ItemId=s.ItemID and cast(s.Date as date) <='"
					+ eDate + "' and cast(s.Date as date) >= '" + sDate + "' GROUP by i." + groupBy);
	%>
<br><br><h3 align="left" style="padding-left: 180px"> Stock Purchased Price </h3><br><br>	 
		<table border="1"  cellpadding="20px" style="border-collapse: collapse;margin-left: 40px">
		
		<tr style="color: white;background-color: black">
			<th><%=groupBy%></th>
			<th>Stock Purchased</th>
			<th>Value of Stock Purchased</th>
		</tr>
		<%
			while (db.rs.next()) {
		%>
		<tr>
			<td><%=db.rs.getString("name")%></td>
			<td><%=db.rs.getString("stock")%></td>
			<td>Rs. <%=db.rs.getString("totalpurchasePrice")%>0</td>
		</tr>


		<%
			totalPurchasePrice += Double.parseDouble(db.rs.getString("totalpurchasePrice"));
				}
		%>
		</table>
		
		

		
		
		<table border="1" cellpadding="20px" style="z-index:-1;margin-left: 750px;border-collapse: collapse;width:240px;position: absolute ;top:600px;right:20px">

		<tr style="background-color: #008cba;color:white">

			<td>Total Stock Value</td>
		</tr>
		<tr>

			<td>Rs. <%=totalPurchasePrice%>0</td>
		</tr>
	</table>
	
	<%
		//db.rs = db.st.executeQuery("select i.Name as Name,sum(StockAdded) as stock,sum(PurchasePrice*StockAdded) as totalpurchasePrice from inventory i,stock s WHERE i.ItemId=s.ItemID and cast(s.Date as date) <='"+eDate+"' and cast(s.Date as date) >= '"+sDate +"' GROUP by i.Name");
			db.rs = db.st.executeQuery("select i." + groupBy
					+ " as name,sum(StockAdded) as stock,sum(PurchasePrice*StockAdded) as totalpurchasePrice from inventory i,stock s WHERE i.ItemId=s.ItemID  GROUP by i." + groupBy);
	%>

<br><br><h3 align="left" style="padding-left: 180px"> Remaining Stock </h3><br><br>
		<table border="1"  cellpadding="20px" style="border-collapse: collapse;margin-left: 40px">
		
		<tr style="color: white;background-color: black">
			<th><%=groupBy%></th>
			<th>Stock Available</th>
			<th>Value of Stock Available</th>
		</tr>
		<%
			while (db.rs.next()) {
		%>
		<tr>
			<td><%=db.rs.getString("name")%></td>
			<td><%=db.rs.getString("stock")%></td>
			<td>Rs. <%=db.rs.getString("totalpurchasePrice")%>.00</td>
		</tr>


		<%
			totalPurchasePrice += Double.parseDouble(db.rs.getString("totalpurchasePrice"));
				}
		%>
		</table>
	
	<% 	
	
	
}catch(Exception ex){
	ex.printStackTrace();
	
}
	
		


%>

</div>
</body>
</html>