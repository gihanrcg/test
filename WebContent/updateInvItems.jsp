<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="com.oop.dbconnect.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Inventory</title>
</head>
<body>
<%

	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	
	if(session.getAttribute("username")==null){
		response.sendRedirect("Login.jsp");
	}


%>

<%@ include file="Header.jsp" %>




<div style="background-color: transparent; color: black; font-family: 'Calibri Light'; padding-left: 30px">


		<table align="center">
			<tr>
				<td style="font-size: larger; color: black"><h3 align="center">Update Item Details</h3></td>
			</tr>
			<tr>
				<td><hr width="700"></td>
			</tr>
			<tr>
			
				<td>
					<form name="updateItems" method="post" action="updateData" enctype="multipart/form-data">
				<%
try{
	connectDb db = new connectDb();
	String u=request.getParameter("u");
	
	
	
	String query="select * from inventory where ItemID='"+u+"'";
	
	db.rs=db.st.executeQuery(query);  
	
	while(db.rs.next()){ 

%>
					
						<table>
						 <tr><td><input type="hidden" name="id" value="<%=Integer.parseInt(db.rs.getString("ItemID"))%>"></td></tr> 
							<tr>
							
								<td style="font-family: Calibri; width: 200px; font-size: large">Title
									/ Product Name</td>
								<td><input type="text" id="name" name="name"  value="<%=db.rs.getString("Name")%>" 
									style="border-radius: 5px; width: 400px; height: 25px; border-style: groove"></td>
							</tr>
							<tr>
								<td><br></td>
							</tr>
							<tr>
								<td style="font-family: Calibri; width: 200px; font-size: large">Category</td>
								<td><select id="category" name="category" style="border-radius: 5px; width: 150px; font-family: Calibri; font-size: medium">
										<option style="color: darkgrey selected"><%=db.rs.getString("Category")%></option>
										<option style="color: darkgrey">--</option>
										<option value="cheese" id="cheese">Cheese</option>
										<option value="yoghurt" id="yoghurt">Yoghurt</option>
										<option value="creams" id="creams">Creams</option>
										<option value="butter" id="butter">Butter</option>
										<option value="milk" id="milk">Milk</option>
										<option value="icecream" id="icecream">Ice Cream</option>
										<option value="frozenvegetables" id="frozenvegetables">Frozen Vegetables</option>
										<option value="frozenfruits" id="frozenfruits">Frozen Fruits</option>
										<option value="leaves" id="leaves">Leaves</option>
										<option value="organicvegetables" id="organicvegetables">Organic Vegetables</option>
										<option value="freshvegetables" id="freshvegetables">Fresh Vegetables</option>
										<option value="chicken" id="chicken">Chicken</option>
										<option value="lamb" id="lamb">Lamb</option>
										<option value="beef" id="beef">Beef</option>
										<option value="pork" id="pork">Pork</option>
										<option value="mutton" id="mutton">Mutton</option>
										<option value="processedmeat" id="processedmeat">Processed Meat</option>
										<option value="tea" id="tea">Tea</option>
										<option value="cordails" id="cordials">Cordials</option>
										<option value="coffee" id="coffee">Coffee</option>
										<option value="sportsandenergy" id="sportsandenergy">Sports and Energy</option>
										<option value="water" id="water">Bottled Water</option>
										<option value="coffee" id="coffee">Coffee</option>
										<option value="juices" id="juices">Juices</option>
										<option value="drinks" id="drinks">Carbonated Drinks</option>
										<option value="herbaldrinks" id="herbaldrinks">Herbal Drinks</option>
										<option value="cakes" id="cakes">Cakes</option>
										<option value="breads" id="breads">Breads</option>
										<option value="savouries" id="savouries">Savouries</option>
										<option value="biscuits" id="biscuits">Biscuits</option>
										<option value="airfreshners" id="airfreshners">Air Freshners</option>
										<option value="washingaids" id="washingaids">Washing aids</option>
										<option value="sanitaryproducts" id="sanitaryproduts">Sanitary Products</option>
										<option value="lighting" id="Lighting">Lighting</option>
										<option value="babycare" id="babycare">BabyCare</option>
										<option value="vehiclecare" id="vehiclecare">Vehicle Care</option>
										<option value="petcare" id="petcare">Pet Care</option>
										<option value="gardenproducts" id="gerdenproducts">Garden Products</option>
										<option value="beautycare" id="beautycare">Beauty Care</option>
										<option value="personalneeds" id="personalneeds">Personal Needs</option>
										<option value="shampooandconditioner" id="shampooandconditioner">Shampoo and Conditioners</option>
										<option value="oralcare" id="oralcare">Oral Care </option>
										<option value="haircare" id="haircare">Hair Care</option>
										<option value="facecare" id="facecare">Face Care</option>
										<option value="toys" id="toys">Toys</option>
										<option value="caraccessories" id="caraccessories">Car Accessories</option>
										<option value="stationary" id="stationary">Stationary</option>
										<option value="hardware" id="hardware">Hardware</option>
										<option value="kitchenware" id="kitchenware">Kitchenware</option>
										<option value="glassware" id="glassware">Glassware</option>
										<option value="decor" id="decor">Decor/Gifts</option>
										<option value="laundry" id="laundry">Laundry</option>
										<option value="livingroom" id="livingroom">Living Room</option>
										<option value="diningroom" id="diningroom">Dining Room</option>
										<option value="office" id="office">Office</option>
										<option value="outdoor" id="outdoor">Outdoor</option>
										<option value="bedroom" id="bedroom">Bedroom</option>
										<option value="kitchen" id="kitchen">Kitchen</option>
										<option value="Other" id="Other">Miscellaneous</option>
										
								</select>
							</tr>


							<tr>
								<td><br></td>
							</tr>

							<tr>
								<td style="font-family: Calibri; width: 200px; font-size: large">Sub-Category</td>
								<td><select id="subcategory" name="subcategory" style="border-radius: 5px; width: 150px; font-family: Calibri; font-size: medium">
										<option style="color: darkgrey"><%=db.rs.getString("SubCategory")%></option>
										<option value="Powerbank" id="powerbank">Power Bank</option>
										<option value="Headphone" id="headphone">Head Phone</option>
										<option value="Earphone" id="earphone">Ear-phone</option>
										<option value="Backcover" id="backcover">Back Cover</option>
										<option value="Mobile" id="mobile">Mobile</option>
										<option value="Tablet" id="tablet">Tablets</option>
										<option value="Battery" id="battery">Battery</option>
										<option value="Data Cable" id="datacable">Data Cables</option>
										<option value="Screen Guard" id="scguard">Screen
											Guard</option>
										<option value="Memory Card" id="memcard">Memory Card</option>
										<option value="Charger" id="charger">Chargers</option>
										<option value="Wireless Charger" id="wlcharger">Wireless
											Charger</option>
										<option value="Other" id="Other">Other</option>
								</select>
							</tr>



							<tr>
								<td><br></td>
							</tr>
							<tr>
								<td></td>
								<td style="color: black">Add your photos(Please Re-select image)</td>
							</tr>
							<tr>
								<td style="font-family: Calibri; width: 200px; font-size: large">Photos</td>
								<td><input type="file" id="image" name="image"  value="<%=db.rs.getString("Photo")%>"></td>
							</tr>

							<tr>
								<td><br></td>
							</tr>


							<tr>
								<td style="font-family: Calibri; width: 200px; font-size: large">Details</td>
								<td><textarea id="details" name="details"
										style="border-radius: 5px; width: 400px; height: 100px; font-style: italic; color: black"><%=db.rs.getString("Details")%></textarea></td>
							</tr>



							<tr>
								<td><br></td>
							</tr>


							<tr>
								<td style="font-family: Calibri; font-size: large">Unit
									Price</td>
								<td><input type="text" id="price" name="price"  value="<%=Integer.parseInt(db.rs.getString("UnitPrice"))%>"
									style="border-radius: 5px; width: 200px; height: 25px; border-style: groove"></td>
							</tr>





							<tr>
								<td><br></td>
							</tr>


							

							<tr>
								<td><br></td>
							</tr>


<%-- 
							<tr>
								<td style="font-family: Calibri; font-size: large">Supplier
									ID</td>
								<td><input type="text" id="supid" name="supid"  value="<%=Integer.parseInt(db.rs.getString("SupID"))%>"
									style="border-radius: 5px; width: 200px; height: 25px; border-style: groove"></td>
							</tr>


							<tr>
								<td><br></td>
							</tr> --%>




							<tr>
								
									<td><a href="viewInvItems.jsp"><input name="back" style="color: white; background-color: blue; border: 2px solid blue; border-radius: 5px;"type="button" value="<- Back"></a></td>
							       <td><input name="update"style="color: white; background-color: blue; border: 2px solid blue; border-radius: 5px;"type="submit" value="Update"></td>
										
							</tr>
							<tr>
								
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	
	</div>






<%

 	} 
}catch(Exception e){
	e.printStackTrace();
}
	 %>



</body>
</html>
 

