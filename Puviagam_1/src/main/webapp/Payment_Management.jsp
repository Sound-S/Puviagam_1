<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="java.sql.*"%>
    <%@page import="java.util.*"%>
    <%@page import="All_Codes.JDBC"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cost Management</title>

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

<div class="container dis_back bg-white mb-4 " style="box-shadow: 0 19px 38px rgba(0,0,0,0.30), 0 15px 12px rgba(0,0,0,0.22);">
    
    <!-- PAyment Heading -->
    <div class="container d-flex justify-content-center Login_title">
        <h4 class="text-primary">Payment</h4>
        </div>
        
        <div class="container">
				<h6 class="text-success"><% String s=(String)request.getAttribute("Update_Sucess");if(s!=null){String Su =s;out.println(Su);} %></h6>
				<h6 class="text-danger">${pass_sucess_msg }</h6>
			</div>
       
    <form action="Payment_Process.jsp" method="post">
    
           <!-- customer Id input -->
     <div class="form-outline mb-4">
        <label class="form-label " for="form2Example1" >Customer Id<span style="color:red;font-size: 18px;">*</span></label>
           <select   class="form-select "  name="Customer_Id"       required>
            
              
             <option value="${Customer_Id}" Selected>--Select Customer Id-- ${Customer_Id}</option>
             
             <% try
             {
            	 ArrayList<String> customer=JDBC.Get_Customer_id();
             
        		int k;
        		for(int j=0;j<customer.size();j++)
        		{
        			k=j++;
        		
        	 %>
             <option  value="<%= customer.get(k)%>"><%= customer.get(k)%>(<%= customer.get(k+1)%>)</option>

             <%} 
        		}
             catch(Exception e)
             {
            	 e.printStackTrace();
             }
             %>
             
            </select>
            
          </div>
          
       <!-- Select pay amount --> 
        <div class="form-outline mb-4">
          <label class="form-label" for="form2Example1">Payment Mode<span style="color:red;font-size: 18px;">*</span></label>
          <select class="form-select" aria-label="Default select example" name="Payment_Mode" required>
             
             <option value="${Payment_Mode}" Selected>--Select-- ${Payment_Mode} </option>
             
             <option value="Cheque">Cheque</option>
             <option value="Card">Card</option>
             <option value="UPI">UPI</option>
             <option value="Cash">Cash</option>
            </select>
      </div>
      
      
       <!--Amount paid input -->
        <div class="form-outline mb-4">
         <label class="form-label" for="form2Example2">Payment Details<span style="color:red;font-size: 18px;">*</span></label>
          <input type="text"  class="form-control" id="myInput" value="${Payment_Details}" name="Payment_Details" placeholder="Enter Payment Details" required/>
          </div>
      
      
        <!--Amount paid input -->
        <div class="form-outline mb-4">
         <label class="form-label" for="form2Example2">Paid Amount<span style="color:red;font-size: 18px;">*</span></label>
          <input type="number"  class="form-control" id="myInput" value="${Paid_Amount}" name="Paid_Amount" placeholder="Enter Amount" required/>
          </div>
      
     
  
     
      
        <!-- Submit button -->
        <div class="container d-flex justify-content-center">
        <input type="submit" value="Update" class="btn btn-primary btn-block mb-4 buttonw">
        
        </div>
      </form>
      <!-- <div class="container d-flex justify-content-center">
               
			  <a class="btn btn-secondary btn-block mb-4 buttonw" href="Show_Payment_Details.jsp" role="button">Payment Details</a>
			 
		</div> -->
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>




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