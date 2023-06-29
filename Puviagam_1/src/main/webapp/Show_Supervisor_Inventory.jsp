<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.time.LocalDate" %>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="All_Codes.JDBC"%>
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
<style type="text/css">
    .avatar {
  vertical-align: middle;
  width: 25px;
  height: 25px;
  border-radius: 50%;
}
    </style>	
<title></title>
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

<div class="container bg-white mb-4 pt-3"  style="margin-top:100px ; border-radius:8px;box-shadow: 0 19px 38px rgba(0,0,0,0.30), 0 15px 12px rgba(0,0,0,0.22);">
<form action="Show_Supervisor_Inventory.jsp" method="post"> 
 <div class="row">
    <div class="col">
            <!-- Site Id input -->
     <div class="form-outline mb-4">
        <label class="form-label " for="form2Example1" >Site Id</label>
           <select   class="form-select "  name="site_id"   aria-label="Default select example"  id="selectColor" required>
             <option selected>Select Site Id</option>
             
             <% try
             {
            	 String Supervisor_id = (String)session.getAttribute("Employee_id");
            	 ArrayList<String> Supervisor_Site_id=JDBC.Get_Site_id(Supervisor_id);
             
        		
        		for(int j=0;j<Supervisor_Site_id.size();j++)
        		{
        		
        	 %>
             <option  value="<%= Supervisor_Site_id.get(j)%>"><%= Supervisor_Site_id.get(j)%></option>

             <%} 
        		}
             catch(Exception e)
             {
            	 e.printStackTrace();
             }
             %>
             
            </select>
            
          </div>
    </div>
    <div class="col">
    
     <!-- from_date -->
        <div class="form-outline mb-4">
            <label class="form-label " for="form2Example1" >From Date </label>
            <input type="date" class="form-control" id="form2Example1" name="from_date"  required>
        </div>
    
    </div>
    <div class="col">
    
    <!-- to_date -->
        <div class="form-outline mb-4">
            <label class="form-label " for="form2Example1" >To Date </label>
            <input type="date" class="form-control" id="form2Example1" name="to_date"  required>
        </div>
    </div>
    <div class="col">
    
    <!-- Submit button -->
        <div class="form-outline mb-4" style="margin-top:7px;">
        <label class="form-label " for="form2Example1" >            </label>
        <input type="submit" value="View" class=" form-control btn btn-primary btn-block " id="form2Example1">
        
        </div>
    </div>
  </div>
</form>
</div>

<div class="container-fluid table-responsive-lg" id="showcustomerdetails">
<table class="table bg-white text-nowrap" id="dtBasicExample">
<tr class="bg-success text-white">
<th style="width:5%"><b>Site Number</b></th>
<th style="width:5%"><b>Inventory Entry Date</b></th>
<th style="width:5%"><b>Inventory Entry Time</b></th>
<th style="width:8%"><b>Available Sand Qty</b></th>
<th style="width:8%"><b>Available Cement Qty</b></th>
<th style="width:8%"><b>Available Steel Qty</b></th>
<th style="width:8%"><b>Available Aggregate Qty</b></th>
</tr>

<%

try
{

String from_date = request.getParameter("from_date");
String to_date = request.getParameter("to_date");

String site_id = request.getParameter("site_id");

//JDBC Connections
Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/puviagam";
String username = "root";
String pword = "12345";
Connection con = DriverManager.getConnection(url,username,pword);

String query = "SELECT Site_no,date_format(inventory_entry_date,'%d-%m-%Y'),time_format(inventory_entry_time,'%h:%i:%p'),available_sand_Qty,available_cement_qty,available_steel_qty,available_aggregate_qty from Inventory WHERE inventory_entry_date BETWEEN ? and ? and Site_no=?";
PreparedStatement ps = con.prepareStatement(query);
ps.setString(1, from_date);
ps.setString(2, to_date);
ps.setString(3, site_id);

ResultSet rs = ps.executeQuery();

int i = 0;
while(rs.next())
{
	i++;
%>

<tr>
<td>  <%=rs.getString(1) %> </td>
<td>  <%=rs.getString(2) %> </td>
<td>  <%=rs.getString(3) %> </td>
<td>  <%=rs.getString(4) %> </td>
<td>  <%=rs.getString(5) %> </td>
<td>  <%=rs.getString(6) %> </td>
<td>  <%=rs.getString(7) %> </td>
</tr>


<% 
}
%>

</table>

<%
con.close();
} 
catch (Exception e) 
{
e.printStackTrace();
}
%>




</div>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1

response.setHeader("pragma", "no-cache"); //HTTP 1.0

response.setHeader("Expires", "0"); //proxies


if (session.getAttribute("Email") == null)

{

	response.sendRedirect("index.jsp");

}

%>


</body>
</html>