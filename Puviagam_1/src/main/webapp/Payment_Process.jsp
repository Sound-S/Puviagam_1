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
<title>Insert title here</title>
</head>
<body>

<%

String Customer_Id =request.getParameter("Customer_Id");
String Payment_Mode =request.getParameter("Payment_Mode");
Double Paid_Amount =Double.parseDouble(request.getParameter("Paid_Amount"));
String Payment_Details =request.getParameter("Payment_Details");

Class.forName("com.mysql.cj.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/puviagam";
String user="root";
String password="12345";
Connection con =DriverManager.getConnection(url,user,password);
String query="select * from payment_details where transaction_date=(select max(transaction_date) from payment_details )and customer_id=?";

PreparedStatement ps = con.prepareStatement(query);
ps.setString(1, Customer_Id);
ResultSet rs = ps.executeQuery();


//getting the balace from db
double totalAmount=0;
double balance =0;
double paidAmount=totalAmount-balance;

while(rs.next())
{   
	balance=rs.getFloat(6);
  balance = balance - Paid_Amount;
  System.out.println("balance "  + balance);
}

//updating into db 
ps = con.prepareStatement("insert into payment_details values(?,now(),current_time(),?,?,?,?)");
ps.setString(1, Customer_Id);
ps.setString(2,Payment_Mode);
ps.setDouble(3,Paid_Amount);
ps.setDouble(4,balance);
ps.setString(5, Payment_Details);


int i= ps.executeUpdate();
if(i>0){
	
	request.setAttribute("Customer_Id"," is"+Customer_Id );
	request.setAttribute("Payment_Mode", " Mode:"+Payment_Mode);
	request.setAttribute("Paid_Amount",Paid_Amount );
	request.setAttribute("Payment_Details",Payment_Details );
	request.setAttribute("Update_Sucess", "Updated Sucessfully");
	request.getRequestDispatcher("Payment_Management.jsp").forward(request, response);
}
else
{
	request.setAttribute("Update_Error", "Problem in updation");
	request.getRequestDispatcher("Payment_Management.jsp").forward(request, response);
}


%>

</body>
</html>