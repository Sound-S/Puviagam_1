<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.time.LocalDate" %>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="All_Codes.JDBC"%>

<%String customerid1=null; 
 String lead=null;
%>
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
	
<title>Insert title here</title>
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
       
       <div class="container bg-white mb-4 pt-3 w-50"  style="margin-top:100px ; border-radius:8px;box-shadow: 0 19px 38px rgba(0,0,0,0.30), 0 15px 12px rgba(0,0,0,0.22);">
       
<form action="Show_Payment_Details.jsp" method="post"> 
 <div class="row ms-5" >
    <div class="col">
            <!-- Site Id input -->
     <div class="form-outline mb-4">
        <label class="form-label " for="form2Example1" >Customer Id</label>
           <select   class="form-select "  name="customer_id"   aria-label="Default select example"  id="selectColor" required>
             <option selected>--Select Customer Id--</option>
             
             <% try
             {
            	 
            	 ArrayList<String> customer_id=JDBC.Get_Customer_id();
             
        		int k;
        		for(int j=0;j<customer_id.size();j++)
        		{
        		k=j++;
        	 %>
           <option  value="<%= customer_id.get(k)%>" ><%= customer_id.get(k)%>(<%= customer_id.get(k+1)%>)</option>
           
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
    
    <!-- Submit button -->
        <div class="form-outline mb-4 w-50" style="margin-top:7px;">
        <label class="form-label " for="form2Example1" >            </label>
        <input type="submit" value="View" class=" form-control btn btn-primary btn-block " id="form2Example1">
        
        </div>
    </div>
  </div>
</form>
</div>

<div class="container-fluid table-responsive-lg" id="showcustomerdetails">
<table class="table bg-white " id="dtBasicExample">
<tr class="bg-success text-white">
<th style="width:5%"><b>Customer ID</b></th>
<th style="width:5%"><b>Transaction Date</b></th>
<th style="width:5%"><b>Transaction Time</b></th>
<th style="width:8%"><b>Transaction Mode</b></th>
<th style="width:8%"><b>Amount Paid</b></th>
<th style="width:8%"><b>Balance Amount</b></th>
<th style="width:8%"><b>Payment Details</b></th>
</tr>

<%

try
{
	String customer_id = request.getParameter("customer_id");

//JDBC Connections
Class.forName("com.mysql.cj.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/puviagam";
String username = "root";
String pword = "12345";
Connection con = DriverManager.getConnection(url,username,pword);

String query = "SELECT customer_id, date_format(transaction_date,'%d-%m-%Y'), time_format(transaction_time,'%h:%i:%p'), transaction_mode, FORMAT(amount_paid, 1, 'en_IN'), FORMAT(balance_amount, 1, 'en_IN'),Payment_Remarks from payment_details where customer_id=?";
PreparedStatement ps = con.prepareStatement(query);
ps.setString(1, customer_id);

ResultSet rs = ps.executeQuery();

int i = 0;
String k;
while(rs.next())
{
	
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
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
 
</body>
</html>