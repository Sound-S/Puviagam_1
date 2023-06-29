
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.time.LocalDate" %>
     <%@page import="java.sql.*"%>
    <%@page import="java.util.*"%>
    <%@page import="All_Codes.JDBC"%>
    <% String sucess=null; %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Supervisor_resource</title>

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
<%
// for resourse attednance
try{
  String Date=request.getParameter("date");
  String Site_Id=request.getParameter("Site_Id");
  int male=Integer.parseInt(request.getParameter("male"));
  int female=Integer.parseInt(request.getParameter("female"));      	
  
  if(Site_Id!=null)
  {
 int result= JDBC.Resourse_Entry(Site_Id,Date,male,female);
 
 if(result==1)
 {
	 sucess =Site_Id+"  Entered Successfully";
	  System.out.println("enter sucess");
 }
 else
 {
	 sucess ="enter not sucess";
	 System.out.println("enter not sucess");
 }
  }
}
catch(Exception e)
{
	e.printStackTrace();
}
%>

<div class="container dis_back bg-white mb-4 ">
    
    <!-- Login Heading -->
    <div class="container d-flex justify-content-center Login_title">
        <h4>Attendance</h4>
        </div>
       
    <form action="Supervisor_Resource.jsp" method="post">
    
    <div class="text-success h4"><% if(sucess!=null){String su=sucess;out.println(su);} %></div>
    
            <!-- Date input -->
        <div class="form-outline mb-4">
        <label class="form-label" for="form2Example1">Date</label>
          <input type="text" id="form2Example1" class="form-control" name="date" value="<% LocalDate myObj = LocalDate.now(); // Create a date object
        		    out.println(myObj); // Display the current date %>" readonly required/>
          
        </div>
    
     <!-- Site Id input -->
     <div class="form-outline mb-4">
        <label class="form-label " for="form2Example1" >Site Id</label>
           <select   class="form-select "  name="Site_Id"   aria-label="Default select example"  id="selectColor" required>
             <option selected>Select Site Id</option>
             
             <% try
             {
            	 String Supervisor_id = (String)session.getAttribute("Employee_id");
            	 ArrayList<String> customer=JDBC.Get_Site_id(Supervisor_id);
             
        		
        		for(int j=0;j<customer.size();j++)
        		{
        		
        	 %>
             <option  value="<%= customer.get(j)%>"><%= customer.get(j)%></option>

             <%} 
        		}
             catch(Exception e)
             {
            	 e.printStackTrace();
             }
             %>
             
            </select>
            
          </div>
    
        

      
        <!-- Male input -->
        <div class="form-outline mb-4">
         <label class="form-label" for="form2Example2">Male</label>
          <input type="number"  class="form-control" id="myInput" name="male" placeholder="No of males" required/>
          </div>
          
          
              <!-- Female input -->
        <div class="form-outline mb-4">
         <label class="form-label" for="form2Example2">Female</label>
          <input type="number"  class="form-control" id="myInput" name="female" placeholder="No of females" required/>
          </div>
          
          
           
      
      
      
         
      
        <!-- Submit button -->
        <div class="container d-flex justify-content-center">
        <input type="submit" value="Submit" class="btn btn-secondary btn-block mb-4 buttonw">
        
        </div>
      </form>
      <div class="container d-flex justify-content-center">
               
			  <a class="btn btn-secondary btn-block mb-4 buttonw" href="Show_Supervisor_Resource.jsp" role="button">Attendance Details</a>
			 
		</div>
    </div>


<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1

response.setHeader("pragma", "no-cache"); //HTTP 1.0

response.setHeader("Expires", "0"); //proxies


if (session.getAttribute("Email") == null)

{

	response.sendRedirect("index.jsp");

}
out.println(session.getAttribute("Employee_id"));
%>

</body>
</html>