

<html>

<head>
<title> View more </title>

<style>
#popupImage{

	border-color : #008CBA;
	border-style: solid;
	height: 500px;
	width: 400px;
	padding: 10px;

}
#imageTD{
	width : 50%;
	padding-left: 25%;
	
}
#dataTD{
	width : 50%;
	padding-left: 300px;

}

</style>

</head>

<body>
<%


	response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
	
	if(session.getAttribute("username")==null){
		response.sendRedirect("Login.jsp");
	}
	

	
		
%>



<%@include file = "Header.jsp" %>
 <%@page import="com.oop.dbconnect.*"%>


 <%
 try{
	 
	 connectDb db = new connectDb();
	 
	String u=request.getParameter("u");
	
	String query="select * from inventory where ItemID='"+u+"'";

	db.rs=db.st.executeQuery(query);  
	
	while(db.rs.next()){ 

%>
 

<div style="float: left;color: white;margin-left: 200px">

    <table align="center" >
    <form method="post" action="insertItemCart?u=<%=db.rs.getString("ItemID")%>">
        <caption><h1 style="color : #008CBA;margin-left: -850px"><%=db.rs.getString("Name")%></h1></caption>
        <tr><td>
                <img src="Resources/<%=db.rs.getString("Photo")%>" height="500" width="500"/>
            </td>
            <td style="padding-left: 50px ;  background-color: #008CBA; width: 500px;;color: white;">
                <h2 align="left">Category &emsp;:&emsp;<%=db.rs.getString("Category")%></h2>
                <h2 align="left">Brand &emsp;&emsp;	  :&emsp;<%=db.rs.getString("Name")%></h2>
                <h2 align="left">Details &emsp;&emsp;:&emsp;<%=db.rs.getString("Details")%></h2>
                <h2 align="left" style="font: 300;">Price&emsp;&emsp;&emsp;:&emsp;Rs.<%=db.rs.getString("UnitPrice")%>.00 </h2>
                 <h2 align="left">Availability :&emsp;Yes</h2>
				<h2 align="left">Quantity &emsp;:&emsp; <input type ="text" name ="quantity" value="1" style="align-content:center; width: 40px; height: 30px; "></h2>
				 			
				
				 
				 			<input type="submit" value="Add to Cart" style="width:150px; border: 2px solid black;border-color: #008CBA; color: #008CBA; background-color: white;padding: 14px 28px;font-size: 16px;cursor: pointer;:hover{background-color: #008CBA; color:white}">
				 			</form>
					
				
				
			

            
            
            
            </td>
        </tr>



    </table>
</div>



<%@include file="Footer.jsp" %>
</body>
<%

 	} 
		
}catch(Exception e){
	e.printStackTrace();
}
	 %>


</html>