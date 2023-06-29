<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
String sno = request.getParameter("sno");
String driver = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "puviagam";
String userid = "root";
String password = "12345";
try 
{

Class.forName(driver);

} 
catch (ClassNotFoundException e) {

e.printStackTrace();

}

Connection connection = null;

//Statement statement = null;

PreparedStatement ps =null;

ResultSet resultSet = null;

%>

<%

try

{

connection = DriverManager.getConnection(connectionUrl+database, userid, password);

//statement=connection.createStatement();

String sql ="select * from price_details where Sno=?";

ps=connection.prepareStatement(sql);
ps.setString(1, sno);

resultSet = ps.executeQuery();

while(resultSet.next())

{

%>  

<!DOCTYPE html>

<html>

<head>


<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Price Update</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

    <link rel="stylesheet" href="index.css">
    
    <link rel="icon"
	href="https://res.cloudinary.com/dsedsmqrs/image/upload/v1686139634/1686139290681_zzxygi.png">
	
</head>

<body>

<!--navbar start-->

	<header>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">

			<div class="container">
				<a href="" class="navbar-brand"><img
					src="https://res.cloudinary.com/dsedsmqrs/image/upload/v1685905487/1685905387595_t6z2ge.png"
					class="img-fluid" alt="company logo"
					style="height: 40px; width: 180px;"> </a>


				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#Mynavbar"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="Mynavbar">

					<ul class="navbar-nav ms-auto">
						<li class="nav-item"><a href="Admin_Master.jsp"
							class="nav-link  text-white">Home</a></li>

						<li class="nav-item">
							<div class="dropdown">
								<button class="btn btn-dark dropdown-toggle" type="button"
									data-bs-toggle="dropdown" aria-expanded="false">
									Registration</button>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="Customer_Details.jsp">Customer Registration</a></li>
									<li><a class="dropdown-item" href="Site_Register.jsp">Site
											Registration</a></li>
									<li><a class="dropdown-item" href="Employee_Details.jsp">Supervisor Registration</a></li>
								</ul>
							</div>

						</li>


						<li class="nav-item">
							<div class="dropdown">
								<button class="btn btn-dark dropdown-toggle" type="button"
									data-bs-toggle="dropdown" aria-expanded="false">
									Reports</button>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="show_customer_data.jsp">Customer
											Reports</a></li>
									<li><a class="dropdown-item" href="show_employee_data.jsp">Supervisor
											Reports</a></li>
									<li><a class="dropdown-item" href="show_Site_Status.jsp">Site
											Reports</a></li>
								</ul>
							</div>

						</li>

						<li class="nav-item">
							<div class="dropdown">
								<button class="btn btn-dark dropdown-toggle" type="button"
									data-bs-toggle="dropdown" aria-expanded="false">
									Estimation</button>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="Estimation.jsp">Estimation</a></li>
									<li><a class="dropdown-item"
										href="Finding_estimations.jsp">Estimation Reports</a></li>

								</ul>
							</div>

						</li>





						<li class="nav-item"><a href="price.jsp"
							class="nav-link text-white">Price</a></li>

						<li class="nav-item"><a href="Manager_Inventory.jsp"
							class="nav-link text-white">Inventory</a></li>

						<li class="nav-item">
							<div class="dropdown">
								<button class="btn btn-dark dropdown-toggle" type="button"
									data-bs-toggle="dropdown" aria-expanded="false">
									Payment</button>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="Payment_Management.jsp">Payment</a></li>
									<li><a class="dropdown-item"
										href="Show_Payment_Details.jsp">Payment Reports</a></li>

								</ul>
							</div>

						</li>

						<!--  <li class="nav-item"><a href="Payment_Management.jsp" class="nav-link text-white">Payment</a></li> 

						<li class="nav-item"><a href="Manager_Resource.jsp"
							class="nav-link text-white">Resource</a></li>-->

						<li class="nav-item">
							<form action="Logout" method="post">

								<input type="submit" value="Logout" class="nav-link text-white">

							</form>
						</li>


					</ul>

				</div>

			</div>

		</nav>
	</header>

	<!--end navbar -->


<!-- Error and Sucess_Message_Login -->
			

 <div class="container dis_back2 mb-4 bg-white">
        <h4>Price Update</h4>
     <form action="Price_update_prce.jsp" method="post">

         <input type="hidden" name="sno" value="<%=resultSet.getString(1) %>">
      
		 <!-- sand input -->
        <div class="form-outline mb-4">
          <label class="form-label" for="form2Example1"> Sand </label>
          <input type="text" id="form2Example1" class="form-control" name="Sand" value="<%=resultSet.getString(3) %> " required />
        </div>	
     
     
        <!-- Cement -->
        <div class="form-outline mb-4">
          <label class="form-label" for="form2Example1" > Cement </label>
          <input type="text" id="form2Example1" class="form-control" name="Cement" value="<%=resultSet.getString(4) %> " required/>
        </div>
        
         <!-- Aggregate input -->
        <div class="form-outline mb-4">
          <label class="form-label" for="form2Example1"> Aggregate </label>
          <input type="text" id="form2Example1" class="form-control" name="Aggregate" value="<%=resultSet.getString(19) %> " required />
        </div>	
      
        <!-- Brick -->
        <div class="form-outline mb-4">
          <label class="form-label" for="form2Example2" >Brick</label>
          <input type="text" id="form2Example2" class="form-control"  name="Brick" value="<%=resultSet.getString(5) %> " required/>
        </div>
        

          <!-- Steel -->
        <div class="form-outline mb-4">
            <label class="form-label " for="form2Example1" > Steel </label>
            <input type="text" class="form-control" id="form2Example1" name="Steel" value="<%=resultSet.getLong(6) %> " required>
        </div>
        
        <!-- Outer paint -->
        <div class="form-outline mb-4">
            <label class="form-label " for="form2Example1" > Outer Paint </label>
            <input type="text" class="form-control" id="form2Example1" name="Outer_paint" value="<%=resultSet.getLong(7) %> " required>
        </div>
        
        <!-- Inner paint -->
        <div class="form-outline mb-4">
            <label class="form-label " for="form2Example1" > Inner Paint </label>
            <input type="text" class="form-control" id="form2Example1" name="Inner_paint" value="<%=resultSet.getLong(8) %> " required>
        </div>
        
        <!-- Flooring -->
        <div class="form-outline mb-4">
            <label class="form-label " for="form2Example1" > Flooring  </label>
            <input type="text" id="form2Example1" class="form-control" name="Flooring" value="<%=resultSet.getString(9) %> " >
        </div>
        
        <!-- Electrical and Plumbing  -->
        <div class="form-outline mb-4">
            <label class="form-label " for="form2Example1" > Electrical & Plumbing  </label>
            <input type="text" id="form2Example1" class="form-control" name="Electrical_plumbing" value="<%=resultSet.getString(10) %> " >
        </div>
        
        <!-- bathroom_materials_amount  -->
        <div class="form-outline mb-4">
            <label class="form-label " for="form2Example1" > Bathroom Materials  </label>
            <input type="text" id="form2Example1" class="form-control" name="Bathroom_materials" value="<%=resultSet.getString(11) %> " >
        </div>
        
        <!-- bathroom_door_amount  -->
        <div class="form-outline mb-4">
            <label class="form-label " for="form2Example1" > Bathroom Door  </label>
            <input type="text" id="form2Example1" class="form-control" name="Bathroom_door" value="<%=resultSet.getString(12) %> " >
        </div>
        
        <!-- Basic main door  -->
        <div class="form-outline mb-4">
            <label class="form-label " for="form2Example1" > Basic Main Door  </label>
            <input type="text" id="form2Example1" class="form-control" name="basic_main_door" value="<%=resultSet.getString(13) %> " >
        </div>
        
        <!-- Preminum main door  -->
        <div class="form-outline mb-4">
            <label class="form-label " for="form2Example1" > Premium Main Door  </label>
            <input type="text" id="form2Example1" class="form-control" name="premium_main_door" value="<%=resultSet.getString(14) %> " >
        </div>
        
        <!-- Ultra-preminum main door  -->
        <div class="form-outline mb-4">
            <label class="form-label " for="form2Example1" > Ultra-Premium Main Door  </label>
            <input type="text" id="form2Example1" class="form-control" name="ultra-premium_main_door" value="<%=resultSet.getString(15) %> " >
        </div>
        
        <!-- bedroom_door_amount  -->
        <div class="form-outline mb-4">
            <label class="form-label " for="form2Example1" >  Bedroom Door </label>
            <input type="text" id="form2Example1" class="form-control" name="bedroom_door" value="<%=resultSet.getString(16) %> " >
        </div>
        
        <!-- Window  -->
        <div class="form-outline mb-4">
            <label class="form-label " for="form2Example1" > Window  </label>
            <input type="text" id="form2Example1" class="form-control" name="window" value="<%=resultSet.getString(17) %> " >
        </div>
               
        <!-- Kitchen Granite -->
        <div class="form-outline mb-4">
            <label class="form-label " for="form2Example1" > Kitchen Granite </label>
            <input type="text" id="form2Example1" class="form-control" name="Kitchen_Granite" value="<%=resultSet.getString(18) %> " >
        </div>
        
       
        <!-- Submit button -->
        <div class="container d-flex justify-content-center">
        <!-- <button type="button" class="btn btn-primary btn-block mb-4 buttonw">Register</button>-->
        <input type="submit" value="Update" class="btn btn-primary btn-block mb-4 buttonw">
        </div>
    

      </form>
    </div>
    
    <%

      response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");  //HTTP 1.1

      response.setHeader("pragma", "no-cache");  //HTTP 1.0

      response.setHeader("Expires", "5");  //proxies

   

      if(session.getAttribute("Email") == null)

      {

    	  response.sendRedirect("index.jsp");

      }

      %>

<%

}

connection.close();

} 

catch (Exception e) 

{

e.printStackTrace();

}

%>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

</body>

</html>

