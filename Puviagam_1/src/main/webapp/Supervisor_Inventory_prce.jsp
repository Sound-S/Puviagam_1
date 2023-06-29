<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ page import="java.time.LocalDate" %>
     <%@page import="java.sql.*"%>
    <%@page import="java.util.*"%>
    <%@page import="All_Codes.JDBC"%>
    
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">

<link rel="stylesheet" href="index.css">

<link rel="icon"
	href="https://res.cloudinary.com/dsedsmqrs/image/upload/v1686139634/1686139290681_zzxygi.png">

<title>Inventory_prce</title>
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
						<li class="nav-item"><a href="Employee_Master.jsp" class="nav-link  text-white">Home</a></li>
						
						<li class="nav-item"><a href="Supervisor_Site_Status.jsp" class="nav-link text-white">Site Status</a></li>

						
						<li class="nav-item"><a href="Supervisor_Inventory.jsp" class="nav-link text-white">Inventory</a></li>

						
						<li class="nav-item"><a href="Supervisor_Resource.jsp" class="nav-link text-white">Resource</a></li>
							
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

//variable in while loop
float available_sand_qty = 0;
long available_cement_qty = 0;
float available_steel_qty = 0;
float available_aggregate_qty = 0;



float sand_qty = Float.parseFloat(request.getParameter("sand"));
long cement_qty = Long.parseLong(request.getParameter("cement"));
float steel_qty = Float.parseFloat(request.getParameter("steel"));
float aggregate_qty = Float.parseFloat(request.getParameter("aggregate"));

String site_id = request.getParameter("site_id");
String process_type = request.getParameter("process_type");

//JDBC Connection
Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/puviagam";
String user="root";
String password="12345";
Connection con =DriverManager.getConnection(url,user,password);

//getting the last data (based on recent date) from database
String query1 = "select * from  Inventory where inventory_entry_date = (select max(inventory_entry_date) from Inventory) and Site_no=?";
PreparedStatement  ps = con.prepareStatement(query1);
ps.setString(1, site_id);
ResultSet rs = ps.executeQuery();
while(rs.next())
{
	available_sand_qty = rs.getFloat(4);
	available_cement_qty = rs.getLong(5);
	available_steel_qty = rs.getFloat(6);
	available_aggregate_qty = rs.getFloat(7);
}

System.out.println("sand : " + available_sand_qty);
System.out.println("cement : " + available_cement_qty);
System.out.println("steel : " + available_steel_qty);
System.out.println("aggregate : " + available_aggregate_qty);

System.out.println("Process type : " + process_type);

if(process_type.equals("stock_in"))
{
	available_sand_qty = available_sand_qty + sand_qty;
	available_cement_qty = available_cement_qty +  cement_qty;
	available_steel_qty = available_steel_qty + steel_qty;
	available_aggregate_qty = available_aggregate_qty + aggregate_qty;
}
else
{
	available_sand_qty = available_sand_qty - sand_qty;
	available_cement_qty = available_cement_qty -  cement_qty;
	available_steel_qty = available_steel_qty - steel_qty;
	available_aggregate_qty = available_aggregate_qty - aggregate_qty;
}

System.out.println("sand : " + available_sand_qty);
System.out.println("cement : " + available_cement_qty);
System.out.println("steel : " + available_steel_qty);
System.out.println("aggregate : " + available_aggregate_qty);

String query2 = "insert into Inventory values(?,now(),current_time(),?,?,?,?);";
ps = con.prepareStatement(query2);
ps.setString(1, site_id);
ps.setFloat(2, available_sand_qty);
ps.setLong(3, available_cement_qty);
ps.setFloat(4, available_steel_qty);
ps.setFloat(5, available_aggregate_qty);

int i = ps.executeUpdate();
if(i == 1)
{
	
  	
	request.setAttribute("pass_sucess_msg", "Updated Sucessfully");
	request.getRequestDispatcher("Supervisor_Inventory.jsp").forward(request, response);
}
else
{
	request.setAttribute("pass_err_msg", "Problem in update");
	request.getRequestDispatcher("Supervisor_Inventory.jsp").forward(request, response);
	
}

%>

</body>
</html>