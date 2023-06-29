<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Finding Estimation</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

    <link rel="stylesheet" href="index.css">
    
    <link rel="icon"
	href="https://res.cloudinary.com/dsedsmqrs/image/upload/v1686139634/1686139290681_zzxygi.png">
	
    

          
<!-- date -->
           <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
           <link rel="stylesheet" href="https://cdn.datatables.net/datetime/1.4.1/css/dataTables.dateTime.min.css">

           <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/dataTables.bootstrap5.min.css">
           
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.2.0/css/bootstrap.min.css">

<link rel="stylesheet" href="https://cdn.datatables.net/fixedcolumns/4.2.2/css/fixedColumns.dataTables.min.css">

<style>
table, th, td 
{
  
  border-collapse: collapse;
  text-align:center;
  font-size:14px;
}

tfoot input {
        width: 100%;
        padding: 3px;
        box-sizing: border-box;
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

<h2 align="center"><font><strong>Estimation Details</strong></font></h2>


<!--navbar start-->

	<header>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" >

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

<script type="text/javascript" src="https://cdn.datatables.net/fixedcolumns/4.2.2/js/dataTables.fixedColumns.min.js"></script>

<script type="text/javascript" src="https://cdn.datatables.net/datetime/1.4.1/js/dataTables.dateTime.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.2/moment.min.js"></script>

  <script type="text/javascript">
  
 var minDate, maxDate;
  
  $.fn.dataTable.ext.search.push(
		    function( settings, data, dataIndex ) {
		        var min = minDate.val();
		        var max = maxDate.val();
		        var date = new Date( data[4] );
		 
		        if (
		            ( min === null && max === null ) ||
		            ( min === null && date <= max ) ||
		            ( min <= date   && max === null ) ||
		            ( min <= date   && date <= max )
		        ) {
		            return true;
		        }
		        return false;
		    }
		);
  

  
  $(document).ready(function () {
	  // Create date inputs
	    minDate = new DateTime($('#min'), {
	        format: 'MMMM Do YYYY'
	    });
	    maxDate = new DateTime($('#max'), {
	        format: 'MMMM Do YYYY'
	    });
	    
	  //individual search
	    $('#dtBasicExample tfoot td').each(function () {
	        var title = $(this).text();
	        $(this).html('<input type="text" placeholder="Search ' + title + '" />');
	    });
	    // DataTables initialisation
	 var table= $('#dtBasicExample').DataTable({
	        scrollY:        "65vh",
	        scrollX:        true,
	        scrollCollapse: true,
	        paging:         true,
	        
	        fixedColumns:   {
	            left: 1,
	            right: 1
	        },
	 
	
	 lengthMenu: [
         [5,10, 25, 50, -1],
         [5,10, 25, 50, 'All'],
     ],
     
     
     //individual search
     initComplete: function () {
         // Apply the search
         this.api()
             .columns()
             .every(function () {
                 var that = this;

                 $('input', this.footer()).on('keyup change clear', function () {
                     if (that.search() !== this.value) {
                         that.search(this.value).draw();
                     }
                 });
             });
           }
 
     
	     
	    });
	    
	 $('#min, #max').on('change', function () {
	        table.draw();
	    });
	  $('.dataTables_length').addClass('bs-select');
	 
	 
	  });
  
  
  
  
    </script>
    <div class="container-fluid mb-4">
    <table class="table table-borderless w-50">
        <tbody><tr>
            <td> Start Date: </td>
            <td><input type="text" id="min" name="min" class="form-control"></td>
            <td style="width:6%">              </td>
            <td> End Date: </td>
            <td><input type="text" id="max" name="max" class="form-control" ></td>
        </tr>
       
    </tbody></table>
     </div>
     
     

<table class="table bg-white stripe row-border order-column text-nowrap" id="dtBasicExample" style="width:100%">
 

<thead>
<tr class="text-white bg-success ">
<td style="width:5%" class="bg-success" > S.no </td>

<td style="width:5%">Name </td>

<td style="width:5%">Email </td>

<td style="width:5%">Mobile No </td>

<td style="width:5%">Date & Time </td>

<td style="width:5%">Measurement </td>

<td style="width:5%">No.of Rooms </td>
<td style="width:5%">No.of Washrooms </td>
<td style="width:5%">No.of Windows </td>

<td style="width:5%">Sand qty </td>
<td style="width:5%">Sand Amount </td>

<td style="width:5%">Cement qty </td>
<td style="width:5%">Cement Amount </td>

<td style="width:5%">Aggregate qty </td>
<td style="width:5%">Aggregate Amount </td>

<td style="width:5%">Brick qty </td>
<td style="width:5%">Brick Amount </td>

<td style="width:5%">Steel qty </td>
<td style="width:5%">Steel Amount </td>

<td style="width:5%">Outer Paint Area </td>
<td style="width:5%">Outer Paint Amount </td>

<td style="width:5%">Inner Paint qty </td>
<td style="width:5%">Inner Paint Amount </td>

<td style="width:5%">Basement Amount </td>

<td style="width:5%">Flooring (Sq.feet) </td>
<td style="width:5%">Flooring Amount </td>

<td style="width:5%">Electrical & Plumbing Amount </td>

<td style="width:5%"> Bathroom Materials Amount </td>

<td style="width:5%"> Bathroom Door Amount </td>

<td style="width:5%"> Main Door Amount </td>

<td style="width:5%"> Bedroom Door Amount </td>

<td style="width:5%"> Windows Cost </td>

<td style="width:5%"> Kitchen Granite Amount </td>

<td style="width:5%" class="bg-success"> Total Cost ₹ </td>
</tr>
</thead>
<tbody>
<%
try
{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
//String sql ="select * from temp_estimation";
//String sql ="select Sno,name,email_id,phone,date_format(date_of_estimation,'%d/%m/%Y %h:%i:%p'),area_measurement,sandQuantity,FORMAT(sandAmount, 1, 'en_IN'),cementQuantity,FORMAT(cementAmount, 1, 'en_IN'),brickQuantity,FORMAT(brickAmount, 1, 'en_IN'),steelQuantity,FORMAT(steelAmount, 1, 'en_IN'),outerpaintArea,FORMAT(outerPaintAmount, 1, 'en_IN'),innerpaintArea,FORMAT(innerPaintAmount, 1, 'en_IN'),FORMAT(basementAmount, 1, 'en_IN'),flooring,FORMAT(flooringAmount, 1, 'en_IN'),FORMAT(electrical_plumbingAmount, 1, 'en_IN'),FORMAT(bathroomMatreialsAmount, 1, 'en_IN'),FORMAT(bathroomDoorAmount, 1, 'en_IN'),FORMAT(mainDoorAmount, 1, 'en_IN'),FORMAT(bedRoomDoor_Amount, 1, 'en_IN'),FORMAT(windowsCost, 1, 'en_IN'),FORMAT(kitchenGraniteAmount, 1, 'en_IN'),FORMAT(totalCost, 1, 'en_IN'),AggregateQuantity,FORMAT(AggregateAmount, 1, 'en_IN'),No_of_bedrooms,No_of_washrooms,No_of_windows from temp_estimation";
String sql ="select Sno,name, email_id, phone, date_format(date_of_estimation,'%d-%m-%Y %h:%i:%p'), area_measurement, No_of_bedrooms, No_of_washrooms, No_of_windows, sandQuantity, FORMAT(sandAmount, 1, 'en_IN'), cementQuantity, FORMAT(cementAmount, 1, 'en_IN'), AggregateQuantity, FORMAT(AggregateAmount, 1, 'en_IN'), brickQuantity, FORMAT(brickAmount, 1, 'en_IN'), steelQuantity, FORMAT(steelAmount, 1, 'en_IN'), outerpaintArea, FORMAT(outerPaintAmount, 1, 'en_IN'), innerpaintArea, FORMAT(innerPaintAmount, 1, 'en_IN'), FORMAT(basementAmount, 1, 'en_IN'), flooring, FORMAT(flooringAmount, 1, 'en_IN'), FORMAT(electrical_plumbingAmount, 1, 'en_IN'), FORMAT(bathroomMatreialsAmount, 1, 'en_IN'), FORMAT(bathroomDoorAmount, 1, 'en_IN'), FORMAT(mainDoorAmount, 1, 'en_IN'), FORMAT(bedRoomDoor_Amount, 1, 'en_IN'), FORMAT(windowsCost, 1, 'en_IN'), FORMAT(kitchenGraniteAmount, 1, 'en_IN'), FORMAT(totalCost, 1, 'en_IN')  from temp_estimation";


resultSet = statement.executeQuery(sql);
while(resultSet.next())
{  
	
%>
<tr >
<td>  <%=resultSet.getInt(1) %>   </td>
<td>  <%=resultSet.getString(2) %>   </td>
<td>  <%=resultSet.getString(3) %>   </td>
<td>  <%=resultSet.getString(4) %>   </td>
<td>  <%=resultSet.getString(5) %>   </td>
<td>  <%=resultSet.getDouble(6) %>   </td>
<td>  <%=resultSet.getInt(7) %>   </td>
<td>  <%=resultSet.getInt(8) %>   </td>
<td>  <%=resultSet.getInt(9) %>   </td>
<td>  <%=resultSet.getDouble(10) %>   </td>
<td>  <%=resultSet.getString(11) %>   </td>
<td>  <%=resultSet.getString(12) %>   </td>
<td>  <%=resultSet.getString(13) %>   </td>
<td>  <%=resultSet.getString(14) %>   </td>
<td>  <%=resultSet.getString(15) %>   </td>
<td>  <%=resultSet.getString(16) %>   </td>
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
<td>  <%=resultSet.getString(34) %>   </td>


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

<tfoot>

<tr class="text-white bg-black ">
<td style="width:5%" class="bg-black" > Sno </td>

<td style="width:5%"> Name </td>

<td style="width:5%"> Email </td>

<td style="width:5%"> Mobile No </td>

<td style="width:5%"> Date & Time </td>

<td style="width:5%"> Measurement </td>

<td style="width:5%"> No.of Rooms </td>
<td style="width:5%"> No.of Washrooms </td>
<td style="width:5%"> No.of Windows </td>

<td style="width:5%"> Sand qty </td>
<td style="width:5%"> Sand Amount </td>

<td style="width:5%"> Cement qty </td>
<td style="width:5%"> Cement Amount </td>

<td style="width:5%"> Aggregate qty </td>
<td style="width:5%"> Aggregate Amount </td>

<td style="width:5%"> Brick qty </td>
<td style="width:5%"> Brick Amount </td>

<td style="width:5%"> Steel qty </td>
<td style="width:5%"> Steel Amount </td>

<td style="width:5%"> Outer Paint Area </td>
<td style="width:5%"> Outer Paint Amount </td>

<td style="width:5%"> Inner Paint qty </td>
<td style="width:5%"> Inner Paint Amount </td>

<td style="width:5%"> Basement Amount </td>

<td style="width:5%"> Flooring </td>
<td style="width:5%"> Flooring Amount </td>

<td style="width:5%"> Electrical & Plumbing Amount </td>

<td style="width:5%"> Bathroom Materials Amount </td>

<td style="width:5%"> Bathroom Door Amount </td>

<td style="width:5%"> Main Door Amount </td>

<td style="width:5%"> Bedroom Door Amount </td>

<td style="width:5%"> Windows Cost </td>

<td style="width:5%"> Kitchen Granite Amount </td>

<td style="width:5%" class="bg-black"> Total Cost ₹ </td>
</tr>
</tfoot>


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