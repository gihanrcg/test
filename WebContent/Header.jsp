

<style>
#mySidenav a {
	position: fixed; /* Position them relative to the browser window */
	left: -80px; /* Position them outside of the screen */ transition :
	0.3s; /* Add transition on hover */
	padding: 8px; /* 15px padding */
	width: 100px; /* Set a specific width */
	text-decoration: none; /* Remove underline */
	font-size: 15px; /* Increase font size */
	color: white; /* White text color */
	border-radius: 0 5px 5px 0;
	transition: 0.3s;
	/* Rounded corners on the top right and bottom right side */
}

#mySidenav a:hover {
	left: 0; /* On mouse-over, make the elements appear as they should */
}

/* The about link: 20px from the top with a green background */
#about {
	top: 380px;
	background-color: #4CAF50;
}

#blog {
	top: 415px;
	background-color: #2196F3; /* Blue */
}

#projects {
	top: 450px;
	background-color: #f44336; /* Red */
}

#contact {
	top: 485px;
	background-color: #555 /* Light Black */
}

a {
	text-decoration: none;
	color: #008CBA;
}

.topnav {
	background-color: #008CBA;
	overflow: visible;
}

.topnav a {
	float: left;
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 17px;
}

.active {
	background-color: navy;
	color: white;
}

.dropdown {
	float: left;
	overflow: visible;
}

/* Style the dropdown button to fit inside the topnav */
.dropdown .dropbtn {
	font-size: 17px;
	border: none;
	outline: none;
	color: white;
	padding-left:1px;
	padding-right:1px;
	background-color: inherit;
	font-family: inherit;
	margin: 0;
}

/* Style the dropdown content (hidden by default) */
.dropdown-content {
	display: none;
	position: absolute;
	background-color: #008CBA;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 10;
}

/* Style the links inside the dropdown */
.dropdown-content a {
	float: none;
	color: white;
	
	text-decoration: none;
	display: block;
	text-align: left;
}

.dropdown-content a:hover {
	background-color: white;
	color: #008CBA;
}

/* Show the dropdown menu when the user moves the mouse over the dropdown button */
.dropdown:hover .dropdown-content {
	display: block;
}
}
}
</style>
<body style="background-color: white; color: white;">
<div style="position: fixed;background-color: white;top:0px;">
	<div style="position: absolute; right: 30px;">

		<a href="viewProfile.jsp"> My Account </a> &nbsp; | &nbsp; <a
			href=" addToCart.jsp"> My Cart </a> &nbsp; | &nbsp; <a
			href=" Login.jsp"> Login </a> &nbsp; | &nbsp; <a href="Register.jsp">Sign
			Up </a> &nbsp; | &nbsp; <a href="AboutUs.jsp">About Us </a>
	</div>

	<table align="center" width=100%>
		<tr>
			<td><img src="Resources/antCart1.png" style="position: relative;top:-10px"></td>
			<td width=100% style="position: relative; top: -30px; z-index: -1"><marquee
					scrollamount=20">
					<h1 align="center"
						style="color: #008CBA;; font-size: 60px; font-family: Gabriola">
						Purchasing Lanka International<img
							src="Resources/ant_PNG19367.png" width=100px height=50px>
					</h1>
				</marquee></td>



		</tr>

	</table>


	<div id="search" style="position: static;">
		<form method="POST" action="searchHomePage.jsp">
			<table align="center" width="50%">
				<tr>

					<td style="width: 100%"><input type="text" name="search"
						placeholder="Search.."
						style="position: absolute; top: 100px; left: 190px; color: #008CBA; background-image: url('Resources/search-icon.png'); background-position: 10px 10px; width: 800px; box-sizing: border-box; border: 2px solid #ccc; border-radius: 4px; font-size: 16px; background-color: #cccccc; background-position: 10px 10px; background-repeat: no-repeat; padding: 15px 40px 12px 60px; cursor: hand; margin-left: 70px;">
					</td>

					<td><input type="submit" name="submit" id="submit"
						value="Search"
						style="border-radius:4px;position: absolute; top: 100px; left: 1065px; cursor: pointer; background-color: #008CBA; border: none; color: white; padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px;">
					<td align="right" style="margin-left: 1000px">
						<h3 style="color: white"></h3>
					</td>

				</tr>
			</table>
		</form>

		<table>
			<tr>
				<td><a href="addToCart.jsp"><button
							style="border-radius:4px;position: absolute; top: 99px; left: 1185px; width: 150px; border: 2px solid black; border-color: #008CBA; color: #008CBA; background-color: white; padding: 14px 28px; font-size: 16px; cursor: pointer; : hover {background-color: #008CBA; color: white">My
							Cart</button></a></td>
			</tr>
		</table>


	</div>
	<!-- This is navigation bar -->

	<div class="topnav" id="myTopnav"
		style="width: 101%; position: absolute; top: 160px;right: 1px">



		<a href="Home.jsp">|&nbsp;&nbsp;Home</a>

		
			<div class="dropdown">
				<button class="dropbtn">
						<a href="category.jsp?type=grocery">Grocery</a> <i
							class="fa fa-caret-down"></i>
					</button>
			</div>
			<div class="dropdown">
				<button class="dropbtn">
					<a href="category.jsp?type=dairy">Dairy</a> <i
						class="fa fa-caret-down"></i>
				</button>
				
				<div class="dropdown-content">
					<a href="category.jsp?type=dairy&subtype=cheese">Cheese</a> <a
						href="category.jsp?type=dairy&subtype=yoghurt">Yoghurt</a> <a
						href="category.jsp?type=dairy&subtype=Creams">Creams</a> <a
						href="category.jsp?type=dairy&subtype=Butter">Butter</a> <a
						href="category.jsp?type=dairy&subtype=Milk">Milk</a>
				</div>
			</div>

			<div class="dropdown">
				<button class="dropbtn"	style="cursor: pointer;">
					<a href="category.jsp?type=frozen">Frozen</a> <i
						class="fa fa-caret-down"></i>
				</button>
				
				<div class="dropdown-content">
					<a href="category.jsp?type=frozen&subtype=icecream">Ice Cream</a> <a
						href="category.jsp?type=frozen&subtype=frozen vegetables">Frozen
						Vegetables</a> <a
						href="category.jsp?type=frozen&subtype=frozen fruits">Frozen
						Fruits</a>
				</div>
			</div>

			<div class="dropdown">
				<button class="dropbtn" onclick="location.href = '#dairy';"
					style="cursor: pointer;">
					<a href="category.jsp?type=vegetable">Vegetables</a> <i
						class="fa fa-caret-down"></i>
				</button>
				
				<div class="dropdown-content">
					<a href="category.jsp?type=vegetable&subtype=leaves">Leaves</a> <a
						href="category.jsp?type=vegetable&subtype=Organic Vegetables">Organic
						Vegetables</a> <a
						href="category.jsp?type=vegetable&subtype=Fresh Vegetables">Fresh
						Vegetables</a>
				</div>
			</div>

			<div class="dropdown">
				<button class="dropbtn" style="cursor: pointer;">
					<a href="category.jsp?type=fruit">Fruits</a> <i
						class="fa fa-caret-down"></i>
				</button>
				
			</div>

			<div class="dropdown">
				<button class="dropbtn"
					onclick="location.href = 'category.jsp?type=meat';"
					style="cursor: pointer;">
					<a href="category.jsp?type=meat">Meat</a> <i
						class="fa fa-caret-down"></i>
				</button>
				
				<div class="dropdown-content">
					<a href="category.jsp?type=meat&subtype=Chicken">Chicken</a> <a
						href="category.jsp?type=meat&subtype=lamb">Lamb</a> <a
						href="category.jsp?type=meat&subtype=pork">Pork</a> <a
						href="category.jsp?type=meat&subtype=beef">Beef</a> <a
						href="category.jsp?type=meat&subtype=mutton">Mutton</a> <a
						href="category.jsp?type=meat&subtype=Processed Meat">Processed
						Meat</a>
				</div>
			</div>

			<div class="dropdown">
				<button class="dropbtn" 
					style="cursor: pointer;">
					<a href="category.jsp?type=drink">Drinks</a> <i
						class="fa fa-caret-down"></i>
				</button>
				
				<div class="dropdown-content">
					<a href="category.jsp?type=drink&subtype=icedtea">Iced Tea</a> <a
						href="category.jsp?type=drink&subtype=icedcoffee">Iced Coffee</a>
					<a href="category.jsp?type=drink&subtype=sports and energy">Sports
						and Energy</a> <a href="category.jsp?type=drink&subtype=Bottled Water">Bottled
						Water</a> <a href="category.jsp?type=drink&subtype=Juices">Juices</a>
					<a href="category.jsp?type=drink&subtype=Carbonated Drinks">Carbonated
						Drinks</a> <a href="category.jsp?type=drink&subtype=Herbal Drinks">Herbal
						Drinks</a>
				</div>
			</div>


			<div class="dropdown">
				<button class="dropbtn"
					style="cursor: pointer;">
					<a href="category.jsp?type=bakery">Bakery</a> <i class="fa fa-caret-down"></i>
				</button>
				<div class="dropdown-content">
					<a href="category.jsp?type=bakery&subtype=cakes">Cakes</a> <a
						href="category.jsp?type=bakery&subtype=Breads">Breads</a> <a
						href="category.jsp?type=bakery&subtype=Savouries">Savouries</a>


				</div>
			</div>

			<div class="dropdown">
				<button class="dropbtn" 
					style="cursor: pointer;">
					<a href="category.jsp?type=household">Household</a> <i class="fa fa-caret-down"></i>
				</button>
				<div class="dropdown-content">
					<a href="category.jsp?type=household&subtype=airfreshners">Air
						Freshners</a> <a
						href="category.jsp?type=household&subtype=washing aids">Washing
						Aids</a> <a
						href="category.jsp?type=household&subtype=sanitary products">Sanitary
						Products</a> <a href="category.jsp?type=household&subtype=lighting">Lighting</a>
					<a href="category.jsp?type=household&subtype=babycare">Baby
						Care</a> <a href="category.jsp?type=household&subtype=vehiclecare">Vehicle
						Care</a> <a href="category.jsp?type=household&subtype=petcare">Pet
						Care</a> <a href="category.jsp?type=household&subtype=garden products">Garden
						Products</a>
				</div>
			</div>

			<div class="dropdown">
				<button class="dropbtn" 
					style="cursor: pointer;">
					<a href="category.jsp?type=personalcare">Personal Care</a> <i class="fa fa-caret-down"></i>
				</button>
				<div class="dropdown-content">
					<a href="category.jsp?type=personalcare&subtype=beautycare">Beauty
						Care</a> <a
						href="category.jsp?type=personalcare&subtype=personal needs">Personal
						Needs</a> <a
						href="category.jsp?type=personalcare&subtype=shampoo and conditioner">Shampoo
						& Conditioners</a> <a
						href="category.jsp?type=personalcare&subtype=oralcare">Oral
						Care</a> <a href="category.jsp?type=personalcare&subtype=haircare">Hair
						Care</a> <a href="category.jsp?type=personalcare&subtype=facecare">Face
						Care</a>
				</div>
			</div>

			<div class="dropdown">
				<button class="dropbtn" 
					style="cursor: pointer;">
					<a href="category.jsp?type=homeware">Homeware</a> <i class="fa fa-caret-down"></i>
				</button>
				<div class="dropdown-content">

					<a href="category.jsp?type=homeware&subtype=toys">Toys</a> <a
						href="category.jsp?type=homeware&subtype=car accessories">Car
						Accesories</a> <a href="category.jsp?type=homeware&subtype=stationary">Stationary</a>
					<a href="category.jsp?type=homeware&subtype=party items">Party
						Items</a> <a href="category.jsp?type=homeware&subtype=hardware">Hardware</a>
					<a href="category.jsp?type=homeware&subtype=kitchenware">Kitchenware</a>
					<a href="category.jsp?type=homeware&subtype=glassware">Glassware</a>
					<a href="category.jsp?type=homeware&subtype=decor">Decor /
						Gifts</a>

				</div>
			</div>

			<a href="category.jsp?type=electronic">Electronic</a>

			<div class="dropdown">
				<button class="dropbtn" 
					style="cursor: pointer;">
					<a href="category.jsp?type=furniture">Furniture</a> <i class="fa fa-caret-down"></i>
				</button>
				<div class="dropdown-content">
					<a href="category.jsp?type=furniture&subtype=laundry">Laundry</a> <a
						href="category.jsp?type=furniture&subtype=livingroom">Living
						Room</a> <a href="category.jsp?type=furniture&subtype=diningroom">Dining
						Room</a> <a href="category.jsp?type=furniture&subtype=office">Office</a>
					<a href="category.jsp?type=furniture&subtype=outdoor">Outdoor</a> <a
						href="category.jsp?type=furniture&subtype=bedroom">Bedroom</a>


				</div>
			</div>
		<table align="right">

				<tr
					style="background-color: #008cba; position: absolute; top:55px; right: 0px;border:solid;">
							<form method="post" action="logoutPage">
			
		
					<td align="center" style="width: 260px; height: 30px">Logged
						as: ${username} <input type="submit" value="Logout"
						style="border-radius:4px;position: relative; width: 100px; padding: 5px; border: 2px solid black; border-color: #008CBA; color: #008CBA; background-color: white; font-size: 16px; cursor: pointer;">
					</td>
</form>
				</tr>

			</table>


	</div>
</div>

<div style="height: 200px">

</div>




	<br>
	<br>

	<div id="mySidenav" class="sidenav">



		<a href="AboutUs.jsp" id="about">About</a> <a href="AboutUs.jsp"
			id="blog">Blog</a> <a href="AboutUs.jsp" id="projects">Projects</a> <a
			href="AboutUs.jsp" id="contact">Contact</a>



	</div>