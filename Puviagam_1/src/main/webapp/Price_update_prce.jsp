<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

    

<%@ page import="java.sql.*" %>

<%! String driverName = "com.mysql.cj.jdbc.Driver";%>

<%!String url = "jdbc:mysql://localhost:3306/puviagam";%>

<%!String user = "root";%>

<%!String psw = "12345";%>



<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title> Price Update</title>

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


<%

//String sno = request.getParameter("sno");

float Sand = Float.parseFloat(request.getParameter("Sand"));

float Cement=Float.parseFloat(request.getParameter("Cement"));

float Brick=Float.parseFloat(request.getParameter("Brick"));

float Steel=Float.parseFloat(request.getParameter("Steel"));

float Outer_paint=Float.parseFloat(request.getParameter("Outer_paint"));

float Inner_paint=Float.parseFloat(request.getParameter("Inner_paint"));

float Flooring=Float.parseFloat(request.getParameter("Flooring"));

float Electrical_plumbing=Float.parseFloat(request.getParameter("Electrical_plumbing"));

float Bathroom_materials=Float.parseFloat(request.getParameter("Bathroom_materials"));

float Bathroom_door=Float.parseFloat(request.getParameter("Bathroom_door"));

float basic_main_door=Float.parseFloat(request.getParameter("basic_main_door"));

float premium_main_door=Float.parseFloat(request.getParameter("premium_main_door"));

float ultra_premium_main_door=Float.parseFloat(request.getParameter("ultra-premium_main_door"));

float bedroom_door=Float.parseFloat(request.getParameter("bedroom_door"));

float window=Float.parseFloat(request.getParameter("window"));

float Kitchen_Granite=Float.parseFloat(request.getParameter("Kitchen_Granite"));

float Aggregate=Float.parseFloat(request.getParameter("Aggregate"));
//System.out.println(Employee_ID);

if("kk" != null)

{

Connection con = null;

PreparedStatement ps = null;



try

{

Class.forName(driverName);

con = DriverManager.getConnection(url,user,psw);

String sql="insert into price_details(price_date, sand, cement, brick, steel, outer_paint, inner_paint, flooring, electrical_plumbing, bathroom_materials_amount,bathroom_door_amount, basic_main_door,  premium_main_door, ultrapremium_main_door, bedroom_door_amount, window_cost, kitchen_granite_amount,Construction_Aggregate_amount) values(now(),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

ps = con.prepareStatement(sql);



ps.setFloat(1, Sand);

ps.setFloat(2, Cement);

ps.setFloat(3, Brick);

ps.setFloat(4, Steel);

ps.setFloat(5, Outer_paint);

ps.setFloat(6, Inner_paint);

ps.setFloat(7, Flooring);

ps.setFloat(8, Electrical_plumbing);

ps.setFloat(9, Bathroom_materials);

ps.setFloat(10, Bathroom_door);

ps.setFloat(11, basic_main_door);

ps.setFloat(12, premium_main_door);

ps.setFloat(13, ultra_premium_main_door);

ps.setFloat(14, bedroom_door);

ps.setFloat(15, window);

ps.setFloat(16, Kitchen_Granite);

ps.setFloat(17, Aggregate);

int i = ps.executeUpdate();

if(i > 0)

{

	request.setAttribute("Update_Sucess", "Updated Sucessfully");
    request.getRequestDispatcher("Update_Message.jsp").forward(request, response);
    

}

else

{

	request.setAttribute("Update_Error", "Problem in updation");
    request.getRequestDispatcher("Update_Message.jsp").forward(request, response);

} 

}

catch(SQLException sql)

{

request.setAttribute("error", sql);

out.println(sql);

}

}

%>

<%

      response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");  //HTTP 1.1

      response.setHeader("pragma", "no-cache");  //HTTP 1.0

      response.setHeader("Expires", "5");  //proxies

   

      if(session.getAttribute("Email") == null)

      {

    	  response.sendRedirect("index.jsp");

      }

      %>






</body>

</html>