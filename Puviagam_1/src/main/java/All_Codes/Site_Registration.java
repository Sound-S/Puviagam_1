package All_Codes;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;


@WebServlet("/Site_data")
public class Site_Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	static boolean insert_Site_details;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Customer_id = request.getParameter("Customer_Id");
		//String Project_Site_No = request.getParameter("Project_Site_No");
		String Site_Location = request.getParameter("Site_Location");
		String Site_Area = request.getParameter("Site_Area");
		String Site_District = request.getParameter("Site_District");
		String Site_State = request.getParameter("Site_State");
	    Long Site_Pincode =  Long.parseLong(request.getParameter("Site_Pincode"));
		String Site_Details = request.getParameter("Site_Details");
		String Site_Incharge = request.getParameter("Site_Incharge");
		double Site_Estimation_Amount = Double.parseDouble(request.getParameter("Site_Estimation_Amount"));
		
		try {
			insert_Site_details=JDBC.Site_Insert_Data(Customer_id,Site_Location,
					Site_Area,Site_District,Site_State,Site_Pincode,Site_Details,Site_Incharge,Site_Estimation_Amount);
			
			//to send total estimated amount to payment details table
			
			JDBC.initial_values_entry(Customer_id, Site_Estimation_Amount);
			
			if(insert_Site_details)
			{
				request.setAttribute("customer",Customer_id );
				 request.setAttribute("pass_sucess_msg", "Registered Sucessfully");
			     request.getRequestDispatcher("Site_Register.jsp").forward(request, response);
			}
			else
			{
				request.setAttribute("pass_err_msg", "Email Already Used");
			     request.getRequestDispatcher("Site_Register.jsp").forward(request, response);
			}
		} catch (SQLException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
