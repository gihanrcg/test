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
<%

	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	
	if((session.getAttribute("username")==null) ||(!session.getAttribute("username").equals("admin") )){
		response.sendRedirect("Login.jsp");
	}
	



%>

	<%@include file="Header.jsp"%>
	<script type="text/javascript" src="jquery-2.1.3.js"></script>
<script type="text/javascript" src="jspdf (2).js"></script>
<script type="text/javascript" src="pdfFromHTML.js"></script>

<input type="button" onclick="HTMLtoPDF()" value="Download">


<div style="z-index: -1" id = "HTMLtoPDF">

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
			Calendar now = Calendar.getInstance();

			int year = now.get(Calendar.YEAR);
			int month = now.get(Calendar.MONTH) + 1;//returns value 0 to 11
			int date = now.get(Calendar.DATE);
			int oYear;
			int oMonth;
			int oDate = date;
			double totalSales, totalProfit, totalPurchasePrice;
			totalSales = 0;
			totalProfit = 0;
			totalPurchasePrice = 0;
			if (month == 1) {
				oYear = year - 1;
				oMonth = 12;

			} else {
				oYear = year;
				oMonth = month - 1;
			}

			if (oMonth == 2) {
				if (year % 4 == 0 && date > 29) {
					oDate = 29;

				} else if (date > 28) {
					oDate = 28;
				}

			}

			if ((oMonth == 4 || oMonth == 6 || oMonth == 9 || oMonth == 11) && date == 31) {
				oDate = 30;

			}

			String today = year + "/" + month + "/" + date;
			String lMonthDay = oYear + "/" + oMonth + "/" + date;

			System.out.println(today);
			System.out.println(lMonthDay);
			//db.rs = db.st.executeQuery("select CURRENT_DATE");
			//db.rs.next();

			db.rs = db.st.executeQuery(
					"select o.itemID as itemID,i.Name as ItemName,sum(o.qty) as qty ,sum(o.qty*o.unitSellPrice) as itemSalesPrice,sum(o.qty*o.unitPurchaseprice) as ItemUnitPurchaseprice from orders o,inventory i where cast(o.oderTimeDate as date) <='"
							+ today + "' and cast(o.oderTimeDate as date) >= '" + lMonthDay
							+ "' and o.itemID = i.itemID group by o.itemID,i.Name order by itemSalesPrice");
	%>
	
	<h3 align="left" style="padding-left: 180px">Sale Details Of Last 30 days</h3>
	
	
	<table border="1"  cellpadding="20px"
		style="border-collapse: collapse;margin-left: 40px">
		<tr style="color: white; background-color: black">
			<th>Item ID</th>
			<th>Item Name</th>
			<th>Sales Quantitiy</th>
			<th>Total Sales</th>
			<th>Sales Profit</th>
		</tr>

		<%
			while (db.rs.next()) {
					double salesProfit = Double.parseDouble(db.rs.getString("itemSalesPrice"))
							- Double.parseDouble(db.rs.getString("ItemUnitPurchaseprice"));
					totalSales += Double.parseDouble(db.rs.getString("itemSalesPrice"));
					totalProfit += salesProfit;
		%>

		<tr>
			<td><%=db.rs.getString("itemID")%></td>
			<td><%=db.rs.getString("ItemName")%></td>
			<td align="center"><%=db.rs.getString("qty")%></td>
			<td>Rs. <%=db.rs.getString("itemSalesPrice")%>.00</td>
			<td>Rs. <%=salesProfit%>0</td>
		</tr>
		<%
			}
		%>
	</table>
	<br>
	<br>

	<table border="1" cellpadding="20px" style="z-index:-1;margin-left: 750px;border-collapse: collapse;position: absolute;top:373px;right:20;">

		<tr style="background-color: #008CBA; color: white">
			<td>Total sales</td>
			<td>Total Profit</td>
		</tr>

		<tr>
			<td>Rs.&nbsp;<%=totalSales%>0
			</td>
			<td><%=totalProfit%></td>
		</tr>
	</table>
	<%
		db.rs = db.st.executeQuery(
					"select i.Name as Name,sum(StartQTY) as stock,sum(PurchasePrice*StartQTY) as totalpurchasePrice from inventory i,stock s WHERE i.ItemId=s.ItemID and cast(s.Date as date) <='"
							+ today + "' and cast(s.Date as date) >= '" + lMonthDay + "' GROUP by i.Name");
	%>


<br><br><h3 align="left" style="padding-left: 180px"> Stock Purchased Price </h3><br><br>	
	<table border="1"  cellpadding="20px" style="border-collapse: collapse;margin-left: 40px">
		
		<tr style="color: white;background-color: black">
			<th>Item Name</th>
			<th>Stock</th>
			<th>Purchase Price</th>
		</tr>
		<%
			while (db.rs.next()) {
		%>
		<tr>
			<td><%=db.rs.getString("Name")%></td>
			<td><%=db.rs.getString("stock")%></td>
			<td><%=db.rs.getString("totalpurchasePrice")%></td>
		</tr>


		<%
			totalPurchasePrice += Double.parseDouble(db.rs.getString("totalpurchasePrice"));
				}
		%>
		</table> 
	
		<table border="1" cellpadding="20px" style="z-index:-1;margin-left: 750px;border-collapse: collapse;width:240px;position: absolute ;top:500px;right:20px">

		<tr style="background-color: #008cba;color:white">
			
			<th>Total Purchase Price</th>
		</tr>
		<tr>
			
			<td><%=totalPurchasePrice%></td>
		</tr>
	</table>
	
	
	<%
		db.rs = db.st.executeQuery(
					"select i.Name as Name,sum(StockAdded) as stock,sum(PurchasePrice*StockAdded) as totalpurchasePrice from inventory i,stock s WHERE i.ItemId=s.ItemID  GROUP by i.Name");
	%>

<br><br><h3 align="left" style="padding-left: 180px"> Remaining Stock </h3><br><br>

	<table border="1"  cellpadding="20px" style="border-collapse: collapse;margin-left: 40px">
		
		<tr style="color: white;background-color: black">
			<th>Item Name</th>
			<th>Stock</th>
			<th>Purchase Price</th>
		</tr>
		<%
			while (db.rs.next()) {
		%>
		<tr>
			<td><%=db.rs.getString("Name")%></td>
			<td><%=db.rs.getString("stock")%></td>
			<td><%=db.rs.getString("totalpurchasePrice")%></td>
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