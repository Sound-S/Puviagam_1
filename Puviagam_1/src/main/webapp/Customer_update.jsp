<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>



<%@page import="java.sql.DriverManager"%>

<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.Connection"%>

<%@page import="java.sql.*"%>
    <%@page import="java.util.*"%>
    <%@page import="All_Codes.JDBC"%>


<%

String customer_id = request.getParameter("id");

String driver = "com.mysql.cj.jdbc.Driver";

String connectionUrl = "jdbc:mysql://localhost:3306/";

String database = "puviagam";

String userid = "root";

String password = "12345";

try {

Class.forName(driver);

} catch (ClassNotFoundException e) {

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

String sql ="select * from customer where customer_id=?";

ps=connection.prepareStatement(sql);
ps.setString(1,customer_id);

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
    <title>Customer Update</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

    <link rel="stylesheet" href="index.css">
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



			

  <div class="container dis_back2 mb-4 bg-white">
        <h4>Customer Update</h4>
     <form action="Customer_update_prce.jsp" method="post">
     
      <input type="hidden" name="Customer_ID" value="<%=resultSet.getString(2) %>">
     
        	 <!-- Username input -->
        <div class="form-outline mb-4">
          <label class="form-label" for="form2Example1" >Customer ID</label>
          <input type="text" id="form2Example1" class="form-control" name="Cusrtomer_ID" value="<%=resultSet.getString(2) %> " required readonly/>
        </div>	
     
     
     
     
        <!-- customer_name input -->
        <div class="form-outline mb-4">
           <label class="form-label" for="form2Example1" >Customer Name</label>
          <input type="text" id="form2Example1" class="form-control" name="Customer_Name" placeholder="Enter Customer name" value="<%=resultSet.getString(3)%>" required/>
         
        </div>
      
        <!-- Email-id input -->
        <div class="form-outline mb-4">
          <label class="form-label" for="form2Example2" >Email Id</label>
          <input type="email" id="form2Example2" class="form-control"  name="Customer_Email"   value="<%=resultSet.getString(4)%>" required/>
          
        </div>

        
      
          
          <!-- Mobile number input -->
        <div class="form-outline mb-4">
            <label class="form-label " for="form2Example1" >Mobile number</label>
            <input type="text" class="form-control" id="form2Example1" name="Customer_Mobile_No"  value="<%=resultSet.getString(6)%>"required>
            
          </div>

		
		

			

		
			
				<!-- Adder details -->
        <div class="form-outline mb-4">
        <label class="form-label " for="form2Example1" >Residential Address</label>
          
            
            <input type="text" id="form2Example1" class="form-control" name="Customer_Address" value="<%=resultSet.getString(9)%>" >
          </div>
          
			
			<!-- Project site number -->
            <div class="form-outline mb-4">
            <label class="form-label " for="form2Example1" >Site Number</label>
            <input type="text" id="form2Example1" class="form-control" name="Project_Site_No" value="<%=resultSet.getString(10)%>" required readonly/>
           
          </div>
          
        <!--Location-->
        <div class="form-outline mb-4">
        <label class="form-label " for="form2Example1 " >Location</label>
            <input type="text" id="form2Example1" class="form-control" name="Site_Location" value="<%=resultSet.getString(11)%>" required/>
            
          </div>
          
          
              <!--Area -->
            <div class="form-outline mb-4">
            <label class="form-label " for="form2Example1" >Area</label>
            <input type="text" id="form2Example1" class="form-control" name="Site_Area" value="<%=resultSet.getString(12)%>"required/>
            
             </div>
          
          
                <!--District -->
        <div class="form-outline mb-4">
        <label class="form-label " for="form2Example1" >District</label>
           <select class="form-select" aria-label="Default select example" name="Site_District" required>
             <option  value="<%=resultSet.getString(13) %>"><%=resultSet.getString(13)%></option>
             <option value="Ariyalur">Ariyalur</option>
             <option value="Chengalpattu">Chengalpattu</option>
             <option value="Chennai">Chennai</option>
             <option value="Coimbatore">Coimbatore</option>
             <option value="Cuddalore">Cuddalore</option>
             <option value="Dharmapuri">Dharmapuri</option>
  			 <option value="Dindigul">Dindigul</option>
             <option value="Erode">Erode</option>
             <option value="Kallakurichi">Kallakurichi</option>
             <option value="Kancheepuram">Kancheepuram</option>
             <option value="Karur">Karur</option>
             <option value="Krishnagiri">Krishnagiri</option>
             <option value="Madurai">Madurai</option>
             <option value="Mayiladuthurai">Mayiladuthurai</option>
             <option value="Nagapattinam">Nagapattinam</option>
  			 <option value="Kanniyakumari">Kanniyakumari</option>
             <option value="Namakkal">Namakkal</option>
             <option value="Perambalur">Perambalur</option>
             
             <option value="Pudukottai">Pudukottai</option>
             <option value="Ramanathapuram">Ramanathapuram</option>
  			 <option value="Ranipet">Ranipet</option>
             <option value="Salem">Salem</option>
             <option value="Sivagangai">Sivagangai</option>
             <option value="Kancheepuram">Kancheepuram</option>
             <option value="Tenkasi">Tenkasi</option>
             <option value="Thanjavur">Thanjavur</option>
             <option value="Theni">Theni</option>
             <option value="Thiruvallur">Thiruvallur</option>
             <option value="Thiruvarur">Thiruvarur</option>
  			 <option value="Thoothukudi">Thoothukudi</option>
             <option value="Trichirappalli">Trichirappalli</option>
             <option value="Thirunelveli">Thirunelveli</option>
             
             <option value="Tirupathur">Tirupathur</option>
             <option value="Tiruppur">Tiruppur</option>
             <option value="Tiruvannamalai">Tiruvannamalai</option>
             <option value="The Nilgiris">The Nilgiris</option>
             <option value="Vellore">Vellore</option>
  			 <option value="Viluppuram">Viluppuram</option>
             <option value="Virudhunagar">Virudhunagar</option>
             
             
            </select>
            
          </div>
          
          <!--State -->
        <div class="form-outline mb-4">
        <label class="form-label " for="form2Example1" >State</label>
            <input type="text" id="form2Example1" class="form-control" name="Site_State" value="<%=resultSet.getString(14)%>" required/>
            
          </div>
    
          
               <!--Pincode -->
        <div class="form-outline mb-4">
        <label class="form-label " for="form2Example1" >Pincode</label>
            <input type="text" id="form2Example1" class="form-control" name="Site_Pincode" value="<%=resultSet.getString(15)%>" required/>
            
          </div>
          
                <!--Site Details-->
        <div class="form-outline mb-4">
        <label class="form-label " for="form2Example1" >Site Details</label>
           <input type="text" id="form2Example1" class="form-control" name="Site_Details"  value="<%=resultSet.getString(16)%>" required/> 
          
            
          </div>
          
          
                <!--Estimation ammount-->
        <div class="form-outline mb-4">
        <label class="form-label " for="form2Example1" >Site Details</label>
           <input type="number" id="form2Example1" class="form-control" name="estimation_amount"  value="<%=resultSet.getString(34)%>" required/> 
          
            
          </div>
  
          <div class="form-outline mb-4">
        <label class="form-label " for="form2Example1" >Site Incharge</label>
           <select   class="form-select "  name="Site_Incharge"   aria-label="Default select example"  id="selectColor" required>
             <option selected>Select Site Incharge</option>
             <option selected><%=resultSet.getString(17)%></option>
             <% try
             {
            	 ArrayList<String> list=JDBC.Get_Site_Supervisor_id();
             
        		
        		for(int i=0;i<list.size();i++)
        		{
        		
        	 %>
             <option  value="<%= list.get(i)%>"><%= list.get(i)%></option>

             <%} 
        		}
             catch(Exception e)
             {
            	 e.printStackTrace();
             }
             %>
             
            </select>
            
          </div>
        
          




		
          
          
        
        
          
      
      
        <!-- Submit button -->
        <div class="container d-flex justify-content-center">
        <!-- <button type="button" class="btn btn-primary btn-block mb-4 buttonw">Register</button>-->
        <input type="submit" value="Update" class="btn btn-primary btn-block mb-4 buttonw">
    </div>
     
    

      </form>
    </div>

<%

}

connection.close();

} 

catch (Exception e) 

{

e.printStackTrace();

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

