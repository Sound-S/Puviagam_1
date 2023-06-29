package All_Codes;

import java.util.Properties;
import java.util.Random;
import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

public class mail_sending 
{

	public static void sending_mail(String Email_id, String password) 
	{
		
		
		String to = Email_id;
		String from = "torrentck3103@gmail.com";
		String subject = "Welcome to Puviagam || Account Details";
		
		String text1 = "Your Email-ID is : " + Email_id;
		String text2 = "      		Your Password is : " + password ;
		boolean b = mail_sending.sendEmail(to, from, subject, text1,text2);
		
		if(b)
		{
			System.out.println("Send Sucess");
		}
		else
		{
			System.out.println("Not Send Sucess");
		}
		
	}
	
	
	//Otp generate for forget password
	
	public static String Forget_Password_email_otp(String Email_id) 
	{
		//random otp generation
		String numbers = "0123456789";
		int length = 6;
		
		String combination = numbers;
		
		char[] password = new char[length];
		
		Random r = new Random();
		
		for(int i = 0; i < length; i++)
		{
			password [i] = combination.charAt(r.nextInt(combination.length()));
		}
		
		String pass = new String(password);
		
		System.out.println("Generated Password is " + new String(password));
		
		
		//gathering all data's for mail sending
		String to = Email_id;
		String from = "torrentck3103@gmail.com";
		String subject = "Puviagam || OTP Confirmation";
		
		String text1 = "Your OTP for Password change : ";
		String text2 = pass;
		boolean b = mail_sending.sendEmail(to, from, subject, text1,text2);
		
		if(b)
		{
			System.out.println("Send Sucess");
		}
		else
		{
			System.out.println("Not Send Sucess");
		}
		return pass;
		
	}
	
	
	
	public static boolean sendEmail(String to, String from, String subject, String text1, String text2) 
	{
        boolean flag = false;

        //logic
        //smtp properties
        Properties properties = new Properties();
        properties.put("mail.smtp.auth", true);
        properties.put("mail.smtp.starttls.enable", true);
        properties.put("mail.smtp.port", "587");
        properties.put("mail.smtp.host", "smtp.gmail.com");

        final String username = "torrentck3103@gmail.com";
        final String password = "bftuslqwveddbwdm";


        //session
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {

            Message message = new MimeMessage(session);
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setFrom(new InternetAddress(from));
            message.setSubject(subject);
            message.setText(text1 + text2);
            
            Transport.send(message);
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }


        return flag;
        
    }
	
	
	
	
	//During Registration for customer and supervisor Auto password generator 
	
	public static String auto_password()
	{
		
		String Uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		String Lowercase = "abcdefghijklmnopqrstuvwxyz";
		String numbers = "0123456789";
		String Spl_chars = "@$%&";
		int length = 10;
		
		String combination = Uppercase + Lowercase + numbers + Spl_chars;
		
		
		char[] password = new char[length];
		
		Random r = new Random();
		
		for(int i = 0; i < length; i++)
		{
			password [i] = combination.charAt(r.nextInt(combination.length()));
		}
		
		String pass = new String(password);
		
		//System.out.println("Generated Password is " + new String(password));
		return pass;
		
	}
}
