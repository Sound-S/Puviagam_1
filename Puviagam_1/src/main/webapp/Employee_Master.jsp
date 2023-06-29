
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.time.LocalDate" %>
     <%@page import="java.sql.*"%>
    <%@page import="java.util.*"%>
    <%@page import="All_Codes.JDBC"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

    <link rel="stylesheet" href="index.css">
    
    <link rel="icon"
	href="https://res.cloudinary.com/dsedsmqrs/image/upload/v1686139634/1686139290681_zzxygi.png">
    
    <style type="text/css">
    .avatar {
  vertical-align: middle;
  width: 25px;
  height: 25px;
  border-radius: 50%;
}
    </style>

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
						<li class="nav-item"><a href="Employee_Master.jsp" class="nav-link  text-white">Home</a></li>
						
						<li class="nav-item"><a href="Supervisor_Site_Status.jsp" class="nav-link text-white">Site Status</a></li>

						
						<!-- <li class="nav-item"><a href="Supervisor_Inventory.jsp" class="nav-link text-white">Inventory</a></li> -->
						
						<li class="nav-item">
							<div class="dropdown">
								<button class="btn btn-dark dropdown-toggle" type="button"
									data-bs-toggle="dropdown" aria-expanded="false">
									Inventory</button>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="Supervisor_Inventory.jsp">Inventory</a></li>
									<li><a class="dropdown-item" href="Show_Supervisor_Inventory.jsp">Inventory Reports</a></li>  
                                    
								</ul>
							</div>

						</li>

						
						
							
							
							<li class="nav-item">
							<div class="dropdown">
								<button class="btn btn-dark dropdown-toggle" type="button"
									data-bs-toggle="dropdown" aria-expanded="false">
									<img src="https://www.w3schools.com/w3images/avatar6.png" alt="Avatar" class="avatar" >   <%out.println(session.getAttribute("Employee_Name")); %>
									</button>
								<ul class="dropdown-menu">
									<li style="padding-left:10px;"><a class="dropdown-item" href="">Profile</a></li>
									<li class="dropdown-item"><form action="Logout" method="post">
							               <input type="submit" value="Logout" class="nav-link text-black">
							             </form> 
							        </li> 
							         
                                    
								</ul>
							</div>

						</li>
							
					</ul>

				</div>

			</div>

		</nav>
	</header>

	<!--end navbar -->
	
	<div class="container text-white" style="margin-top:200px;">
   
   
   <!-- First Row -->
   
	<div class="container   admindash ">
		<div class="row ">
			<div class="col px-4 text-top"
				onclick="location.href='';"  >
				<div class="p-3  div_details w-75 mt-3  "
					style="box-shadow: 0 19px 38px rgba(0, 0, 0, 0.30), 0 15px 12px rgba(0, 0, 0, 0.22);background-color:#ffd449;">
					<h6>No.of Sites</h6>
					<h6>
					
					  <% try
             {
				 int count_site=0;		  
            	 String Supervisor_id = (String)session.getAttribute("Employee_id");
            	 ArrayList<String> customer=JDBC.Get_Site_id(Supervisor_id);
             
        		
        		for(int j=0;j<customer.size();j++)
        		{
        	        count_site+=1;
                } 
        		out.println(count_site);
        		}
             catch(Exception e)
             {
            	 e.printStackTrace();
             }
					  
             %>
					
					</h6>
					<img src="https://res.cloudinary.com/dsedsmqrs/image/upload/v1686286351/icons8-building-100_ukkjs4.png" class="div_icons">
				</div>
			</div>
			<div class="col px-4 text-top"
				onclick="location.href='Supervisor_Site_Status.jsp';">
				<div class="p-3  div_details w-75 mt-3 "
					style="box-shadow: 0 19px 38px rgba(0, 0, 0, 0.30), 0 15px 12px rgba(0, 0, 0, 0.22);background-color:#98BDFF;">
					<h6>Site Status</h6>
					<pre></pre>
					<img src="https://res.cloudinary.com/dsedsmqrs/image/upload/v1686338710/icons8-report-100_lo5tbf.png" class="div_icons">
				</div>
			</div>

            	<div class="col px-4 text-top"
				onclick="location.href='Supervisor_Inventory.jsp';">
				<div class="p-3  div_details w-75 mt-3"
					style="box-shadow: 0 19px 38px rgba(0, 0, 0, 0.30), 0 15px 12px rgba(0, 0, 0, 0.22);background-color:#F3797E;">
					<h6>Inventory</h6>
					<pre></pre>
					<img src="https://res.cloudinary.com/dsedsmqrs/image/upload/v1686285930/icons8-brick-96_1_jlum4h.png" class="div_icons">
				</div>
			</div>
			
			<div class="col px-4 text-top"
				onclick="location.href='Show_Supervisor_Inventory.jsp';">
				<div class="p-3  div_details w-75 mt-3"
					style="box-shadow: 0 19px 38px rgba(0, 0, 0, 0.30), 0 15px 12px rgba(0, 0, 0, 0.22);background-color:#cb769e;">
					<h6>Inventory Reports</h6>
					<pre></pre>
					<img src="https://res.cloudinary.com/dsedsmqrs/image/upload/v1686284241/icons8-pie-chart-report-100_kof4qy.png" class="div_icons">
				</div>
			</div>
			
			

		</div>

	</div>
	</div>
	


<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1

response.setHeader("pragma", "no-cache"); //HTTP 1.0

response.setHeader("Expires", "0"); //proxies


if (session.getAttribute("Email") == null)

{

	response.sendRedirect("index.jsp");

} 

%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

</body>
</html>