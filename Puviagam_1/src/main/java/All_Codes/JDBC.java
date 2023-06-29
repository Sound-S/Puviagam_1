
package All_Codes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class JDBC {
	
	public static Connection con;
	
   //connection
	public static void get_connection() throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.cj.jdbc.Driver");	
		String url="jdbc:mysql://localhost:3306/puviagam";
		String username="root";
		String Password="12345";
		con=DriverManager.getConnection(url,username,Password);
	}
	
	
	//Employee Details
	public static boolean Employee_Insert_Data(String employee_Name, String employee_Email, String employee_Password, Long employee_Phone, String employee_Address) throws ClassNotFoundException, SQLException
	{
		get_connection();
		
		String ins ="insert into employee(emp_name,emp_email_id,emp_password,emp_phone,emp_address) values(?,?,?,?,?)";
		PreparedStatement ps=con.prepareStatement(ins);
		
		ps.setString(1, employee_Name);
		ps.setString(2, employee_Email);
		ps.setString(3, employee_Password);
		ps.setLong(4, employee_Phone);
		ps.setString(5, employee_Address);
	
		
//		int ins_result =ps.executeUpdate();
//		
//		if(ins_result==1)
//		{
//			return true;
//		}
//	
//		return false;
		
		try 
		{
		ps.executeUpdate();
		return true;
		}
		catch(Exception E)
		{
		E.printStackTrace();
		return false;
		}
		
	}
	
	
		
    //customer details
	public static boolean Client_Insert_Data(String customer_Name, String customer_Email, String customer_Password, Long customer_Mobile_No, String customer_Gender,String customer_DOB,
			String customer_Address) throws SQLException, ClassNotFoundException {
        get_connection();
		
		String ins ="insert into customer(customer_name,customer_email_id, customer_password, customer_phone,  customer_gender, Date_of_Birth, customer_address) values(?,?,?,?,?,?,?)";
		PreparedStatement ps=con.prepareStatement(ins);
		
		ps.setString(1, customer_Name);
		ps.setString(2, customer_Email);
		ps.setString(3, customer_Password);
		ps.setLong(4, customer_Mobile_No);
		ps.setString(5, customer_Gender);
		ps.setString(6, customer_DOB);
		ps.setString(7, customer_Address);
		//ps.setString(8, project_Site_No);
		//ps.setString(9, site_Location);
		//ps.setString(10, site_Area);
		//ps.setString(11, site_District);
		//ps.setString(12, site_State);
		//ps.setLong(13, site_Pincode);
		//ps.setString(14, site_Details);
		
		try 
		{
		ps.executeUpdate();
		return true;
		}
		catch(Exception E)
		{
		E.printStackTrace();
		return false;
		}

	    }

	//site details
		public static boolean Site_Insert_Data(String customer_id, String site_Location,
				String site_Area, String site_District, String site_State, Long site_Pincode, String site_Details,String Site_Incharge,double Site_Estimation_Amount) throws SQLException, ClassNotFoundException {
			 get_connection();
			String ins="update customer set  site_location = ?, site_area=?, site_district=?, site_state=?,  site_pincode = ?,  site_details=?, emp_id=? ,total_estimated_amount=? where customer_id=?";
			PreparedStatement ps=con.prepareStatement(ins);
			
			System.out.println(customer_id);
			System.out.println(site_Location);
			System.out.println(site_Area);
			System.out.println(site_District);
			
			System.out.println(site_State);
			System.out.println(site_Pincode);
			System.out.println(site_Details);
			System.out.println(Site_Incharge);
			System.out.println(Site_Estimation_Amount);
			
			ps.setString(1, site_Location);
			ps.setString(2, site_Area);
			ps.setString(3, site_District);
			ps.setString(4, site_State);
			ps.setLong(5, site_Pincode);
			ps.setString(6, site_Details);
			ps.setString(7, Site_Incharge);
			ps.setDouble(8, Site_Estimation_Amount);
			ps.setString(9, customer_id);
			
			    try 
			    {
				ps.executeUpdate();
				return true;
				}
				catch(Exception E)
				{
				 E.printStackTrace();
				 return false;
				}
		}

	
	//Employee  login
	
     public static	boolean Check_Crediential_Employee(String email_id, String password) throws ClassNotFoundException, SQLException
     {
    	 get_connection();
    	 
    	 String Login_Employee_Query ="select * from employee where emp_email_id=? and emp_password=?";
    	 
    	 PreparedStatement ps=con.prepareStatement(Login_Employee_Query);
    	 ps.setString(1,email_id );
 		 ps.setString(2, password);
    	 
 		 ResultSet rs =ps.executeQuery();
 		 if(rs.next())
 		 {
		return true;
 		 }
 		 return false;
    	 
     }

//customer login
	public static boolean Check_Crediential_Customer(String email_id, String password) throws SQLException, ClassNotFoundException 
	{
         get_connection();
    	 
    	 String Login_Customer_Query ="select * from customer where customer_email_id=? and customer_password=?";
    	 
    	 PreparedStatement ps=con.prepareStatement(Login_Customer_Query);
    	 ps.setString(1,email_id );
 		 ps.setString(2, password);
    	 
 		 ResultSet rs =ps.executeQuery();
 		 if(rs.next())
 		 {
		return true;
 		 }
		return false;
	}
	
	
//price
	
	 public static float[] Price() throws ClassNotFoundException, SQLException
	    {
	        float[] sample = new float[17] ;
	        
	     // Return statement of the method.
         get_connection();
    	 
    	 String Login_Customer_Query ="select * from price_details";
    	 
    	 PreparedStatement ps=con.prepareStatement(Login_Customer_Query);
    	
 		 ResultSet rs =ps.executeQuery();
 		 
 		 while(rs.next())
 		 {
 			sample[0]=rs.getFloat(3);
 			sample[1]=rs.getFloat(4);
 			sample[2]=rs.getFloat(5);
 			sample[3]=rs.getFloat(6);
 			sample[4]=rs.getFloat(7);
 			sample[5]=rs.getFloat(8);
 			sample[6]=rs.getFloat(9);
 			
 			sample[7]=rs.getFloat(10);
 			sample[8]=rs.getFloat(11);
 			sample[9]=rs.getFloat(12);
 			sample[10]=rs.getFloat(13);
 			sample[11]=rs.getFloat(14);
 			sample[12]=rs.getFloat(15);
 			sample[13]=rs.getFloat(16);
 			sample[14]=rs.getFloat(17);
 			sample[15]=rs.getFloat(18);
 			sample[16]=rs.getFloat(19);	
 		 }
 
	        return sample;
	    }
	  
	   ///count employee
	         
	         public static int Count_employee() throws SQLException, ClassNotFoundException 
	         {
	        	 get_connection();
	        	 int count=0;

	        	 String Count_Query ="select count(SNO) from employee";

	        	 PreparedStatement ps=con.prepareStatement(Count_Query);


	        	 ResultSet rs =ps.executeQuery();


	        	 while(rs.next())
	        	 {
	        		 count =rs.getInt(1);
	        		 System.out.println(count);
	        	 }


	        	 return count;
	         }
	         
	         //count no.of.customers
	         
	         public static int Count_customer() throws SQLException, ClassNotFoundException 
	         {
	        	 get_connection();
	        	 int count_customer=0;

	        	 String Count_Query ="select count(SNO) from customer";

	        	 PreparedStatement ps=con.prepareStatement(Count_Query);


	        	 ResultSet rs =ps.executeQuery();


	        	 while(rs.next())
	        	 {
	        		 count_customer =rs.getInt(1);
	        		 System.out.println(count_customer);
	        	 }


	        	 return count_customer;
	         }
	         
	         //site number 
	         
	         public static String[] Get_Employee_Id_Name(String email_id) throws ClassNotFoundException, SQLException
	         {
	        	 get_connection();
	        	 
	        	 String[] Project_site = new String[2] ;

	        	 String Site_no_Query ="select emp_id ,emp_name from employee where emp_email_id=?";

	        	 PreparedStatement ps=con.prepareStatement(Site_no_Query);
	        	 ps.setString(1, email_id);
	        	 ResultSet rs=ps.executeQuery();
	        	 while(rs.next())
	        	 {
	        		 Project_site[0] =rs.getString(1);
	        		 Project_site[1] =rs.getString(2);
	        		 System.out.println(Project_site);
	        	 }
	        	 
				return Project_site;
	        	 
	         }

	        // temporary store the estimation details for all users who approaches
			public static void temp_estimation(String name, String email, long phone, double area, double sandQuantity,
					double sandAmount, double cementQuantity, double cementAmount, double brickQuantity,
					double brickAmount, double steelQuantity, double steelAmount, double outerpaintArea,
					double outerPaintAmount, double innerpaintArea, double innerPaintAmount, double basementAmount,
					double flooring, double flooringAmount, double electrical_plumbingAmount,
					double bathroomMatreialsAmount, double bathroomDoorAmount, double mainDoorAmount,
					double bedRoomDoor_Amount, double windowsCost, double kitchenGraniteAmount, double totalCost,
					double AggregateQuantity, double AggregateAmount,int No_of_bedrooms,int No_of_washrooms,int No_of_windows) throws SQLException, ClassNotFoundException 
			{
			
				get_connection();
				
				String ins ="insert into  temp_estimation(name, email_id, phone, date_of_estimation, area_measurement, sandQuantity, sandAmount, cementQuantity, cementAmount, brickQuantity, brickAmount, steelQuantity, steelAmount, outerpaintArea, outerPaintAmount, innerpaintArea, innerPaintAmount, basementAmount, flooring, flooringAmount, electrical_plumbingAmount, bathroomMatreialsAmount, bathroomDoorAmount, mainDoorAmount, bedRoomDoor_Amount, windowsCost, kitchenGraniteAmount, totalCost,AggregateQuantity,AggregateAmount,No_of_bedrooms,No_of_washrooms,No_of_windows) values(?,?,?,now(),?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
						                            
				PreparedStatement ps=con.prepareStatement(ins);
				
				ps.setString(1, name);
				ps.setString(2, email);
				ps.setLong(3, phone);
				ps.setDouble(4, area);
				ps.setDouble(5, sandQuantity);
				ps.setDouble(6, sandAmount);
				ps.setDouble(7, cementQuantity);
				ps.setDouble(8, cementAmount);
				ps.setDouble(9, brickQuantity);
				ps.setDouble(10, brickAmount);
				ps.setDouble(11, steelQuantity);
				ps.setDouble(12, steelAmount);
				
				ps.setDouble(13, outerpaintArea);
				ps.setDouble(14, outerPaintAmount);
				ps.setDouble(15, innerpaintArea);
				ps.setDouble(16, innerPaintAmount);
				ps.setDouble(17, basementAmount);
				ps.setDouble(18, flooring);
				ps.setDouble(19, flooringAmount);
				ps.setDouble(20, electrical_plumbingAmount);
				ps.setDouble(21, bathroomMatreialsAmount);
				ps.setDouble(22, bathroomDoorAmount);
				ps.setDouble(23, mainDoorAmount);
				ps.setDouble(24, bedRoomDoor_Amount);
				ps.setDouble(25, windowsCost);
				ps.setDouble(26, kitchenGraniteAmount);
				ps.setDouble(27, totalCost);
				ps.setDouble(28, AggregateQuantity);
				ps.setDouble(29, AggregateAmount);
				ps.setInt(30, No_of_bedrooms);
				ps.setInt(31, No_of_washrooms);
				ps.setInt(32, No_of_windows);
				
				System.out.println("data entered" + ps.executeUpdate());
				
			}
	         
			 
			//Get_Site_Supervisor_id
			public static ArrayList<String> Get_Site_Supervisor_id() throws ClassNotFoundException, SQLException {
				 get_connection();
	        	 
				 ArrayList<String> list=new ArrayList<String>();
	        	 String Query ="select *from employee";

	        	 PreparedStatement ps=con.prepareStatement(Query);


	        	 ResultSet rs =ps.executeQuery();


	        	 while(rs.next())
	        	 {
	        		 list.add(rs.getString(2));
	        		 list.add(rs.getString(3));
	        		 
	        	 }


	        	
				
				return list;
			}
			
			
			//Get_customer_id
			public static ArrayList<String> Get_Customer_id() throws ClassNotFoundException, SQLException {
				 get_connection();
	        	 
				 ArrayList<String> list=new ArrayList<String>();
				 
	        	 String Query ="select * from customer";

	        	 PreparedStatement ps=con.prepareStatement(Query);


	        	 ResultSet rs =ps.executeQuery();


	        	 while(rs.next())
	        	 {
	        		 list.add(rs.getString(2));
	        		 list.add(rs.getString(3));
	        		 
	        	 }


	        	
				
				return list;
			}
			
			
			//Get_site_id
			public static ArrayList<String> Get_Site_id(String Supervisor_id) throws ClassNotFoundException, SQLException {
				 get_connection();
	        	 
				 System.out.println("kkkkk---"+Supervisor_id);
				 ArrayList<String> list=new ArrayList<String>();
	        	 String Query ="select project_site_number from customer where emp_id=?";

	        	 PreparedStatement ps=con.prepareStatement(Query);
	        	 
	        	 ps.setString(1, Supervisor_id);

	        	 ResultSet rs =ps.executeQuery();


	        	 while(rs.next())
	        	 {
	        		 list.add(rs.getString(1));
	        		 
	        	 }


	        	
				
				return list;
			}
			
			//Delete_customer_id
			public static void Delete_Customer(String customer_id) throws ClassNotFoundException, SQLException
			{
				get_connection();
				String Query ="Delete from customer where customer_id=?";
				PreparedStatement ps=con.prepareStatement(Query);
				ps.setString(1, customer_id);
				
				ps.executeUpdate();
			    System.out.println("delete"+ps.executeUpdate());
				
			}
			
			
			//Resource Entry this is attendance
			
			public static int Resourse_Entry(String Site_Id,String Date,int male, int female) throws ClassNotFoundException, SQLException
			{
				get_connection();
				String Query ="insert into site_resource(Site_id,Attendence_entry_date,Attendence_entry_time,Male,Female) values(?,?,current_time(),?,?)";
				PreparedStatement ps=con.prepareStatement(Query);
				ps.setString(1,Site_Id );
				ps.setString(2,Date );
				ps.setInt(3,male );
				ps.setInt(4,female );
				
				return ps.executeUpdate();
			    
				
			}
			
			//Manager inventory show all site
			public static ArrayList<String> Show_manager_inventory() throws ClassNotFoundException, SQLException {
				 get_connection();
	        	 
				 
				 ArrayList<String> list=new ArrayList<String>();
	        	 String Query ="select project_site_number from customer";

	        	 PreparedStatement ps=con.prepareStatement(Query);
	        	 
	        	

	        	 ResultSet rs =ps.executeQuery();


	        	 while(rs.next())
	        	 {
	        		 list.add(rs.getString(1));
	        		 
	        	 }

				return list;
			}
			
			
			//inserting the initial values to the payment details table
			public static void initial_values_entry(String customer_id, double estimated_total_amount) throws ClassNotFoundException, SQLException
			{
				get_connection();
				String Query ="insert into payment_details values(?, now(), current_time(), ?,?,?,?)";
				PreparedStatement ps=con.prepareStatement(Query);
				ps.setString(1,customer_id );
				ps.setString(2, "NA" );
				ps.setInt(3, 0 );
				ps.setDouble(4, estimated_total_amount );
				ps.setString(5, "NA" );
				ps.executeUpdate();
	
			} 
			
			
			//take customer name for customer master dashboard
			
			public static String[] Take_Customer_Name_id_estAmount(String Email_id) throws ClassNotFoundException, SQLException {
				 get_connection();
	        	 
				 
				 String[] Customer_Name_Id_EstAmount=new String[3];
				 
	        	 String Query ="select customer_name,customer_id,FORMAT(total_estimated_amount, 1, 'en_IN') from customer where customer_email_id=?";

	        	 PreparedStatement ps=con.prepareStatement(Query);
	        	 ps.setString(1, Email_id);
	        	 
	        	

	        	 ResultSet rs =ps.executeQuery();


	        	 while(rs.next())
	        	 {
	        		 Customer_Name_Id_EstAmount[0]= rs.getString(1);
	        		 Customer_Name_Id_EstAmount[1]= rs.getString(2);
	        		 Customer_Name_Id_EstAmount[2]= rs.getString(3);
	        		 
	        	 }

				return Customer_Name_Id_EstAmount;
			}
			
			
			//forgot password email check customer
			
			public static int customer_check_email(String Email) throws ClassNotFoundException, SQLException
			{
				
				get_connection();
		    	 
		    	 String Customer_Query ="select * from customer where customer_email_id=?";
		    	 
		    	 PreparedStatement ps=con.prepareStatement(Customer_Query);
		    	 ps.setString(1,Email );
		 		 
		    	 
		 		 ResultSet rs =ps.executeQuery();
		 		 if(rs.next())
		 		 {
				return 1;
		 		 }
				
	        	 
	        	 
				return 0;
				
			}
			
			////forgot password email check for supervisor
			
			public static int supervisor_check_email(String Email) throws ClassNotFoundException, SQLException
			{
				
				get_connection();
		    	 
		    	 String Query ="select * from employee where emp_email_id=?";
		    	 
		    	 PreparedStatement ps=con.prepareStatement(Query);
		    	 ps.setString(1,Email );
		 		 
		    	 
		 		 ResultSet rs =ps.executeQuery();
		 		 if(rs.next())
		 		 {
				return 1;
		 		 }
				
	        	 
	        	 
				return 0;
				
			}
			
			//customer new password change
			public static boolean customer_New_password_entry(String Email,String password) throws ClassNotFoundException, SQLException
			{
				
				get_connection();
		    	 
		    	 String Customer_Query ="update customer set customer_password=? where customer_email_id=?";
		    	 
		    	 PreparedStatement ps=con.prepareStatement(Customer_Query);
		    	 ps.setString(1,password );
		    	 ps.setString(2,Email );
		    	 
		 		 int i= ps.executeUpdate();
		 		 if(i!=0)
		 		 {
				return true;
		 		 }
				
	        	 
	        	 
				return false;
				
			}
			
			
			//supervisor new password change
			public static boolean supervisor_New_password_entry(String Email,String password) throws ClassNotFoundException, SQLException
			{
				
				get_connection();
		    	 
		    	 String Supervisor_Query ="update employee  set emp_password=? where emp_email_id=?";
		    	 
		    	 PreparedStatement ps=con.prepareStatement(Supervisor_Query);
		    	 ps.setString(1,password );
		    	 ps.setString(2,Email );
		    	 
		 		 int i= ps.executeUpdate();
		 		 if(i!=0)
		 		 {
				return true;
		 		 }
				
	        	 
	        	 
				return false;
				
			}
			
			//getting balance amount from payment table
			
			public static String Getting_Balance_Amt(String Customer_id) throws ClassNotFoundException, SQLException
			{
				String Balance_Amt=null;
				get_connection();
		    	 
		    	 String Supervisor_Query ="select FORMAT(balance_amount, 1, 'en_IN') from payment_details where customer_id=?";
		    	 
		    	 PreparedStatement ps=con.prepareStatement(Supervisor_Query);
		    	 ps.setString(1,Customer_id );
		    	 
		    	 
		    	 ResultSet rs =ps.executeQuery();
		 		 while(rs.next())
		 		 {
		 			Balance_Amt=rs.getString(1); 
		 		 }
				
				return Balance_Amt;
				
			}
			
			//getting paid amount total
			public static float Getting_Total_paid_Amt(String Customer_id) throws ClassNotFoundException, SQLException
			{
				float Paid_total_Amt=0;
				get_connection();
		    	 
		    	 String Supervisor_Query ="select amount_paid from payment_details where customer_id=?";
		    	 
		    	 PreparedStatement ps=con.prepareStatement(Supervisor_Query);
		    	 ps.setString(1,Customer_id );
		    	 
		    	 
		    	 ResultSet rs =ps.executeQuery();
		    	 int i=1;
		 		 while(rs.next())
		 		 {
		 			Paid_total_Amt = Paid_total_Amt + rs.getFloat(i); 
		 		 }
				
				return Paid_total_Amt;
				
			}
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
		}