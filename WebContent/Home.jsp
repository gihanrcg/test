	<!DOCTYPE html>
	
	<html>
	
	<head>
		<title> Welcome to ABC Shopping Center </title>
	</head>
	<body>
	<%@page import="com.oop.dbconnect.*"%>
	<%@include file="Header.jsp" %>
	
	
	<div class="slideshow-container" style="z-index: -1;width: 750px;position: absolute; left : 300px; height: 500px;top:293px;border-radius: 10px">

<div class="mySlides fade">

  <img src="SlideShowImages/1.jpg" style="width:100%;height: 370px">
  <div class="text">Caption Text</div>
</div>

<div class="mySlides fade">

  <img src="SlideShowImages/2.jpg" style="width:100%; height: 370px">
  <div class="text">Caption Two</div>
</div>

<div class="mySlides fade">

  <img src="SlideShowImages/3.jpg" style="width:100%;height: 370px">
  <div class="text">Caption Three</div>
</div>

<div class="mySlides fade">

  <img src="SlideShowImages/4.jpg" style="width:100%;height: 370px">
  <div class="text">Caption Three</div>
</div>

<div class="mySlides fade">

  <img src="SlideShowImages/5.jpg" style="width:100%;height: 370px">
  <div class="text">Caption Three</div>
</div>

<div class="mySlides fade">

  <img src="SlideShowImages/6.jpg" style="width:100%;height: 370px">
  <div class="text">Caption Three</div>
</div>


</div>
<br>

<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
    <span class="dot"></span> 
  <span class="dot"></span> 
</div>
<script>
var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 1500); // Change image every 2 seconds
}
</script>
	
	
	
	
	
	
	
	
	
	
	<div style = "z-index: -1;width: 250px; height: 100px; float: left; background-color: #008CBA; border-radius: 10px; padding: 10px; position: absolute;top:293px"  >
	
	<img src ="SlideShowImages/A.png">
	
	</div>
	
	<div style = "z-index: -1;width: 250px; height: 100px; float: left; background-color: #008CBA; border-radius: 10px; padding: 10px; position: absolute; top:420px;"  >
	
	<img src ="SlideShowImages/B.png">
	
	</div>
	
	<div style = "z-index: -1;width: 250px; height: 100px; float: left; background-color: #008CBA; border-radius: 10px; padding: 10px; position: absolute; top:547px;"  >
	
	<img src ="SlideShowImages/C.png">
	
	</div>
	
		<div style = "z-index: -1;width: 250px; height: 100px; float: right; background-color: #008CBA; border-radius: 10px; padding: 10px; position: absolute; left :1070px;top:293px	"  >
	
	<img src ="SlideShowImages/D.png">
	
	
	</div>
	
	<div style = "z-index: -1;width: 250px; height: 100px; float: left; background-color: #008CBA; border-radius: 10px; padding: 10px; position: absolute; top:420px;left :1070px"  >
	
	<img src ="SlideShowImages/E.png">
	
	</div>
	
	<div style = "z-index: -1;width: 250px; height: 100px; float: left; background-color: #008CBA; border-radius: 10px; padding: 10px; position: absolute; top:547px;left :1070px"  >
	
	<img src ="SlideShowImages/F.png">
		
	</div>

<div style="position: relative;top:500px ;z-index: 0">  	

<h1 align="center" style="color: #008CBA">Recently Sold Items</h1>

	<table cellspacing="20px" align="center" cellpadding="30px"
		width="100%">


		<%
			try {
				boolean t;
				connectDb db = new connectDb();

				String query;
				
			
					query = "select i.ItemID,i.Name,i.UnitPrice,Photo from inventory i,orders o where i.ItemID = o.itemID group by o.itemID";
					db.rs = db.st.executeQuery(query);
				

				for (int r = 0;r < 5; r++) {
		%>
		<tr style="height: 200px">
			<%
				for (int c = 0; c < 4; c++) {

							t = db.rs.next();
							if (t == false)
								break;
			%>


			<td align="center"
				style="border: solid #008CBA; color: #008CBA; background-color: white; width: 200px;">


				<p align="center" style="font-size: 18px; font-style: oblique;">
					<%=db.rs.getString("Name")%></p> <img width=200px height=200px
				src="Resources/<%=db.rs.getString("Photo")%>">
				<p style="font-size: 24px; color: red">
					Rs.<%=db.rs.getString("UnitPrice")%>.00
					
				</p>
				<form name="popup" method="post"
					action="Item_popup.jsp?u=<%=db.rs.getString("i.ItemID")%>">
					<input name="view"
						style="background-color: #008CBA; border: none; color: white; padding: 15px 32px; text-align: center; text-decoration: none; display: inline-block; font-size: 16px; margin: 10px 10px; cursor: pointer;"
						type="submit" value="View more">
				</form>
			</td>
			<%	
				}
			%>
		</tr>
		<%
			}

			} catch (Exception e) {
				e.printStackTrace();
			}
		%>

	</table>
	
	
	</div>	
	<footer style="margin-top: 1000px">	<%@include file="Footer.jsp" %></footer>

	</body>
	</html>