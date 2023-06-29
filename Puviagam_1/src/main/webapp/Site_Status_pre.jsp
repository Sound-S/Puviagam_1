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
	String Site_id = request.getParameter("Site_id");

	String Phase_1 = request.getParameter("Phase_1");

	String Phase_2 = request.getParameter("Phase_2");

	String Phase_3 = request.getParameter("Phase_3");

	String Phase_4 = request.getParameter("Phase_4");

	String Phase_5 = request.getParameter("Phase_5");

	String Phase_6 = request.getParameter("Phase_6");

	String Phase_7 = request.getParameter("Phase_7");

	String Phase_8 = request.getParameter("Phase_8");

	String Phase_1_remarks = request.getParameter("Phase_1_remarks");

	String Phase_2_remarks = request.getParameter("Phase_1_remarks");

	String Phase_3_remarks = request.getParameter("Phase_1_remarks");

	String Phase_4_remarks = request.getParameter("Phase_1_remarks");

	String Phase_5_remarks = request.getParameter("Phase_1_remarks");

	String Phase_6_remarks = request.getParameter("Phase_1_remarks");

	String Phase_7_remarks = request.getParameter("Phase_1_remarks");

	String Phase_8_remarks = request.getParameter("Phase_1_remarks");
	
	
    //System.out.println(Customer_ID);

	if (Site_id != null)

	{

		Connection con = null;

		PreparedStatement ps = null;

		try

		{

			Class.forName(driverName);

			con = DriverManager.getConnection(url, user, psw);

			String sql = "Update customer set phase_1=?, phase_1_remarks=?,phase_2=?, phase_2_remarks=?,phase_3=?, phase_3_remarks=?,phase_4=?, phase_4_remarks=?,phase_5=?, phase_5_remarks=?,phase_6=?, phase_6_remarks=?,phase_7=?, phase_7_remarks=?,phase_8=?, phase_8_remarks=? where project_site_number=?";

			ps = con.prepareStatement(sql);

			ps.setString(1, Phase_1);
			ps.setString(2, Phase_1_remarks);
			ps.setString(3, Phase_2);
			ps.setString(4, Phase_2_remarks);
			ps.setString(5, Phase_3);
			ps.setString(6, Phase_3_remarks);
			ps.setString(7, Phase_4);
			ps.setString(8, Phase_4_remarks);
			ps.setString(9, Phase_5);
			ps.setString(10, Phase_5_remarks);
			ps.setString(11, Phase_6);
			ps.setString(12, Phase_6_remarks);
			ps.setString(13, Phase_7);
			ps.setString(14, Phase_7_remarks);
			ps.setString(15, Phase_8);
			ps.setString(16, Phase_8_remarks);
			
			ps.setString(17, Site_id);

			

			int i = ps.executeUpdate();

			if (i > 0)

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

		catch (Exception e)

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