<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add to Inventory</title>
</head>
<body>
<%

	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	
	if(session.getAttribute("username")==null){
		response.sendRedirect("Login.jsp");
	}


%>

<%@ include file="Header.jsp" %>

	<div
		style="background-color: transparent; color: black; font-family: 'Calibri Light'; padding-left: 30px">


		<table align="center">
			<tr>
				<td style="font-size: larger; color: black"><h3 align="center">Add to inventory</h3></td>
			</tr>
			<tr>
				<td><hr width="700"></td>
			</tr>
			<tr>
			
				<td>
					<form name="addItems" method="post" action="insertData" enctype="multipart/form-data">
						<table>
							<tr>
								
								<td style="font-family: Calibri; width: 200px; font-size: large">Title
									/ Product Name</td>
								<td><input type="text" id="name" name="name"
									style="border-radius: 5px; width: 400px; height: 25px; border-style: groove"></td>
							</tr>
							<tr>
								<td><br></td>
							</tr>
							<tr>
								<td style="font-family: Calibri; width: 200px; font-size: large">Category</td>
								<td><select id="category" name="category"
									style="border-radius: 5px; width: 150px; font-family: Calibri; font-size: medium">
									
										<option value="grocery" id="grocery">Grocery</option>
										<option value="dairy" id="dairy">Dairy</option>
										<option value="frozen" id="frozen">Frozen</option>
										<option value="vegetable" id="vegetable">Vegetable</option>
										<option value="fruit" id="fruit">Fruit</option>
										<option value="meat" id="maet">Meat</option>
										<option value="drink" id="drink">Drink</option>
										<option value="bakery" id="bakery">Bakery</option>
										<option value="household" id="household">House Hold</option>
										<option value="personalcare" id="personalcare">Personal Care</option>
										<option value="homeware" id="homeware">Home ware</option>
										<option value="electronic" id="electronic">Electronic</option>
										<option value="furniture" id="furniture">Furniture</option>
								</select>
							</tr>


							<tr>
								<td><br></td>
							</tr>

							<tr>
								<td style="font-family: Calibri; width: 200px; font-size: large">Sub-Category</td>
								<td><select id="subcategory" name="subcategory"
									style="border-radius: 5px; width: 150px; font-family: Calibri; font-size: medium">
										<option style="color: darkgrey" value="--">--</option>
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
								<td></td>
								<td style="color: black">Add your photos</td>
							</tr>
							<tr>
								<td style="font-family: Calibri; width: 200px; font-size: large">Photos</td>
								<td><input type="file" id="image" name="image"></td>
							</tr>

							<tr>
								<td><br></td>
							</tr>


							<tr>
								<td style="font-family: Calibri; width: 200px; font-size: large">Details</td>
								<td><textarea id="details" name="details"
										style="border-radius: 5px; width: 400px; height: 100px; font-style: italic; color: black"
										placeholder="Enter details here"></textarea></td>
							</tr>



							<tr>
								<td><br></td>
							</tr>


							<tr>
								<td style="font-family: Calibri; font-size: large">Unit
									Price</td>
								<td><input type="text" id="price" name="price"
									style="border-radius: 5px; width: 200px; height: 25px; border-style: groove"></td>
							</tr>





							<tr>
								<td><br></td>
							</tr>


							<!--<tr>
								<td style="font-family: Calibri; font-size: large">Stock
									Added</td>
								<td><input type="text" id="stock" name="stock"
									style="border-radius: 5px; width: 200px; height: 25px; border-style: groove"></td>
							</tr>

							<tr>
								<td><br></td>
							</tr>



							 <tr>
								<td style="font-family: Calibri; font-size: large">Supplier
									ID</td>
								<td><input type="text" id="supid" name="supid"
									style="border-radius: 5px; width: 200px; height: 25px; border-style: groove"></td>
							</tr>


							<tr>
								<td><br></td>
							</tr> -->




							<tr>
									<td><a href="viewInvItems.jsp"><input name="back" style="color: white; background-color: blue; border: 2px solid blue; border-radius: 5px;"type="button" value="<- Back"></a></td>
							       <td><input name="addItem"style="color: white; background-color: blue; border: 2px solid blue; border-radius: 5px;"type="submit" value="Add Item"></td>
										
							</tr>
							<tr>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	
	</div>



</body>
</html>