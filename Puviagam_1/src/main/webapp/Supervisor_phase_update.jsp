<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>



<%@page import="java.sql.DriverManager"%>

<%@page import="java.sql.ResultSet"%>

<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.Connection"%>



<%

String Site_id = request.getParameter("Site_id");

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

String sql ="select * from customer where project_site_number=?";

ps=connection.prepareStatement(sql);
ps.setString(1, Site_id);


System.out.println(Site_id);

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



			

  <div class="container dis_back2 mb-4 bg-white">
        <h4>Customer Update</h4>
     <form action="Supervisor_phase_update_prc.jsp" method="post">
     
      <input type="hidden" name="Site_id" value="<%=resultSet.getString(10) %>">
     
        	 <!-- Site Incharge-->
        <div class="form-outline mb-4">
          <label class="form-label" for="form2Example1" >Site Id</label>
          <input type="text" id="form2Example1" class="form-control" name="Site_Incharge" value="<%=resultSet.getString(10) %> " required readonly/>
        </div>	
     
     
     
     
        <!-- customer_name input -->
      
         <div class="form-outline mb-4">
          <label class="form-label" for="form2Example1">Phase 1 - Basement</label>
          <select class="form-select" aria-label="Default select example" name="Phase_1" required>
           <option value="<%=resultSet.getString(18)%>"><%=resultSet.getString(18)%></option>
            <option> Select </option>
            <option value="Yet_to_Started">Yet to Started</option>
             <option value="Processing">Processing</option>
             <option value="Completed">Completed</option>
             
            </select>
            </div>
        
        <!-- Phase Remarks -->
        <div class="form-outline mb-4">
           <label class="form-label" for="form2Example1" >Phase 1 Remarks</label>
          <input type="text" id="form2Example1" class="form-control" name="Phase_1_remarks" placeholder="Enter Customer name" value="<%=resultSet.getString(19)%>" required/>
         
        </div>
        
        <!-- customer_name input -->
          <div class="form-outline mb-4">
          <label class="form-label" for="form2Example1">Phase 2 - Pillar</label>
          <select class="form-select" aria-label="Default select example" name="Phase_2" required>
             <option value="<%=resultSet.getString(20)%>"><%=resultSet.getString(20)%></option>
             <option>Select</option>
             <option value="Yet_to_Started">Yet to Started</option>
             <option value="Processing">Processing</option>
             <option value="Completed">Completed</option>
             
            </select>
            </div>
        
        <!-- Phase Remarks -->
        <div class="form-outline mb-4">
           <label class="form-label" for="form2Example1" >Phase 2 Remarks</label>
          <input type="text" id="form2Example1" class="form-control" name="Phase_2_remarks" placeholder="Enter Customer name" value="<%=resultSet.getString(21)%>" required/>
         
        </div>
        
        <!-- customer_name input -->
         <div class="form-outline mb-4">
          <label class="form-label" for="form2Example1">Phase 3 - Wall</label>
          <select class="form-select" aria-label="Default select example" name="Phase_3"  required>
             <option value="<%=resultSet.getString(22)%>"><%=resultSet.getString(22)%></option>
             <option>Select</option>
             <option value="Yet_to_Started">Yet to Started</option>
             <option value="Processing">Processing</option>
             <option value="Completed">Completed</option>
             
            </select>
            </div>
        
        <!-- Phase Remarks -->
        <div class="form-outline mb-4">
           <label class="form-label" for="form2Example1" >Phase 3 Remarks</label>
          <input type="text" id="form2Example1" class="form-control" name="Phase_3_remarks" placeholder="Enter Customer name" value="<%=resultSet.getString(23)%>" required/>
         
        </div>
        
        <!-- customer_name input -->
             <div class="form-outline mb-4">
          <label class="form-label" for="form2Example1">Phase 4 - Top Roof</label>
          <select class="form-select" aria-label="Default select example" name="Phase_4" required>
             <option value="<%=resultSet.getString(24)%>"><%=resultSet.getString(24)%></option>
             <option>Select</option>
             <option value="Yet_to_Started">Yet to Started</option>
             <option value="Processing">Processing</option>
             <option value="Completed">Completed</option>
             
            </select>
            </div>
        
        <!-- Phase Remarks -->
        <div class="form-outline mb-4">
           <label class="form-label" for="form2Example1" >Phase 4 Remarks</label>
          <input type="text" id="form2Example1" class="form-control" name="Phase_4_remarks" placeholder="Enter Customer name" value="<%=resultSet.getString(25)%>" required/>
         
        </div>
        
        <!-- customer_name input -->
        <div class="form-outline mb-4">
          <label class="form-label" for="form2Example1">Phase 5 - Electrical Works</label>
          <select class="form-select" aria-label="Default select example" name="Phase_5" required>
             <option value="<%=resultSet.getString(26)%>"><%=resultSet.getString(26)%></option>
             <option>Select</option>
             <option value="Yet_to_Started">Yet to Started</option>
             <option value="Processing">Processing</option>
             <option value="Completed">Completed</option>
             
            </select>
            </div>
        
        <!-- Phase Remarks -->
        <div class="form-outline mb-4">
           <label class="form-label" for="form2Example1" >Phase 5 Remarks</label>
          <input type="text" id="form2Example1" class="form-control" name="Phase_5_remarks" placeholder="Enter Customer name" value="<%=resultSet.getString(27)%>" required/>
         
        </div>
        
        <!-- customer_name input -->
           <div class="form-outline mb-4">
          <label class="form-label" for="form2Example1">Phase 6 - Plumbing Works</label>
          <select class="form-select" aria-label="Default select example" name="Phase_6" required>
             <option value="<%=resultSet.getString(28)%>"><%=resultSet.getString(28)%></option>
             <option>Select</option>
             <option value="Yet_to_Started">Yet to Started</option>
             <option value="Processing">Processing</option>
             <option value="Completed">Completed</option>
             
            </select>
            </div>
        
        <!-- Phase Remarks -->
        <div class="form-outline mb-4">
           <label class="form-label" for="form2Example1" >Phase 6 Remarks</label>
          <input type="text" id="form2Example1" class="form-control" name="Phase_6_remarks" placeholder="Enter Customer name" value="<%=resultSet.getString(29)%>" required/>
         
        </div>
        
        <!-- customer_name input -->
     
           <div class="form-outline mb-4">
          <label class="form-label" for="form2Example1">Phase 7 - Painting</label>
          <select class="form-select" aria-label="Default select example" name="Phase_7" required>
             <option value="<%=resultSet.getString(30)%>"><%=resultSet.getString(30)%></option>
             <option>Select</option>
             <option value="Yet_to_Started">Yet to Started</option>
             <option value="Processing">Processing</option>
             <option value="Completed">Completed</option>
             
            </select>
            </div>
        
        <!-- Phase Remarks -->
        <div class="form-outline mb-4">
           <label class="form-label" for="form2Example1" >Phase 7 Remarks</label>
          <input type="text" id="form2Example1" class="form-control" name="Phase_7_remarks" placeholder="Enter Customer name" value="<%=resultSet.getString(31)%>" required/>
         
        </div>
       
        <!-- customer_name input -->
          <div class="form-outline mb-4">
          <label class="form-label" for="form2Example1">Phase 8 - Flooring Works</label>
          <select class="form-select" aria-label="Default select example" name="Phase_8" required>
             <option value="<%=resultSet.getString(32)%>"><%=resultSet.getString(32)%></option>
             <option>Select</option>
             <option value="Yet_to_Started">Yet to Started</option>
             <option value="Processing">Processing</option>
             <option value="Completed">Completed</option>
             
            </select>
            </div>
        
        
        <!-- Phase Remarks -->
        <div class="form-outline mb-4">
           <label class="form-label" for="form2Example1" >Phase 8 Remarks</label>
          <input type="text" id="form2Example1" class="form-control" name="Phase_8_remarks" placeholder="Enter Customer name" value="<%=resultSet.getString(33)%>" required/>
         
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

