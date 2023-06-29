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

String Customer_ID = request.getParameter("Customer_ID");
String Customer_Name=request.getParameter("Customer_Name");
String Customer_Email=request.getParameter("Customer_Email");

Long Customer_Mobile_No=Long.parseLong(request.getParameter("Customer_Mobile_No"));

String Customer_Address=request.getParameter("Customer_Address");
String Site_Location=request.getParameter("Site_Location");
String Site_Area=request.getParameter("Site_Area");
String Site_District=request.getParameter("Site_District");
String Site_State=request.getParameter("Site_State");

Long Site_Pincode=Long.parseLong(request.getParameter("Site_Pincode"));

String Site_Details=request.getParameter("Site_Details");
String Site_Incharge=request.getParameter("Site_Incharge");
double Estimated_total_amount = Double.parseDouble(request.getParameter("estimation_amount"));
System.out.println(Customer_ID);

if(Customer_ID != null)

{

Connection con = null;

PreparedStatement ps = null;



try

{

Class.forName(driverName);

con = DriverManager.getConnection(url,user,psw);

String sql="Update customer set customer_name=?, customer_email_id=?, customer_phone=?, customer_address=?, site_location=? ,site_area=? ,site_district=?,site_state=?,site_pincode=?,site_details=?, emp_id=? ,total_estimated_amount=? where customer_id=?";

ps = con.prepareStatement(sql);



ps.setString(1, Customer_Name);

ps.setString(2, Customer_Email);

ps.setLong(3, Customer_Mobile_No);

ps.setString(4, Customer_Address);
ps.setString(5, Site_Location);
ps.setString(6, Site_Area);
ps.setString(7, Site_District);
ps.setString(8, Site_State);
ps.setLong(9, Site_Pincode);
ps.setString(10, Site_Details);
ps.setString(11, Site_Incharge);
ps.setDouble(12, Estimated_total_amount);
ps.setString(13, Customer_ID);

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



catch(Exception e)

{

e.printStackTrace();

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