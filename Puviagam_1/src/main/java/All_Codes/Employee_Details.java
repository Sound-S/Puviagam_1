package All_Codes;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/Insert")
public class Employee_Details extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	
	static boolean insert_result;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
		
		String Employee_Name = request.getParameter("Employee_Name");
		String Employee_Email = request.getParameter("Employee_Email");
		//String Employee_Password= request.getParameter("Employee_Password");
		String Employee_Password=mail_sending.auto_password();
		Long Employee_Phone = Long.parseLong(request.getParameter("Employee_Mobile_No"));
		String Employee_Address = request.getParameter("Employee_Address");
	
		try {
			insert_result=JDBC.Employee_Insert_Data(Employee_Name,Employee_Email,Employee_Password,
					Employee_Phone,Employee_Address  );
			
			if(insert_result)
			{
				
				mail_sending.sending_mail(Employee_Email, Employee_Password);
				
				request.setAttribute("Employee_Name",Employee_Name );
				request.setAttribute("Employee_Email",Employee_Email );
				request.setAttribute("Employee_Mobile_No",Employee_Phone );
				request.setAttribute("Employee_Address",Employee_Address );
				request.setAttribute("pass_sucess_msg", "Account created sucessfully");
				request.getRequestDispatcher("Employee_Details.jsp").forward(request, response);

			     
			}
			else
			{
				request.setAttribute("pass_err_msg", "Email Already Used");
			    request.getRequestDispatcher("Employee_Details.jsp").forward(request, response);
			}
			
			//System.out.println("sucess");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
