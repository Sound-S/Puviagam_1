package All_Codes;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/Estimation")
public class Estimation_calc extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static String Name;
	static String Email;
	static long Phone;
	static double Area;
	static String Door_cost;
	
	static double mainDoorAmount;
	static int No_of_bedrooms;
	static int No_of_washrooms;
	static int No_of_windows;
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		Name = request.getParameter("Name");
		Email = request.getParameter("email_id");
		Phone = Long.parseLong(request.getParameter("Mobile_No"));
		Area = Double.parseDouble(request.getParameter("Square_feet"));
		Door_cost = request.getParameter("Door_Cost");
		No_of_bedrooms = Integer.parseInt(request.getParameter("No_Of_rooms"));
		No_of_washrooms = Integer.parseInt(request.getParameter("Wash_Room"));
		No_of_windows = Integer.parseInt(request.getParameter("Windows"));
		
		try
		{
			float[] price=JDBC.Price();
			
			double sandQuantity=Area*1.8;              //sand
			double sandAmount=sandQuantity * price[0]; 
			
			double cementQuantity=Area*0.4;            //cement
			double cementAmount=cementQuantity * price[1]; 
			
			double brickQuantity=Area*8;                //brick
			double brickAmount=brickQuantity * price[2];
			
			double steelQuantity=Area*3.7;              //steel
			double steelAmount=steelQuantity * price[3]; 

			double outerpaintArea=Area*3;              //liters
			double outerPaintAmount=outerpaintArea * price[4];
			
			double innerpaintArea=Area*3;              //liters
			double innerPaintAmount=innerpaintArea * price[5];
			
			double basementAmount=Area * 0.291 * Area;   
			
			double flooring=Area * 1.2;        //per sq feet 
			double flooringAmount= flooring * price[6]; 
			
			double electrical_plumbingAmount=Area * price[7];  

			double bathroomMatreialsAmount= No_of_washrooms * price[8]; 

			double bathroomDoorAmount=No_of_washrooms * price[9]; 
			
			switch (Door_cost)
			{
			case "Basic":
			             mainDoorAmount = price[10];  
			             break;
			case "Premium":
				         mainDoorAmount = price[11]; 
			             break;
			case "Ultra_Premium":
				         mainDoorAmount = price[12]; 
			             break;
			}
			
			double bedRoomDoor_Amount= No_of_bedrooms * price[13];

			double windowsCost= price[14] * 25 * No_of_windows;  

			double kitchenGraniteAmount= price[15] * 25;   
			
			double AggregateQuantity = Area * 1.35;
			
			double AggregateAmount = AggregateQuantity*price[16];
			
			double totalCost = sandAmount + cementAmount + brickAmount + steelAmount + 
					           outerPaintAmount + innerPaintAmount + flooringAmount + 
					           basementAmount + electrical_plumbingAmount + bathroomMatreialsAmount + 
					           bathroomDoorAmount + mainDoorAmount + bedRoomDoor_Amount + windowsCost + 
					           kitchenGraniteAmount+AggregateAmount;
 
			
			
			System.out.println("hello"+" "+Name+" " +"the estimated amount for the construction is"+" "+totalCost);
             
			JDBC.temp_estimation(Name, Email, Phone, Area, sandQuantity, sandAmount, cementQuantity, cementAmount, 
					             brickQuantity, brickAmount, steelQuantity, steelAmount, outerpaintArea, 
					             outerPaintAmount, innerpaintArea, innerPaintAmount, basementAmount,
					             flooring, flooringAmount, electrical_plumbingAmount, bathroomMatreialsAmount,
					             bathroomDoorAmount, mainDoorAmount, bedRoomDoor_Amount, windowsCost, kitchenGraniteAmount,
					             totalCost,AggregateQuantity,AggregateAmount,No_of_bedrooms,No_of_washrooms,No_of_windows);
			
			
			
			
			request.setAttribute("Name",Name );
			request.setAttribute("email_id", Email);
			request.setAttribute("Mobile_No",Phone );
			request.setAttribute("Square_feet",Area);
			request.setAttribute("Door_Cost",Door_cost );
			request.setAttribute("No_Of_rooms",No_of_bedrooms );
			request.setAttribute("Wash_Room",No_of_washrooms );
			request.setAttribute("Windows",No_of_windows);
			
			request.setAttribute("Total_Ammount", "The total Estimation is :  "+ totalCost);
			request.getRequestDispatcher("Estimation.jsp").forward(request, response);
			
//			for(int j=0;j<7;j++)
//	 		 {
//	 			 System.out.println(price[j]);
//	 		 }
		} 
		catch (ClassNotFoundException | SQLException e) 
		{
			e.printStackTrace();
		}
		
	}
}
