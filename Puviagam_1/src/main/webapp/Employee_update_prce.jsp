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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

    <link rel="stylesheet" href="index.css">

<title>Update</title>

</head>

<body>

<!--navbar start-->

	<header>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">

			<div class="container">
				<a href="/" class="navbar-brand"> Puviagam </a>

				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#Mynavbar"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="Mynavbar">

					<ul class="navbar-nav ms-auto">
						<li class="nav-item"><a href="Admin_Master.jsp" class="nav-link  text-white">Home</a></li>

						<li class="nav-item">
							<div class="dropdown">
								<button class="btn btn-dark dropdown-toggle" type="button"
									data-bs-toggle="dropdown" aria-expanded="false">
									Registration</button>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="Customer_Details.jsp">Customer</a></li>
									<li><a class="dropdown-item" href="Site_Register.jsp">Site Register</a></li>  
                                    <li><a class="dropdown-item" href="Employee_Details.jsp">Employee</a></li>
								</ul>
							</div>

						</li>
						
						
						<li class="nav-item">
							<div class="dropdown">
								<button class="btn btn-dark dropdown-toggle" type="button"
									data-bs-toggle="dropdown" aria-expanded="false">
									Details</button>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="show_customer_data.jsp">Customer Details</a></li>
									<li><a class="dropdown-item" href="show_employee_data.jsp">Employee Details</a></li>  
                                   
								</ul>
							</div>

						</li>

						

						<li class="nav-item"><a href="Estimation.jsp" class="nav-link text-white">Estimation</a></li>
						
						<li class="nav-item"><a href="price.jsp" class="nav-link text-white">Price</a></li>

						<li class="nav-item"><a href="Inventory.jsp" class="nav-link text-white">Inventory</a></li>

						<li class="nav-item"><a href="Cost_estimation.jsp" class="nav-link text-white">Cost Management</a></li>
						
						<li class="nav-item"><a href="Resource.jsp" class="nav-link text-white">Resource</a></li>
							
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

String Employee_ID = request.getParameter("Employee_ID");

String Employee_Name=request.getParameter("Employee_Name");

String Employee_Email=request.getParameter("Employee_Email");

String Employee_Mobile_No=request.getParameter("Employee_Mobile_No");

String Employee_Address=request.getParameter("Employee_Address");






if(Employee_ID != null)

{

Connection con = null;

PreparedStatement ps = null;



try

{

Class.forName(driverName);

con = DriverManager.getConnection(url,user,psw);

String sql="Update employee set emp_name=?,emp_email_id=?, emp_phone=?,emp_address=? where emp_id=?";

ps = con.prepareStatement(sql);



ps.setString(1, Employee_Name);

ps.setString(2, Employee_Email);

ps.setString(3, Employee_Mobile_No);

ps.setString(4, Employee_Address);


ps.setString(5, Employee_ID);


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






<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>

</html>