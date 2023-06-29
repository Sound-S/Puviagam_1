
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@page import="java.sql.*"%>
    <%@page import="java.util.*"%>
    <%@page import="All_Codes.JDBC"%>
    
    <%@page import="java.text.NumberFormat"%>
    
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon"
	href="https://res.cloudinary.com/dsedsmqrs/image/upload/v1686139634/1686139290681_zzxygi.png">
<title>Customer Master</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
	
	<link rel="icon"
	href="https://res.cloudinary.com/dsedsmqrs/image/upload/v1686139634/1686139290681_zzxygi.png">

<link rel="stylesheet" href="index.css">
<style type="text/css">
    .avatar {
  vertical-align: middle;
  width: 25px;
  height: 25px;
  border-radius: 50%;
}
table, th, td {
	/*border: 1px solid black;*/
	border-collapse: collapse;
	text-align: center;
}

#site_status_table 
{
border: 1px solid black;
border-collapse: collapse;
	text-align: center;
}
    </style>
</head>
<body >

<!--navbar start-->
    <header>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">

            <div class="container">
                  <a href="" class="navbar-brand"><img
					src="https://res.cloudinary.com/dsedsmqrs/image/upload/v1685905487/1685905387595_t6z2ge.png"
					class="img-fluid" alt="company logo"
					style="height: 40px; width: 180px;"> </a>

                     <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#Mynavbar" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                      <span class="navbar-toggler-icon"></span>
                     </button>
 
            <div class="collapse navbar-collapse" id="Mynavbar">

                <ul class="navbar-nav ms-auto">
                   <li class="nav-item"> 
                    <a href="#" class="nav-link  text-white">Home</a>
                   </li>

                   		<li class="nav-item">
							<div class="dropdown">
								<button class="btn btn-dark dropdown-toggle" type="button"
									data-bs-toggle="dropdown" aria-expanded="false">
									<img src="https://www.w3schools.com/w3images/avatar6.png" alt="Avatar" class="avatar" >   <%out.println(session.getAttribute("Customer_Name")); %>
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

    <%@page import="java.sql.DriverManager"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page import="java.sql.Statement"%>
	<%@page import="java.sql.Connection"%>
	<%@page import="java.sql.PreparedStatement"%>
	<%
	//String sno = request.getParameter("Sno");
	String driverName = "com.mysql.cj.jdbc.Driver";
	String connectionUrl = "jdbc:mysql://localhost:3306/";
	String dbName = "puviagam";
	String userId = "root";
	String password = "12345";
	String Email = (String)request.getSession().getAttribute("Email");
	
	

	try 
	{
		Class.forName(driverName);
	} 
	catch (ClassNotFoundException e) 
	{
		e.printStackTrace();
	}

	Connection connection = null;
	//Statement statement = null;
	//PreparedStatement ps=null;
	ResultSet resultSet = null;
	%>
	
	
	
	<div class="container w-50 table-responsive " style="padding-top:50px" >
	
	<table class="table table-borderless mt-5 rounded-3 "  style="background-color:#ffd449;box-shadow: rgba(14, 30, 37, 0.12) 0px 2px 4px 0px, rgba(14, 30, 37, 0.32) 0px 2px 16px 0px;">
	<tr>
	<td > Total Estimated Amount</td>
	<td class="text-dark">  <% out.println((String)session.getAttribute("Customer_estimated_amount")); %>     </td>
	
	</tr>
	
	<tr>
	<td> Total Paid Amount </td>
	<td class="text-success">  <% float Total_paid_amt=JDBC.Getting_Total_paid_Amt((String)session.getAttribute("Customer_id")); 
	                               Locale lcl = new Locale("hi","IN");
	                               NumberFormat inFrmt = NumberFormat.getNumberInstance(lcl);
	                               
	                               out.println(inFrmt.format(Total_paid_amt)); 
	                           %> </td>
	
	</tr>
	
	<tr>
	<td > Balance Amount </td>
	<td class="text-danger">  <% String Balance_amt=JDBC.Getting_Balance_Amt((String)session.getAttribute("Customer_id")); out.println(Balance_amt);%>   </td>
	
	</tr>
	
	</table>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
    <div class="container mt-3">
	<h4 align="center" class="text-black">
		Site Status
	</h4>
	</div>

	<div class="container table-responsive-lg" id="showcustomerdetails">

		<%
		try 
		{
			connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
			
			String sql = "Select * from customer where customer_email_id=?";
			PreparedStatement ps=connection.prepareStatement(sql);
			ps.setString(1, Email);
			
			resultSet = ps.executeQuery();
			while (resultSet.next()) 
			{
				//price_date = resultSet.getString(2);
		%>
		

		<table class="table table-hover" id="site_status_table" style="background-color:#bfd8bd;">
		
		<tr bgcolor="black" class="text-white">
				<td style="width: 5%"><b></b></td>
				<td style="width: 5%;"><b><%=resultSet.getString(10)%></b></td>
				<td style="width: 5%"><b></b></td>
			</tr>
		
		
		

			<tr bgcolor="black" class="text-white">
				<td style="width: 5%"><b>Phases</b></td>
				<td style="width: 5%"><b>Remarks</b></td>
				<td style="width: 5%"><b>Status</b></td>
			</tr>

			<tr>
				<td>Phase 1 - Basement </td>
				<td><%=resultSet.getString(19)%></td>
				<td><%=resultSet.getString(18)%></td>
			</tr>

			<tr>
				<td >Phase 2 - Pillar</td>
				<td><%=resultSet.getString(21)%></td>
				<td><%=resultSet.getString(20)%></td>
			</tr>

			<tr>
				<td >Phase 3 - Wall</td>
				<td><%=resultSet.getString(23)%></td>
				<td><%=resultSet.getString(22)%></td>
			</tr>

			<tr>
				<td>Phase 4 - Top Roof</td>
				<td><%=resultSet.getString(25)%></td>
				<td><%=resultSet.getString(24)%></td>
			</tr>

			<tr>
				<td>Phase 5 - Electrical Works</td>
				<td><%=resultSet.getString(27)%></td>
				<td><%=resultSet.getString(26)%></td>
			</tr>
			
			<tr>
				<td>Phase 6 - Plumbing Works</td>
				<td><%=resultSet.getString(29)%></td>
				<td><%=resultSet.getString(28)%></td>
			</tr>

			<tr>
				<td>Phase 7 - Painting</td>
				<td><%=resultSet.getString(31)%></td>
				<td><%=resultSet.getString(30)%></td>
			</tr>
			
			<tr>
				<td>Phase 8 - Flooring Works</td>
				<td><%=resultSet.getString(33)%></td>
				<td><%=resultSet.getString(32)%></td>
			</tr>
			
			
			
			
			
			
		</table>
         

			

		<%
		}
		%>

		<%
		connection.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>

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