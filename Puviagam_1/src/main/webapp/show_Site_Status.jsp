<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Site Status</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

    <link rel="stylesheet" href="index.css">
    
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">

          <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap4.min.css">


<link rel="icon"
	href="https://res.cloudinary.com/dsedsmqrs/image/upload/v1686139634/1686139290681_zzxygi.png">


<style>
table, th, td 
{
  border: 1px solid black;
  border-collapse: collapse;
  text-align:center;
  font-size:14px;
}
 

</style>
</head>
<body style="font-family:Verdana;">



<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userId");
String driverName = "com.mysql.cj.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "puviagam";
String userId = "root";
String password = "12345";

try 
{
Class.forName(driverName);
} 
catch (ClassNotFoundException e) 
{
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<h2 align="center"><font><strong>Show site status</strong></font></h2>


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

<div class="container-fluid  table-responsive-lg" id="showcustomerdetails">
<script type="text/javascript" src=" https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src=" https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src=" https://cdn.datatables.net/1.13.4/js/dataTables.bootstrap4.min.js"></script>




  <script type="text/javascript">
  $(document).ready(function () {
	 var table= $('#dtBasicExample').DataTable({
	        //scrollY:        "300px",
	        scrollX:        true,
	        //scrollCollapse: true,
	        paging:         true,
	        fixedColumns:   {
	            left: 1,
	            right: 1
	        },
	        lengthMenu: [
	            [5,10, 25, 50, -1],
	            [5,10, 25, 50, 'All'],
	        ]
	    });
	  $('.dataTables_length').addClass('bs-select');
	 
	  
	  });
  
  
    </script>
    
    

<table class="table bg-white stripe row-border order-column text-nowrap table-hover" id="dtBasicExample" style="width:100%">
 <thead>

<tr class="text-white bg-success">
<td style="width:5%" class="bg-success"> Customer Name </td>
<td style="width:5%" class="bg-success"> Site Number </td>

<td style="width:5%"> Site Incharge </td>

<td style="width:5%"> Phase 1 </td>
<td style="width:5%"> Phase 1 Remarks </td>

<td style="width:5%"> Phase 2 </td>
<td style="width:5%"> Phase 2 Remarks </td>

<td style="width:5%"> Phase 3 </td>
<td style="width:5%"> Phase 3 Remarks </td>

<td style="width:5%"> Phase 4 </td>
<td style="width:5%"> Phase 4 Remarks </td>

<td style="width:5%"> Phase 5 </td>
<td style="width:5%"> Phase 5 Remarks </td>

<td style="width:5%"> Phase 6 </td>
<td style="width:5%"> Phase 6 Remarks </td>

<td style="width:5%"> Phase 7 </td>
<td style="width:5%"> Phase 7 Remarks </td>

<td style="width:5%"> Phase 8 </td>
<td style="width:5%"> Phase 8 Remarks </td>

<td style="width:5%"> Edit </td>
</tr>
</thead>
<tbody>
<%
try
{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="select * from customer";
int i = 0;
resultSet = statement.executeQuery(sql);
while(resultSet.next())
{  
	i++;
%>

<tr >
<td>  <%=resultSet.getString(3) %>   </td>
<td>  <%=resultSet.getString(10) %>   </td>

<td>  <%=resultSet.getString(17) %>   </td>
<td>  <%=resultSet.getString(18) %>   </td>
<td>  <%=resultSet.getString(19) %>   </td>
<td>  <%=resultSet.getString(20) %>   </td>
<td>  <%=resultSet.getString(21) %>   </td>
<td>  <%=resultSet.getString(22) %>   </td>
<td>  <%=resultSet.getString(23) %>   </td>
<td>  <%=resultSet.getString(24) %>   </td>
<td>  <%=resultSet.getString(25) %>   </td>
<td>  <%=resultSet.getString(26) %>   </td>
<td>  <%=resultSet.getString(27) %>   </td>
<td>  <%=resultSet.getString(28) %>   </td>
<td>  <%=resultSet.getString(29) %>   </td>
<td>  <%=resultSet.getString(30) %>   </td>
<td>  <%=resultSet.getString(31) %>   </td>
<td>  <%=resultSet.getString(32) %>   </td>
<td>  <%=resultSet.getString(33) %>   </td>



<td> <form id="myForm" action="Site_Status_update.jsp" method="post">
  <input type="hidden" name="Site_id" value= "<%=resultSet.getString(10) %>"/>
  <input type="submit" class="btn btn-info" value="Edit">
</form> </td>
</tr>


<% 
}
%>

<%
connection.close();
} 
catch (Exception e) 
{
e.printStackTrace();
}
%>
</tbody>

</table>


  </div>




  <%

      response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");  //HTTP 1.1

      response.setHeader("pragma", "no-cache");  //HTTP 1.0

      response.setHeader("Expires", "0");  //proxies

   

      if(session.getAttribute("Email") == null)

      {

    	  response.sendRedirect("index.jsp");

      }

      %>
    
    
      
      	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
      
</body>
</html>